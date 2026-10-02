# In-game scenarios, run by Pickle

The scenarios of [TESTING.md](../../TESTING.md) that a running game is needed for, and only those.
`Mod/` is a companion mod, **Fox Lamp Renew - Pickle tests**, never published. It holds the feature files
and a small step assembly (`Source/`, built into `Mod/Pickle/Assemblies/`), so nothing test-related ships in
the Workshop folder.

## Status

Written 2026-09-28, first runs 2026-09-28 and 29, state read from the evidence on disk on 2026-10-02.

- **English, minimal:** 16 scenarios discovered. `Evidence/20260928-english` (2026-09-28): 12 passed, 2 failed, 2 skipped by
  their `@requires`. The 2 failures were step bugs (the minify step destroyed the lamp before taking it out; the
  construction scenario had no builder reach the stockpile), fixed in `6ec3002` and replayed together with the meditation
  scenario: 3 of 3 (`Evidence/20260928-english-fix`, 2026-09-29). Every English scenario therefore has a green run on the
  current logic. (The old line "English pass 16 of 16" counted the 2 skipped ones; they are played in the incompatibility pass.)
- **French, minimal** (`Evidence/20260928-french`, 2026-09-28): 13 passed, 1 failed (the same minify step, on the step DLL from
  before the fix), 2 skipped. **The minify scenario has never been green in French, and `02-construction` is not proven to
  have run on the fixed staging there**: both are new, not non-regression.
- **Incompatibility pass** (`Evidence/20260929-incompat-3`, ticket `8b2f`): 2 of 2 passed after `08-incompatible-fork` was
  rewritten to assert the real finding: the 1.5 fork's `LoadFolders.xml` has no `v1.6` entry, so it contributes no Defs under
  1.6 and nothing collides.
- **The `@review` captures** (night lit and off, the inspect pane in each language) have not been opened by a person.

Next, in the order AUDIT.md asks for: a small French ticket for the two new scenarios, then the full suite in both languages
on the final revision (non-regression, last, together).

## The passes

| Pass | Map | Language | What it establishes |
| --- | --- | --- | --- |
| Minimal, English | none (the default set: Core, DLCs, Harmony, RimLogging, Pickle, SydailyFox, this mod) | English | The mod stands on its own and beside its one hard dependency |
| Minimal, French | none | French | Same, with the French text |
| Declared incompatibility | `wsl-deps.incompat-foxlamp15.map` | English | The 1.5 fork loads no Defs under 1.6, so it does not collide (`08-incompatible-fork`) |

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

`02-construction` has a colonist build a 24 000-work sculpture. Pickle's watchdog kills the run when one scenario passes
its limit, which the launcher sets to 300 s by default (Ticket-Dispatcher SUBMIT.md); if that scenario is cut off, add `-Extra '-pickle-scenario-timeout=600'`.

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
| `08-incompatible-fork` (`@requires`) | the 1.5 fork beside this mod | both mods loaded; only this mod's `Fox_Lamp` exists; no error names the fork | none |

## What a person looks at

| Capture | The one question |
| --- | --- |
| `03` "fox lamp, lit at night" | Is the pool warm amber, about the size of a torch's, and does the sculpture read as lit from inside its frame? Is the sculpture drawn in its own marble greys, with no tint and no solid dark or magenta silhouette (TESTING.md 7)? |
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

**Disk state, 2026-10-02 (minified from 91 MB to about 14 MB):** four folders remain in `Evidence/`, each holding
`summary.json`, `summary.md`, `junit.xml`, `Player.log`, `evidence-complete.txt`:

| Folder | Why it stays |
| --- | --- |
| `20260928-english` | Latest English report for 11 of the 14 non-skipped scenarios (the 3 `@review` captures are kept there) |
| `20260928-english-fix` | Latest English report for the 3 scenarios fixed in `6ec3002` |
| `20260928-french` | Latest French report (13 green; the red minify scenario is replaced by the next French ticket); its `07` capture is kept |
| `20260929-incompat-3` | Latest incompatibility pass, 2 of 2 |

`report.html`, `messages.ndjson` and every non-`@review` capture were deleted; the first incompatibility folders
(`20260928-incompat`, no report, and `20260928-incompat-2`, red on an obsolete assertion) were deleted as superseded.
Each folder goes as soon as a final run replaces what it proves.
