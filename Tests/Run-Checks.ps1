param(
    [string]$SharedScripts = (Join-Path $PSScriptRoot '..\..\scripts'),
    [string]$Dependency = 'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\3540588386\1.6',
    [string]$Managed = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\RimWorldWin64_Data\Managed'
)
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot
$mod = Join-Path $root 'Mod'
$shell = (Get-Process -Id $PID).Path
function Check($condition, $message) {
    if (-not $condition) { throw $message }
    Write-Output "PASS: $message"
}
function Run-Shared($name, $arguments) {
    $checker = Join-Path $SharedScripts "$name.ps1"
    if (-not (Test-Path $checker)) { throw "Required checker unavailable: $checker" }
    $output = & $shell -NoProfile -File $checker @arguments 2>&1
    $code = $LASTEXITCODE
    $output | Set-Content (Join-Path $PSScriptRoot "$name.log")
    $output | Write-Output
    if ($code -ne 0) { throw "$name failed with exit $code" }
}
Write-Output "UTC: $([DateTime]::UtcNow.ToString('o'))"
Write-Output "Revision: $(& git -C $root rev-parse HEAD)"
Get-ChildItem $mod -Recurse -File | ForEach-Object {
    $h = Get-FileHash $_.FullName
    Write-Output "INPUT $($_.FullName.Substring($root.Length+1)): $($h.Hash)"
}
foreach ($file in Get-ChildItem $mod -Recurse -Filter *.xml) {
    $null = [xml](Get-Content $file.FullName -Raw)
}
Check ((Get-FileHash "$root\ATTRIBUTION.md").Hash -eq (Get-FileHash "$mod\ATTRIBUTION.md").Hash) 'Distributed attribution equals root attribution'
[xml]$about = Get-Content "$mod\About\About.xml" -Raw
Check ($about.ModMetaData.description.Trim().EndsWith('[url='+$about.ModMetaData.url+']Source code on GitHub[/url]')) 'Description footer matches repository URL'
[xml]$defs = Get-Content "$mod\Defs\Fox_Lamp.xml" -Raw
foreach ($texture in @($defs.Defs.ThingDef.graphicData.texPath, $defs.Defs.ThingDef.uiIconPath)) {
    Check (Test-Path "$mod\Textures\$texture.png") "Texture reference resolves: $texture"
}
Add-Type -AssemblyName System.Drawing
foreach ($spec in @(@('Preview',896,504),@('ModIcon',128,128))) {
    $file = Get-Item "$mod\About\$($spec[0]).png"
    $img = [Drawing.Image]::FromFile($file.FullName)
    try {
        Check ($img.Width -eq $spec[1] -and $img.Height -eq $spec[2] -and $img.RawFormat.Guid -eq [Drawing.Imaging.ImageFormat]::Png.Guid) "$($spec[0]) PNG dimensions"
        Check ($file.Length -lt 1000000) "$($spec[0]) below 1 MB"
    } finally { $img.Dispose() }
}
Run-Shared 'Check-DefRefs' @('-ModPath',$mod,'-AlsoScan',$Dependency,'-Managed',$Managed)
Run-Shared 'Check-XmlFields' @('-ModPath',$mod,'-Managed',$Managed)
Run-Shared 'Check-ConfigErrors' @('-ModPath',$mod,'-AlsoScan',$Dependency,'-Managed',$Managed)
Run-Shared 'Check-TypeRefs' @('-ModPath',$mod,'-Managed',$Managed)
# Dump names only, not game source. ilspycmd 8 can run on the installed .NET 8 runtime.
$env:DOTNET_ROLL_FORWARD = 'Major'
$types = & ilspycmd -l c (Join-Path $Managed 'Assembly-CSharp.dll')
if ($LASTEXITCODE -ne 0) { throw 'Game type enumeration failed' }
$typeFile = Join-Path $PSScriptRoot 'game-types.txt'
$types | Where-Object { $_ -match '^Class ' } | ForEach-Object { $_ -replace '^Class ','' } | Set-Content $typeFile
Run-Shared 'Check-XmlClasses' @('-ModPath',$mod,'-TypeLists',$typeFile)
# The two owned translation fields are explicit and do not require parent inheritance.
Run-Shared 'Check-DefInjected' @('-TransMod',$mod,'-Managed',$Managed)
Write-Output 'PASS: all applicable offline checks completed. No in-game result is implied.'
