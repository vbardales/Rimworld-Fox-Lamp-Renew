# In-game scenarios, run by Pickle

The scenarios of [TESTING.md](../../TESTING.md) that a running game is needed for, and only those.
`Mod/` is a companion mod, **Fox Lamp Renew - Pickle tests**, never published. It holds the feature files
and a small step assembly (`Source/`, built into `Mod/Pickle/Assemblies/`), so nothing test-related ships in
the Workshop folder.

## Status

Written 2026-09-28. **Never run.** The step assembly compiles against the game and Pickle references; no
scenario has been played, no expression has been checked against Pickle's engine, and no `@review` capture
has been taken. A green run will say that the trajectory ran, not that an image shows anything.

## The passes

| Pass | Map | Language | What it establishes |
| --- | --- | --- | --- |
| Minimal, English | none (the default set: Core, DLCs, Harmony, RimLogging, Pickle, SydailyFox, this mod) | English | The mod stands on its own and beside its one hard dependency |
| Minimal, French | none | French | Same, with the French text |
| Declared incompatibility | `wsl-deps.incompat-foxlamp15.map` | English | The 1.5 fork still collides as declared (`08-incompatible-fork`) |

Every other pass of the matrix in `PickleTools/Authoring/README.md` is **not applicable**, and why:

- **Optional integrations: none.** The About declares one hard dependency and no `loadAfter` beyond it; the
  mod has no patch, no `LoadFolders` and no `MayRequire`.
- **DLC absent: not applicable.** The `Artistic` meditation focus is a Core def and nothing else here touches
  a DLC, so there is no guard to exercise without one.
- **Restart sequence: not applicable.** Nothing here reads state a previous process wrote; the save round trip
  in `05-save-reload` is within one process, as for every Pickle suite.

Run each pass through the shared launcher, never by hand (see `AUDIT.md` and `PickleTools/Headless/README.md`):

```powershell
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod FoxLampRenew -Language English
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod FoxLampRenew -Language French
powershell.exe -ExecutionPolicy Bypass -File scripts/Run-PickleWsl.ps1 -Mod FoxLampRenew -DepMap wsl-deps.incompat-foxlamp15.map -Filter "@requires:mg.ferianstory.foxlamp"
```

`02-construction` has a colonist build a 24 000-work sculpture. Pickle's watchdog kills a run at 120 s per
scenario and the launcher does not raise it: if that scenario is cut off, add `-Extra "-pickle-scenario-timeout=300"`.

## The features

| Feature | What it stages | Assertions | Capture |
| --- | --- | --- | --- |
| `01-loads` | the game's real load | mod order; the def exists, is this mod's, is listed in `AF_Thankyou`, needs no research; Beauty, focus strength and cost through the stat pipeline; a save loads with no error | none |
| `02-construction` (`@slow`) | a colonist builds the lamp from a blueprint | it is a `Building_Art`, has a generated title and author, carries no `CompQuality`, reads Beauty 800 | none |
| `03-light-fuel-switch` | a built lamp | lit and full on completion; accepts hay, wood logs and chemfuel only; switch off, run dry, refuel | 2 stills at night |
| `04-meditation-and-moving` | a built lamp | offered as an `Artistic` focus at 0.4; minified and put back keeping its art title | none |
| `05-save-reload` | a lamp with known fuel and a title | same fuel, same title, no error after a reload | none |
| `06-language` | the active language | the description starts in the language of the pass; the label stays `Fox Lamp` in both | none |
| `07-inspect-pane` | a selected lamp | it is a `Building_Art` before the capture | 1 still, in the language of the pass |
| `08-incompatible-fork` (`@requires`) | the 1.5 fork beside this mod | both mods loaded; the duplicate `Fox_Lamp` is logged | none |

## What a person looks at

| Capture | The one question |
| --- | --- |
| `03` "fox lamp, lit at night" | Is the pool warm amber, about the size of a torch's, and does the sculpture read as lit from inside its frame? |
| `03` "fox lamp, switched off at night" | Is the ground dark again, the sculpture still standing? |
| `07` "its inspect pane", both languages | Is there a Beauty line reading 800, a fuel bar and a switch? Any raw key, English left in French, broken accent, clipped line or wrong paragraph break? |

## Scope: what stays out of Gherkin, and why

Everything provable outside the game is proved outside it, by `../Run-Checks.ps1` and its shared checkers.
None of that is repeated here. **No scenario is `@wip`.** The reasons for what is left out are written in the
header of the feature that would have held it. In short:

- **TESTING.md 1, this mod without SydailyFox:** not applicable, the game does not activate a mod without its
  hard dependency; the declaration is checked offline.
- **6.7 to 6.9, no heat, no flame, no fire:** the absence of comps and a Flammability of 0, read off the def.
- **Fuel draining over thirty days:** too slow to observe, and vanilla's own code.
- **8 and 9, drawn at 4.92 cells, walk-through:** authored def fields read offline; the picture is covered by the
  night captures.
- **13.3, removing the mod from a colony, and 13.4, loading a save made before the light existed:** the first is
  the game's own missing-content handling; the second needs a save no step can produce.

## Evidence: what to keep after a run

Reports are gitignored (`Evidence/`, `runs/`, `.build/`) and can reach gigabytes. Launch with
`-EvidenceDir Tests/Pickle/Evidence/<run>`, check `exitReason` and the discovered/played counts, then keep:

- the latest run per pass and scenario for the revision now in the repository (`summary`, `junit`, `Player.log`);
- the `@review` captures a person has actually opened, minified, for the two stills of `03` and the one of `07`
  in each language;
- one text line per run in `docs/runs/`, committed, citing the revision and the pass.

Delete the rest as soon as a newer report replaces it: a report about a superseded build proves nothing about
the current one. Never keep a whole `screenshots/` folder, which the shared report folder fills with every mod's
files. Never delete a report a `STATUS.md` field still points to; repoint it first.
