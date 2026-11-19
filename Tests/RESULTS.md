# Offline validation — 2026-09-28

Result: **PASS**, ready for final in-game validation (`done`, not `tested`).

Tested distribution: revision `07f1f21c3b72f1a3b05b62fdc713fe82a6441cd7` (rerun 2026-09-28: description, author line, `About/PublishedFileId.txt` changed since 2026-09-13 run, so old result no longer matched shipped files). `run.log` records UTC time + SHA256 per shipped file. All shared checks same result as 2026-09-13.

Environment: Windows, PowerShell, RimWorld **1.6.4871 rev590**, installed SydailyFox
Workshop `3540588386/1.6`, ilspycmd 8.2 on .NET 8 with DOTNET_ROLL_FORWARD=Major.
Game Assembly-CSharp.dll SHA256:
`5CF1B5BE399D5B1C9C56CA72C9D35B4ECF307FEACF5859D04AC5A1AA5926356A`.

## Reproduce

```powershell
pwsh -NoProfile -File Tests/Run-Checks.ps1
```

Needs parent repo `scripts` dir, installed game + dependency, ilspycmd on PATH. Override SharedScripts, Dependency, Managed if installed elsewhere. Each shared checker runs in isolated child process. Missing prerequisites or nonzero exit codes fail run. Full game type list generated locally, ignored by Git.

## Observed results

| Check | Observed result |
| --- | --- |
| XML syntax, attribution copies, repository footer, texture paths, PNG decoding/dimensions/size | All pass |
| Check-DefRefs | One mod Def; all refs, ref types, parents resolve with dependency supplied |
| Check-XmlFields | Two files scanned; no unknown 1.6 fields |
| Check-ConfigErrors | 1/1 Def checked; 26 rules; no error |
| Check-TypeRefs | No unguarded third-party type ref |
| Check-XmlClasses | All nine referenced types resolve vs installed game class names |
| Check-DefInjected | Two keys, zero errors, no unverified findings |

Final translation run uses owned mod + vanilla targets (11,587 defs, 29 patches). Both owned fields explicitly declared; no inherited translation path to resolve. Previous dependency-inclusive run independently passed same two keys (11,681 defs).

## Technical review of native behavior

Read installed assembly via ilspycmd; no game code redistributed here:

- CompRefuelable.CompTick gates normal fuel consumption on cached flick switch.
- CompRefuelable.ShouldBeLitNow returns HasFuel.
- CompGlower.ShouldBeLitNow checks FlickUtility.WantsToBeOn + IThingGlower implementations on building, incl. its fuel component.

Supports fuel/switch wiring in shipped definition. Source inspection only — not execution of those methods in colony, not evidence of rendering or persistence.

## Applicability and limits

- Mod = XML + PNGs only: compilation, custom-code unit tests, settings serialization, custom MainButtons integration tests not applicable.
- Automated XML validation = meaningful offline test layer here. Don't duplicate native game implementation in artificial behavioral unit tests.
- ConfigErrors checker implements subset of game rules. Computed properties, Unity init, map-dependent behavior, loaded-mod interaction need TESTING.md scenarios. Mod adds no patches; inherited fields checked with installed parent available. Excluded race/weapon cross-graph rules don't apply to this sculpture. Remaining runtime rules explicitly part of final game validation.
- No in-game scenario run here. All 14 TESTING.md scenarios pending, incl. FR/EN UI, logs, actual refuelling/switching, art generation, meditation, new/existing saves. Record game/dependency versions + observed results when running.
- Native app control unavailable this session. Don't infer gameplay pass from these automated results or existing Player.log.