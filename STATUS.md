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
code_review_sha: 845707521bca5800b561eee72efdac7ced615ba1
protocols_read_sha: b48ecc4cf0af35ec316379c537490a7c025a8c06
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
- **shootGallery, 2026-10-12.** Series in `Tests/Pickle/Mod/Pickle/Features/09-gallery.feature` (calm zone, lamp at (200, 187)): v1 in statue garden ran 4/4 green but judged weak, dropped; v2 (ticket `f356`, 4/4 green, run folder deleted 2026-10-19, one line in `docs/runs/history.md`) opened by session and kept: `Art/Gallery/1-candidate-noon.jpg`, `2-candidate-dusk.jpg`, `3-candidate-night.jpg`, `4-candidate-inspect-pane.jpg` (cropped). 2026-10-13: Virginie refused all four. 1 to 3 show sweat on Nelim's face (known limit of gallery faces, SanctuaryBacklot GALERIE.md, ticket 524c at NPT); 4 refused too. Four files deleted; gallery holds only `0-preview.png`. 2026-10-15: series recomposed (story "the evening the lamp is filled": empty tank at noon, hay carried at dusk, Shogun in all, Nelim in light shirt with Bob, face parts per image, map at 20 degrees), run `20261015-gallery-5` (folder deleted 2026-10-19) 4/4 green; candidates `1-candidate-noon.jpg` to `4-candidate-inspect-pane.jpg` (4 recropped) wait on Virginie. Open: whether sweat gone (SleptInHeat memory thought, no clearing step).
- `settings_audit: not_applicable` unchanged.
## Shotlist v4 (2026-10-25, supersedes v3 below; director pass by Opus, remarks kept: 1 plants fixed, 2 two jobs, 3 hands empty at the lamp, 5 blocking, 6 Shogun, 7 colour/tattoo, 8 prop, 9 zooms, 10 scene 4 time; remark 4 not kept, NPT confirmed steps exist)

Story unchanged ("the evening the lamp is filled", calm zone, one summer day). Plants on FIXED cells all series: roses (198, 189) (203, 190), bonsai pot (196, 186), daylily (204, 186). Nelim keeps one outfit all day: rust shirt (176, 84, 52), olive trousers (96, 110, 70), long loose hair (Long), no tattoo; only headwear changes (flophat at noon for the sun, hat off at dusk, bareheaded at night with a teal cape (20, 70, 80) because the map drops to 12 degrees at 23:00). Gesture steps (NPT, 2026-10-25): `"Nelim" is forced to haul {int} of the item "Hay" to (x, z)` or carries + `is forced to walk to`, `game speed is paused`, `I advance the paused game by exactly {int} ticks`; Shogun `is forced to walk to`. Haul and advance are played (job-gallery); forced walk and trot are not.

| # | Shot | Zoom, framing | Nelim (cell, state) | Instant | How obtained | Shogun | Decor (removed after) | Estimate | Risk |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 12:00 Clear 20 deg, lamp dark, opening | 4.5, lamp left third, wide-ish | (197, 184) flophat, smirk, hauling Hay toward the lamp | she just lifted the hay from the bale, about to cross | forced haul to (199, 186), pause, advance 25 ticks, frame | front view, forced walk South, mid-trot | hay bale (199, 184), plants | 4 | forced walk / haul fails if cell reserved: replay alone |
| 2 | 19:00 Clear, amber, the refuel | 3.5, tight on lamp, her hands and flame | (199, 187) next to the lamp, hat off, small smile, hands empty, eyes on the flame | she just set the last hay down, the lantern catches | stands + faces East, lamp asserted lit, smaller hay pile (199, 186) | facing West toward her, sitting | stool (204, 185), hay pile, plants | 4 | dusk glow reads weak: tight zoom, assert lit |
| 3 | 23:00 Clear, 12 deg, night | 6 wide, the pool of light in the dark square | (197, 187) bareheaded, teal cape, peaceful smile, raising a cup (Beer) | she lifts the cup, the lamp burns on its own | carries the item, stands, face set last | lying at (202, 188) facing the lamp | stool, plants | 4 | Beer may not draw in hand: then carry Hay |
| 4 | 00:30, closing | 3, big lit lamp centre-right, pane bottom-left | none (gone to rest), empty cup on the stool | later that night | inspect tab, assert fuel text before capture | asleep by the lamp (lies step, never played) | stool + cup, plants | 4 | lies step not played: replay alone |

Series k: one story, wide (3), medium (1), tight (2), close (4); opening 1, closing 4. Mean estimate 4. Not yet in the feature file: the header and scenarios still hold v3 until rewritten; no ticket for v4 before that. Ticket 20261025-181051-650-a3dd (scene 3 v3 replay) still running on the v3 text.

### v4 rework of scenes 1 and 4 (2026-10-25, owner argument "1 et 4"; fixes the weak points of the rate-gallery pass; zooms of 1 to 4 become 4 / 3 / 6 / 3.5)

Says (all scenes): 1 "The lamp stands dark; the hay that will light it is on its way." 2 "The tank is filled and the lantern lights: the hay was the cause." 3 "The lamp burns on its own now, and she can rest." 4 "One tank for thirty days: the lamp keeps watch while everyone sleeps."
Scene 1, full line: 12:00 Clear 20 deg, sun from above, short shadows; zoom 4 (medium), lamp at the left third, marble silhouette about 130 px wide on 1920; foreground: the hay bale (199, 184) and Nelim walking in from the right edge; background: the cream square, plants on fixed cells. Nelim: rust shirt (176, 84, 52), olive trousers (96, 110, 70), straw flophat (214, 188, 112), long loose hair (Long) under it (Show Hair Under Stuff in the DepMap), smirk (MouthSmirkSmile, BrowNormal, LidNormal), hauling Hay to (199, 186) from (197, 184) by forced haul, game paused, advance 25 ticks, then frame, 5 frames, capture. Shogun front, forced walk South. Subtitle line: "The lamp waits, dark, for the hay."
Scene 4, full line: 00:30 Clear 12 deg, the same corner, close (zoom 3.5): big lit lamp centre-right, pane bottom-left with art title, fuel and Beauty, switch gizmo visible; light: the amber pool on a dark square. Instant: she left a minute ago, the cup is still on the stool, Shogun has just curled up at the foot of the lamp. Gesture: Shogun lying (`the animal "Shogun" lies at (201, 188) facing East`, LayDown, never played), game paused, fuel text asserted before the capture. Subtitle line: "One tank, thirty days of light."
Re-score on the plan by the rate-gallery rule: 1 = 5 (d, f, g, j fixed), 2 = 4.5 (-0.5 e), 3 = 4.5 (-0.5 e), 4 = 5. Mean 4.75. Not verified: Beer, `lies` and forced-walk steps (NPT describes them, files not opened). No ticket for v4 yet: the feature file still holds v3.

## Shotlist v3 (SUPERSEDED, 2026-10-18, owner rule: every scene 4/5 or more, criteria a to j of GALLERY-SHOTLIST-AUDIT.md, before it is played)

Story "the evening the lamp is filled", calm zone, Nelim keeper of the lamp, Shogun in every image facing the camera. Full plan in the header of `Tests/Pickle/Mod/Pickle/Features/09-gallery.feature`. Series score 4/5.

| # | Shot (place, hour, zoom) | Outfit and face of Nelim | Action | Decor (removed after) | Living | Estimate | Risk | Plan | Verdict after run |
|---|---|---|---|---|---|---|---|---|---|
| 1 | calm zone, 12:00, zoom 6 | cream collar shirt, olive trousers, straw flophat over long loose hair (Long), calm smirk | brings an armful of hay | 2 roses, bonsai pot, daylily pot, hay bale | Shogun front, 2 hens | 4 | defNames never played, hens leave frame | replay the scene alone; animals placed after the wait | pending |
| 2 | calm zone, 19:00, zoom 4 off-centre | lilac shirt, indigo trousers, rust headwrap over long wavy hair (Wavy), small smile | last armful of hay, the lantern lights | yellow tall grass, daylily pot, stool, hay pile | Shogun front, cat Tama front | 4 | cat leaves frame, weak dusk glow | cat placed after the wait, lamp asserted lit, tight zoom | pending |
| 3 | calm zone, 23:00, zoom 5.5 | white shirt, teal cape, dark trousers, FancyBun, star tattoo, peaceful smile | holds a cup of tea | 2 roses, bonsai pot, daylily pot | Shogun front | 4 | Face_Stars untested, cup may not draw | drop the tattoo if bad; else carry the last Hay, replay alone | pending |
| 4 | inspect pane of the lamp, 23:00, zoom 3.5 | none | none (inspect tab on the place of the story) | none | none | 4 | none known | none | pending (accepted 2026-10-15) |

Hat rule (GALLERY.md d): Show Hair Under Stuff added to the pass map, long loose hair under every hat. Lowest estimate 4. Shogun facing (drawn from behind in run gallery-5) is the series risk: if it repeats, ask NPT for the diagnostic step that reads `pawn.Rotation` before the capture.
Run 07f6 (gallery-9, 2026-10-23): 3/3 green. Captures read 2026-10-25. Scene 1 (noon, hay, flophat, Shogun front, hens, roses): 4, keep. Scene 2 (dusk, lit pool, rust headwrap, Shogun front, cat): 4, keep. Scene 3 (night, cup): Shogun drawn from BEHIND, series risk realised, 3: replay alone after asking NPT for a step that sets `pawn.Rotation` (South) before the capture. Candidates in Art/Gallery/ not yet replaced; Inbox gallery-9 kept until scene 3 replayed and 1, 2 minified into Evidence/ (RELEASE.md each).
Open (older, 2026-10-20): ticket 07f6 was queued, owner local_84c81574 (id changes after a clear: resume-mod re-registers with the TM). On RUN_DONE: read summary.json and junit.xml, open every capture, give the verdict per scene against the estimates above, minify green proofs into Evidence/ (RELEASE.md each), delete failures. A first run died of memory saturation (stalled at start), not a mod fault. Candidates in Art/Gallery/ are still the weak 2026-10-15 ones, to replace by the v3 captures; subtitles only after acceptance and reindex.
