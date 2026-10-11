---
localization: complete
translation_en: complete
translation_fr: partial
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
workflow_stage: playTests[1.0.0]
remaining:
  - unverified: French review by Virginie (FRENCH_REVIEW.md, review line empty): required before the deployment (AUDIT.md 8.b).
  - unverified: final non-regression on the final revision, English and French, deposited together after the commit and the deployment (AUDIT.md 8.c, 14.a).
  - unverified: the upgrade case (TESTING.md 13.4, a save made before the light existed): no step can make that save. Not
    applicable to the gate, residual risk.
session:      local_10a859b9-27db-4555-b97c-3be885f5403d
updated:      2026-10-11, workflow audit: old `done` migrated to `playTests[1.0.0]`; code review done
settings_audit: not_applicable
audit_revision: 05bddb172279da82563ed9e3116b42d8512f0ea8
audit_result: passed_through_writeTests
code_review_sha: 05bddb172279da82563ed9e3116b42d8512f0ea8
protocols_read_sha: 71363b2e20b7f8457c78f8f5d87e2b01ae06d782
---

# Workflow audit: 2026-10-11

Old `done` mapped to `playTests[1.0.0]` (AUDIT.md, section 16). Revision `05bddb1`; the working tree also holds Virginie's
icon, Preview and gallery work (`Art/`, `Mod/About/ModIcon.png`, `Mod/About/Preview.png`), left untouched, not mine to commit.
Older sections moved to `docs/runs/status-history.md`.

- **Code review (8.m), done.** `Mod/Defs/Fox_Lamp.xml`, `Mod/About/About.xml` and the French DefInjected, from the first commit
  to HEAD. No defect found: glow, fuel and switch are paired by the game (`CompGlower` reads `CompRefuelable` and `CompFlickable`),
  30 days a tank (12 units at 0.4 a day), no code, no patch. `code_review_sha` set.
- **Pickle (8.c).** Every scenario has a green run on the current logic (`docs/runs/history.md`); no `@wip`; the conditional
  `08-incompatible-fork` played 2/2. No ticket in the queue, none due before the final non-regression.
- **@review captures (8.d), opened by the session 2026-10-11.** Lit at night: warm pool, tile reads "Lit (50%)". Switched off: "Dark (0%)", no pool. Inspect pane EN and FR: fuel 12 / 12 (30 days), beauty 800, generated title and author, French strings translated. All four accepted.
- **Waiting on Virginie.** French review (`FRENCH_REVIEW.md`), then the deployment; only then `shootGallery`.
- `settings_audit: not_applicable` unchanged.
