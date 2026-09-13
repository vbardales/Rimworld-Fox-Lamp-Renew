---
localization: complete
translation_en: complete
translation_fr: complete
mod:          Fox Lamp Renew (unofficial)
packageId:    nelim.foxlamprenew
repo:         Rimworld-Fox-Lamp-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   neither the 1.5 mod folder nor its Workshop page says anything
dependencies: verified
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: in-game scenarios, logs, English/French UI and save regressions not executed.
session:      local_7c385da5-e8e6-4eb1-92ff-dd3e44a2b6ec
updated:      2026-09-13, evidence-based workflow audit
settings_audit: not_applicable
audit_revision: a88095fd927706409966bb6d870502a24c5ad5b8
audit_result: passed_through_done
---

# Technical validation — 2026-09-13

**preTest -> done**. This is the current result; earlier audit sections below are historical.
The reproducible Tests/Run-Checks.ps1 suite passed against the distribution committed as
`a88095fd927706409966bb6d870502a24c5ad5b8`. Tests/RESULTS.md records the environment,
applicability decisions, individual results and runtime limitations; Tests/run.log records
all shipped-file SHA256 hashes. Shared XML checks resolved nine types, every Def reference
and parent, all fields, and both translations; 26 offline consistency rules passed.
No distribution file changed during technical validation. No custom-code build or settings
unit test applies. TESTING.md contains the final functional scenarios, still unexecuted.

`done` means ready for final in-game validation, not tested in game. `tested_on` remains empty.
Next: execute TESTING.md in RimWorld 1.6 with the required dependency chain, inspect logs and
FR/EN UI, and cover new and existing saves. Native application control is unavailable in
this session, so no gameplay result is claimed. No push or Workshop publication performed.

---
# Corrections and revalidation — 2026-09-13

**in monorepo -> preTest** under the supplied ordered workflow. All gates through dependency
validation now pass. This section supersedes the audit findings below, which are retained as
history. HEAD remains ec6f3d93512c2091ab93b710c5dd384514f9d953; results include local changes.

- Corrected root attribution: Renew identifies a continuation and grants no licence or permission.
  Synchronized the distributed copy. Both SHA256 hashes are now
  05385492552A9B05C447A0FD06F35FE9AA019C5239C6DA461DA40777BF1CDD29.
- Added the exact final Source code on GitHub BBCode link to the About description. Its target
  matches About URL and the previously verified public GitHub origin. XML reparsed successfully.
- Rebuilt the existing HTML composition without changing the authored illustration. Renew is
  65 percent in secondary ink; the unofficial tag and 1.6 badge are installed. Main title and
  summary share primary ink. PNG: 896 x 504, 337,152 bytes.
- Palette source: Art/preview-palette.json; composition: Art/preview.html; renderer:
  Art/render-preview.cjs. The muted brown ground supplies the veil and warm sand secondary;
  the existing light pool supplies the more saturated orange accent. Both remain visibly distinct.
- Chrome rendered with Segoe UI available and document.fonts.ready awaited. Direct inspection
  at 896 x 504 and 268 x 151 passed: title, suffix and version readable, rule visible, no clipping
  or overlap. The small summary remains intended for the full-size view.
- Contrast measured over every background pixel in each text bounding rectangle using
  Art/preview-background.png: title >=10.01:1, suffix >=7.10:1, tag >=5.92:1,
  summary >=8.58:1. Badge ink #17120E on opaque #FF9600 exceeds 8:1.
- Preserved Art/Preview.png without overlay and Art/preview-thumbnail.png for QA.
- git diff --check passed. Existing README and About edits were preserved. No push or publication.

Settings, translation paths and dependency evidence from the audit remains valid: no ThingDef,
in-game translation, assembly or dependency declaration changed. No in-game success is claimed.
The next gate is preTest -> done: establish applicable technical regression coverage and its
results; the existing shared XML/path validation does not certify all native component wiring.
Final in-game scenarios remain pending for done -> tested.

---
# Historical workflow audit — 2026-09-13

This section supersedes the historical stage interpretation and the historical claim that
only an in-game run remains. History below is retained, not treated as current evidence.

**Previous `in monorepo` -> retained `in monorepo`**, now an evidence-based gate result.
Here `in monorepo` maps to **dansMonoRepo**, the first workflow state. It is not a claim
about repository location: `detached: yes` is verified. No sidebar move or sign-off is required.
The first transition is blocked by documentation defects, not by Git or a monorepo remote.

## Scope and reproducibility

- Standalone repository: `C:\Users\nelim\Documents\rimworld\FoxLampRenew`.
  Actual distribution: its `Mod/` subdirectory.
- HEAD: `ec6f3d93512c2091ab93b710c5dd384514f9d953`.
- Before the audit, `git status --porcelain=v1` reported local edits in
  `Mod/About/About.xml`, `README.md` and `STATUS.md`. The audit includes those working-tree
  edits, not HEAD alone. Only STATUS.md was edited by this audit; no build, image generation,
  publication, commit or gameplay change was performed.
- Read parent AGENTS.md, PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and TRANSLATIONS.md.
  The supplied audit prompt takes precedence, including the source-only no-settings exception.
- `git rev-parse --show-toplevel`, `git remote -v`, `git rev-parse HEAD` verified isolation,
  origin and revision. `gh repo view vbardales/Rimworld-Fox-Lamp-Renew --json
  nameWithOwner,visibility,url` returned PUBLIC. `git ls-remote origin HEAD` returned the
  same SHA as local HEAD. Initial sandbox/network access failed; the read-only retry succeeded.

## Ordered gate results

| Transition | Result | Evidence / limitation |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | **Defect found** | Git isolation, public GitHub repository and pushed commit verified. Identity is coherent. Required distributed attribution copy is stale and root attribution misstates the meaning of Renew. |
| horsMonoRepo -> ModIcon generated | Independently validated | XML-only implementation; no Source, C#, project or shipped DLL. Build is not applicable. Installed PNG is 128 x 128, 24,403 bytes; inspected directly. No unfinished feature is established by the inventory. |
| ModIcon generated -> Preview generated | Independently validated | Installed PNG is 896 x 504, 352,766 bytes, below 1 MB; inspected directly. Sprite composition in Art/preview.html is an existing rendered artifact; no historical AI-generation proof is required. |
| Preview generated -> preOptions | **Defect found** | English description and metadata suffix exist, but final GitHub link is missing. Preview renders Renew at full title size in the primary ink; secondary suffix treatment is absent. Unofficial tag and 1.6 badge are absent. |
| preOptions -> options | Independently validated; settings not applicable | Inventory and rationale below. No empty settings page or MainButtons shortcut. |
| options -> l10n | Independently validated | Two owned text fields, two filled FR injection paths, native EN source. Shared validator passed. Runtime language checks remain separate. |
| l10n -> preTest | Independently validated | Required parent, architect tab and both categories found in installed dependency 1.6 files; package and load order agree. |
| preTest -> done | **Not fully verified** | TESTING.md provides 14 functional scenarios with preconditions/actions/expectations. XML parsing and translation validation passed; no project-specific automated behavior/regression suite or complete technical-test applicability record exists. These checks alone do not establish all shipped behavior. |
| done -> tested | **Not verified** | No in-game scenario, log review, bilingual UI, new-colony or existing-save test was performed during this audit. Historical status also records no run. |

## First blocking gate: attribution and rights documentation

`git diff --no-index -- ATTRIBUTION.md Mod/ATTRIBUTION.md` found substantive differences:
the distributed copy omits the entire lighting-change section and retains the old position
on balancing. This is not a newline-only mismatch. SHA256:

- Root: `5EA8FA4617293A687D368FC774D16C034865187F60601C6FD6681F3C1F866CEC`.
- Distributed: `F27B004219AE65E83FD6276423798EBE1917DFFE5564988234ED9CDD026363B0`.

Root ATTRIBUTION.md says, “The licence for that is the `Renew` suffix”. A naming convention
is not an upstream licence or permission under PUBLISHING.md. Correct that assertion and
synchronize the distributed copy to pass this gate. Do not invent a third-party LICENSE.
The `silent` classification is supported by the recorded source research and installed
fork metadata (versions 1.1 through 1.5, no declared 1.6); no fresh Workshop permission
investigation was performed. Public visibility and the exact `(unofficial)` metadata/README
notice are consistent with the workflow classification, which itself grants no permission.
English README, CHANGELOG and attribution documents exist. Absence of a LICENSE is not
independently classified as a defect where no applicable upstream licence was established.

## Showcase and description audit

Both About PNGs decoded as PNG and were visually inspected. The icon is legible fox/lantern
art. The Preview is a sprite on a tiled brown background with readable title and amber rule;
its deliberate sprite-composition choice is documented in Art/README.md. No speculative
camera defect is raised, and no historical comparison screenshot is demanded.

The next showcase gate fails on directly visible overlay differences: Renew is neither
reduced to 65 percent nor colored with secondary ink, and the unofficial tag and version
badge are missing. Art/preview.html confirms the single h1 style and absent elements.
Secondary/accent separation must be reviewed after the missing secondary treatment exists.
The metadata name already has the correct suffix; there are no connecting words to reduce.
The final description currently ends with the adoption clause, not the mandatory
`[url=https://github.com/vbardales/Rimworld-Fox-Lamp-Renew]Source code on GitHub[/url]`.
The target repository and About URL were verified and match origin.

## Settings audit

Result: `not_applicable`. Inventory: one ThingDef, two game textures, no assembly, custom
UI, settings serialization, MainButtonDef, patches or LoadFolders in this mod. The inherited
AF_NaturalBuildingBase was inspected: it adds ordinary building properties, no settings UI.
Fuel choice, refuelling and on/off control belong to vanilla per-building comps. Beauty,
work cost, fuel capacity and light radius are authored balance constants, with no documented
user need to expose them as global settings. No manual XML configuration is prescribed.
Therefore no useful settings page is missing, and no empty page or shortcut is shipped.
Settings persistence/input/integration tests are not applicable. No RIMMSQOL or other
customization integration was tested or claimed. Gameplay behavior remains subject to TESTING.md.

## Translation and XML audit

Inventory: Fox_Lamp.label and Fox_Lamp.description. English lives in the ThingDef; French
contains both nonempty entries. The identical proper-name label is deliberate. The description
was read in both languages; paragraph breaks, author/date and meaning are retained. No
format parameters, custom rich-text tags, Keyed strings or code-owned UI exist. Art name and
description generation refer to native NamerArtSculpture / ArtDescription_Sculpture rather
than owned grammar strings. Native component UI is not a missing mod-owned translation.

Executed from the standalone repository:

```powershell
& ..\scripts\Check-DefInjected.ps1 -TransMod "$PWD\Mod" -Targets @(
  "$PWD\Mod",
  'C:\Program Files (x86)\Steam\steamapps\workshop\content\294100\3540588386'
) *>&1
Get-ChildItem Mod -Recurse -Filter *.xml | ForEach-Object {
  $null = [xml](Get-Content $_.FullName -Raw)
}
```

Validator exit 0: 49 patch operations applied, 11,681 defs indexed, **2 keys checked,
0 errors**, no UNVERIFIED findings reported. All three shipped XML files parsed successfully.
This is resource/path validation, not proof of runtime UI or all building behavior. All three
translation fields mean static coverage complete; English/French in-game UI remains unverified.

## Dependencies and tests

Installed Workshop dependency 3540588386 declares Mlie.AFSydailyFox and RimWorld 1.6.
Its 1.6 Defs contain AF_NaturalBuildingBase, AF_Thankyou,
AF_TC_RimFurry_Building_Thankyou and AF_TC_RimFurry_Building_Thankyou_Y. The mod's
modDependencies and loadAfter both name that package. Incompatible fork metadata confirms
mg.ferianstory.foxlamp. There are no conditional patches or version-load branches in this mod.
Harmony is declared by SydailyFox as its own required dependency; this XML-only mod does
not directly call Harmony and need not add a redundant direct dependency.

The automated shared DefInjected test and XML parse checks above passed against the working
tree. No compilation/unit test of custom code applies because none exists. Broader technical
coverage of native-comp wiring has not been certified: classify meaningful automated checks
versus game-only checks before claiming done, without adding artificial tests. TESTING.md is
an unexecuted scenario specification, not a results record. In particular, lighting/fuel/switch,
art generation, meditation and save migration still need their specified game validation.

## Strict next action and nonblocking notes

To cross the next transition only: correct the rights-documentation wording and synchronize
Mod/ATTRIBUTION.md, then recheck those documents. Git detachment and pushing are already proven.
Later blockers do not require redoing independent image-format, settings and localization checks
unless their relevant inputs change.

Nonblocking maintainability note: Art/Preview.png and Art/preview-palette.json are absent;
Art/preview.html and sprite-trimmed.png retain the current composition source. Preserve and
update those sources during any future overlay work. No new art was generated in this audit.

---

## Historical status retained below

The following original narrative includes superseded claims; current results are above.

# Fox Lamp Renew — status

It lives at the root, never inside `Mod/`, so Steam never receives it.

A sweep across every mod started this sheet, filled what the disk could tell it, and left four
fields for whoever held the mod. This session holds it now and has answered them.

## The four fields the sweep could not read

- **`stage`** — mirrors the sidebar group of the session holding the mod. Usually one of `port`,
  `showcase`, `preTest`, `done`, `tested`, `published`; here it is `in monorepo`, which that list
  did not have a word for. It does **not** contradict `detached` below, and neither should be
  edited to agree with the other: the detachment is done on disk and on GitHub, but the step has
  not been signed off, so the group has deliberately not moved. Confirmed on 2026-09-12.
- **`tested_on`** — the date of the last run in game. Empty means never, which is the case here:
  RimWorld has never loaded this mod.
- **`dependencies`** — `declared`. The About names 【AF】SydailyFox (Continued) in
  `modDependencies`, and the single `loadAfter` entry is that same mod, so nothing is implied
  without being declared. An undeclared dependency is not cosmetic: on 2026-09-11 Reequilibrage
  animaux took 47 vanilla animals down with it, Muffalo included, because the class it injects
  belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line above is this mod's, not the repository's boilerplate.

## The two defects that were here, and what closed them

Both were closed on 2026-09-12, in the same pass that wrote them down. Kept here because the next
sweep will otherwise find the same two things and wonder whether they were ever looked at.

**The icon was never finished.** The sweep that generates mod icons dropped a full-resolution
mascot into `Mod/About/` at 00:18 and stopped there, leaving 1254x1254 and 1.2 MB where a finished
icon is 128x128 at roughly 30 KB. Being uncommitted made it no safer, because the Workshop uploader
sends `Mod/` as it stands from disk, with no filtering. The source now lives at
`Art/ModIcon-source.png` and the shipped icon is downscaled from it, so `showcase` reads `complete`.

**The 1.5 fork could be enabled alongside.** 【1.5】Fox Lamp Forked, `mg.ferianstory.foxlamp`, is
still in the Workshop folder and declares `Fox_Lamp`, the one defName this mod exists to carry.
Nothing stopped the two loading together, and RimWorld keeps only one. The About now declares that
packageId in `<incompatibleWith>`, and the description says so in words for anyone still
subscribed to it.

## The one thing left

`remaining` holds a single line, and it is the one no document can close: **RimWorld has never
loaded this mod.** Everything asserted about it comes from reading the def against the game's own
files and assembly. `TESTING.md` beside this file is the list of what has to be watched in a
running colony; `tested_on` stays empty until someone walks it.

That line matters more since 2026-09-12 than it did before. Until then the mod was a port, and an
untested port at worst fails to appear. It now carries a **behaviour change** — the piece was given
a glower, a fuel frame and a switch that AmliFurx never wrote — and three comps working together
is the kind of thing that reads correctly on paper and misbehaves in play. Scenario 6 of
`TESTING.md` exists for it and runs to nine steps.

## Vocabulary

`licence`: `open` an explicit licence, `silent` no licence and a dead source, `alive` no licence
but a living source, `forbidden` a written refusal, `original` owing nothing to anyone — not a
name, not an idea traceable to one mod, not a value derived from its assets.

`showcase`: `complete` both images done and to standard, `banner only` the 896x504 banner done
and the icon missing or unfinished, `none` neither.
