---
localization: complete
translation_en: complete
translation_fr: complete
mod:          Fox Lamp Renew (unofficial)
packageId:    nelim.foxlamprenew
repo:         Rimworld-Fox-Lamp-Renew
visibility:   public
detached:     yes
licence:      silent
licence_at:   neither the 1.5 mod folder nor its Workshop page says anything
upstream_mod_remotes: N/A
dependencies: verified
showcase:     complete
tested_on:    2026-10-02 (English 2026-09-28 and 2026-09-29, French 2026-09-28 and 2026-10-02, incompatibility pass 2026-09-29)
workshop:     3806767650 (0.1.0 prepublication, private item, not tested or reviewed)
workflow_stage: shootGallery[1.0.0]
remaining:
  - unverified: final non-regression on the final revision, English and French, deposited together after the commit and the deployment (AUDIT.md 8.c, 14.a).
  - unverified: the build-menu icon at scale 1 stays inside its square (Mod/Defs/Fox_Lamp.xml, 2026-10-15, Virginie): read on the gallery 4 capture (Build copy gizmo). Diff reviewed: one field, `uiIconScale` 1.8 to 1, no code, no patch; `code_review_sha` advanced.
  - unverified: the upgrade case (TESTING.md 13.4, a save made before the light existed): no step can make that save. Not
    applicable to the gate, residual risk.
session:      local_0e16ab66-25f8-4309-b62f-ed30346620a5
updated:      2026-10-11, playTests exit met; now shootGallery[1.0.0]
settings_audit: not_applicable
audit_revision: 05bddb172279da82563ed9e3116b42d8512f0ea8
audit_result: passed_through_writeTests
code_review_sha: 7c83144db5f38b206589743363a60d09b783be3e
protocols_read_sha: 117fb9642df7e57bece2318904c644a9c39296df
---
# Workflow audit: 2026-10-11

Old `done` mapped to `playTests` by table, but re-audit puts it at `writeTests[1.0.0]`: exit needs `translation_fr: complete`, i.e. Virginie's French review (AUDIT.md 6.g, 7.g). Revision `05bddb1`; working tree also holds Virginie's
icon, Preview, gallery work (`Art/`, `Mod/About/ModIcon.png`, `Mod/About/Preview.png`), left untouched, not mine to commit.
Older sections moved to `docs/runs/status-history.md`.

- **Code review (8.m), done.** `Mod/Defs/Fox_Lamp.xml`, `Mod/About/About.xml`, French DefInjected, from first commit 2026-10-13, revue du diff : images et texte seuls (`f5e9b8d..c964885`: `ModIcon.png`, `Preview.png`, description de `About.xml`), 8.m non rouvert (Audit, AUDIT.md e1a1959), `code_review_sha` avancé, pas de nouveau playTests.
  to HEAD. No defect found: glow, fuel, switch paired by game (`CompGlower` reads `CompRefuelable` and `CompFlickable`),
  30 days a tank (12 units at 0.4 a day), no code, no patch. `code_review_sha` set.
- **Pickle (8.c).** Every scenario has green run on current logic (`docs/runs/history.md`); no `@wip`; conditional
  `08-incompatible-fork` played 2/2. No ticket in queue, none due before final non-regression.
- **@review captures (8.d), opened by session 2026-10-11.** Lit at night: warm pool, tile reads "Lit (50%)". Switched off: "Dark (0%)", no pool. Inspect pane EN and FR: fuel 12 / 12 (30 days), beauty 800, generated title and author, French strings translated. All four accepted.
- **Criteria 1 to 7 re-checked on files, 2026-10-11.** Offline `Tests/Run-Checks.ps1` rerun: PASS (11587 defs, 29 patch operations, 0 errors). `ModIcon.png` 128x128, 29.8 KB; `Preview.png` 896x504, 353 KB; `Art/Gallery/0-preview.png` byte-identical to it; no `PROMPT_*.md`; CHANGELOG `[1.0.0]` present; dependency and incompatibility declared in `About.xml`. Scenarios live in `TESTING.md` (no `TEST_SCENARIOS.md`). Open, not mine: `Art/ModIcon-original.png` and `README-art.md` outside minimal set of PUBLISHING.md (Virginie's migration, left); `Tests/Run-Checks.ps1` row of `scripts/LOCAL_SCRIPTS.md` has no validation yet (Audit workflow session).
- **Translation audit, French review (6.g), 2026-10-11.** Virginie read whole text at `05bddb1`, asked 4 corrections (description intro EN and FR; CHANGELOG 0.1.0 and fuel sentences), all applied in `f5e9b8d` with `FRENCH_REVIEW.md` regenerated, review line filled. Offline checks rerun green. `translation_fr: complete`; stage moves to `playTests[1.0.0]`. Code review covers text-only diff.
- **playTests exit, 2026-10-11 (8.a to 8.m).** Deployed: `Mods/FoxLampRenew` is junction to `Mod/`. Every scenario has green run; 06 and 07 assertions read description prefix and pane, unchanged by 2026-10-11 wording. Text-only change since last runs covered by non-regression in both languages, deposited after commit at `followUp` (8.c, 14.a), not before. No ticket now.
- **shootGallery, 2026-10-12.** Series in `Tests/Pickle/Mod/Pickle/Features/09-gallery.feature` (calm zone, lamp at (200, 187)): v1 in statue garden ran 4/4 green but judged weak, dropped; v2 (ticket `f356`, 4/4 green, `Evidence/20261012-gallery-2`) opened by session and kept: `Art/Gallery/1-candidate-noon.jpg`, `2-candidate-dusk.jpg`, `3-candidate-night.jpg`, `4-candidate-inspect-pane.jpg` (cropped). 2026-10-13: Virginie refused all four. 1 to 3 show sweat on Nelim's face (known limit of gallery faces, SanctuaryBacklot GALERIE.md, ticket 524c at NPT); 4 refused too. Four files deleted; gallery holds only `0-preview.png`. 2026-10-15: series recomposed (story "the evening the lamp is filled": empty tank at noon, hay carried at dusk, Shogun in all, Nelim in light shirt with Bob, face parts per image, map at 20 degrees), run `Evidence/20261015-gallery-5` 4/4 green; candidates `1-candidate-noon.jpg` to `4-candidate-inspect-pane.jpg` (4 recropped) wait on Virginie. Open: whether sweat gone (SleptInHeat memory thought, no clearing step).
- `settings_audit: not_applicable` unchanged.