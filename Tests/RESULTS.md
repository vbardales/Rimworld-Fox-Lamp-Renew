# Offline validation — 2026-09-13

Result: **PASS**, ready for final in-game validation (`done`, not `tested`).

Tested distribution: revision `a88095fd927706409966bb6d870502a24c5ad5b8`.
`run.log` records UTC time and SHA256 for every shipped file. No shipped file changed
after that run; subsequent changes concern tests and documentation only.

Environment: Windows, PowerShell, RimWorld **1.6.4871 rev590**, installed SydailyFox
Workshop `3540588386/1.6`, ilspycmd 8.2 on .NET 8 using DOTNET_ROLL_FORWARD=Major.
Game Assembly-CSharp.dll SHA256:
`5CF1B5BE399D5B1C9C56CA72C9D35B4ECF307FEACF5859D04AC5A1AA5926356A`.

## Reproduce

```powershell
pwsh -NoProfile -File Tests/Run-Checks.ps1
```

Requires the parent repository's `scripts` directory, the installed game and dependency,
and ilspycmd on PATH. Override SharedScripts, Dependency and Managed when installed elsewhere.
Each shared checker runs in an isolated child process. Missing prerequisites and nonzero
exit codes fail the run. The full game type list is generated locally and ignored by Git.

## Observed results

| Check | Observed result |
| --- | --- |
| XML syntax, attribution copies, repository footer, texture paths, PNG decoding/dimensions/size | All passed |
| Check-DefRefs | One mod Def; all references, reference types and parents resolve with dependency supplied |
| Check-XmlFields | Two scanned files; no unknown 1.6 fields |
| Check-ConfigErrors | One of one Def checked; 26 rules; no error |
| Check-TypeRefs | No unguarded third-party type reference |
| Check-XmlClasses | All nine referenced types resolve against installed game class names |
| Check-DefInjected | Two keys, zero errors, no unverified findings |

The final translation run uses the owned mod and vanilla targets (11,587 defs, 29 patches).
Both owned fields are explicitly declared; no inherited translation path needs resolution.
The previous dependency-inclusive run independently passed the same two keys (11,681 defs).

## Technical review of native behavior

Read the installed assembly using ilspycmd; no game code is redistributed here:

- CompRefuelable.CompTick gates normal fuel consumption on the cached flick switch.
- CompRefuelable.ShouldBeLitNow returns HasFuel.
- CompGlower.ShouldBeLitNow checks FlickUtility.WantsToBeOn and the IThingGlower
  implementations on the building, including its fuel component.

This supports the fuel/switch wiring in the shipped definition. It is source inspection,
not execution of those methods in a colony and not evidence of rendering or persistence.

## Applicability and limits

- This mod contains only XML and PNGs: compilation, custom-code unit tests, settings
  serialization and custom MainButtons integration tests are not applicable.
- Automated XML validation is the meaningful offline test layer for this mod. Do not
  duplicate the native game implementation in artificial behavioral unit tests.
- The ConfigErrors checker implements a subset of the game's rules. Computed properties,
  Unity initialization, map-dependent behavior and interaction between loaded mods require
  the scenarios in TESTING.md. The mod adds no patches; inherited fields were checked with
  the installed parent available. Excluded race/weapon cross-graph rules do not apply to this
  sculpture. Remaining runtime rules are explicitly part of final game validation.
- No in-game scenario has been run here. All 14 scenarios in TESTING.md remain pending,
  including FR/EN UI, logs, actual refuelling/switching, art generation, meditation and
  new/existing saves. Capture game/dependency versions and observed results when running them.
- Native application control is unavailable in this session. Do not infer a gameplay pass
  from these automated results or an existing Player.log.
