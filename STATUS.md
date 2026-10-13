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
  - unverified: the upgrade case (TESTING.md 13.4, a save made before the light existed): no step can make that save. Not
    applicable to the gate, residual risk.
session:      local_0e16ab66-25f8-4309-b62f-ed30346620a5
updated:      2026-10-11, playTests exit met; now shootGallery[1.0.0]
settings_audit: not_applicable
audit_revision: 05bddb172279da82563ed9e3116b42d8512f0ea8
audit_result: passed_through_writeTests
code_review_sha: c96488856b612a29f0a36c2b8ad10599a6bcfe5c
protocols_read_sha: 2f4e0002e2543fcde57999c51ff8b2f0dfc8efdb
---

# Workflow audit: 2026-10-11

Old `done` mapped to `playTests` by the table, but the re-audit puts it at `writeTests[1.0.0]`: exit needs `translation_fr: complete`, i.e. Virginie's French review (AUDIT.md 6.g, 7.g). Revision `05bddb1`; the working tree also holds Virginie's
icon, Preview and gallery work (`Art/`, `Mod/About/ModIcon.png`, `Mod/About/Preview.png`), left untouched, not mine to commit.
Older sections moved to `docs/runs/status-history.md`.

- **Code review (8.m), done.** `Mod/Defs/Fox_Lamp.xml`, `Mod/About/About.xml` and the French DefInjected, from the first commit 2026-10-13, revue du diff : images et texte seuls (`f5e9b8d..c964885`: `ModIcon.png`, `Preview.png`, description de `About.xml`), 8.m non rouvert (Audit, AUDIT.md e1a1959), `code_review_sha` avancé, pas de nouveau playTests.
  to HEAD. No defect found: glow, fuel and switch are paired by the game (`CompGlower` reads `CompRefuelable` and `CompFlickable`),
  30 days a tank (12 units at 0.4 a day), no code, no patch. `code_review_sha` set.
- **Pickle (8.c).** Every scenario has a green run on the current logic (`docs/runs/history.md`); no `@wip`; the conditional
  `08-incompatible-fork` played 2/2. No ticket in the queue, none due before the final non-regression.
- **@review captures (8.d), opened by the session 2026-10-11.** Lit at night: warm pool, tile reads "Lit (50%)". Switched off: "Dark (0%)", no pool. Inspect pane EN and FR: fuel 12 / 12 (30 days), beauty 800, generated title and author, French strings translated. All four accepted.
- **Criteria 1 to 7 re-checked on the files, 2026-10-11.** Offline `Tests/Run-Checks.ps1` rerun: PASS (11587 defs, 29 patch operations, 0 errors). `ModIcon.png` 128x128, 29.8 KB; `Preview.png` 896x504, 353 KB; `Art/Gallery/0-preview.png` byte-identical to it; no `PROMPT_*.md`; CHANGELOG `[1.0.0]` present; dependency and incompatibility declared in `About.xml`. Scenarios live in `TESTING.md` (no `TEST_SCENARIOS.md`). Open, not mine: `Art/ModIcon-original.png` and `README-art.md` are outside the minimal set of PUBLISHING.md (Virginie's migration, left); the `Tests/Run-Checks.ps1` row of `scripts/LOCAL_SCRIPTS.md` has no validation yet (Audit workflow session).
- **Translation audit, French review (6.g), 2026-10-11.** Virginie read the whole text at `05bddb1` and asked 4 corrections (description intro EN and FR; CHANGELOG 0.1.0 and fuel sentences), all applied in `f5e9b8d` with `FRENCH_REVIEW.md` regenerated and the review line filled. Offline checks rerun green. `translation_fr: complete`; the stage moves to `playTests[1.0.0]`. The code review covers the text-only diff.
- **playTests exit, 2026-10-11 (8.a to 8.m).** Deployed: `Mods/FoxLampRenew` is a junction to `Mod/`. Every scenario has a green run; the 06 and 07 assertions read the description prefix and the pane, unchanged by the 2026-10-11 wording. The text-only change since the last runs is covered by the non-regression in both languages, deposited after the commit at `followUp` (8.c, 14.a), not before. No ticket now.
- **shootGallery, 2026-10-12.** Series in `Tests/Pickle/Mod/Pickle/Features/09-gallery.feature` (calm zone, the lamp at (200, 187)): v1 in the statue garden ran 4/4 green but was judged weak and dropped; v2 (ticket `f356`, 4/4 green, `Evidence/20261012-gallery-2`) opened by the session and kept: `Art/Gallery/1-candidate-noon.jpg`, `2-candidate-dusk.jpg`, `3-candidate-night.jpg`, `4-candidate-inspect-pane.jpg` (cropped). 2026-10-13: Virginie refused all four. 1 to 3 show sweat on Nelim's face (known limit of the gallery faces, SanctuaryBacklot GALERIE.md, ticket 524c at NPT); 4 refused too. The four files are deleted; the gallery holds only `0-preview.png`. Next: recompose the series once the temperature step works, as a small ticket.
- `settings_audit: not_applicable` unchanged.
