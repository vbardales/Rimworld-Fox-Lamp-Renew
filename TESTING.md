# Fox Lamp Renew — in-game test scenarios

Mod = one building, no code: single `ThingDef`, two textures, French translation. All must be watched in running colony. Nothing checkable off disk says whether piece draws, colonist can meditate at it, or Beauty reaches inspect pane.

Not shipped: lives beside `Mod/`, never inside, so Steam never gets it.

In-game scenarios below written as Pickle suite in [Tests/Pickle/](Tests/Pickle/README.md): README maps each scenario to feature, says what left out of Gherkin and why, names passes to play. Scenario 1 (mod without dependency), absence-of-comp checks of 6.7 to 6.9, 8, 9, 13.3 and 13.4 not in it, each justified in README "Scope" section.

Offline validation and reproducible commands in [Tests/RESULTS.md](Tests/RESULTS.md).
Offline checks not gameplay results. Where scenario below played in game, run in
[docs/runs/history.md](docs/runs/history.md), verdict in `STATUS.md`.

## What `done -> tested` needs (AUDIT.md, 2026-10-02)

1. **No scenario `@wip`.** `grep -r "@wip" Tests/Pickle` returns nothing.
2. **Every conditional scenario has run.** One feature conditional, `08-incompatible-fork`
   (`@requires:mg.ferianstory.foxlamp`). Skipped in two minimal passes (by design), played in own pass, `wsl-deps.incompat-foxlamp15.map`, report must show 2 of 2 played, not skipped.
3. **No manual test left to validate.** Every scenario below in exactly one of three columns of next table: green Pickle scenario, passed offline check, or "not applicable" with reason. Person still reads `@review` captures (see `Tests/Pickle/README.md`, "What a person looks at"); that is reading image a scenario already proved in wanted state, not a test.
4. Suite green in English **and** French; `exitReason`, played against discovered, pass name read before any count.

### The passes: three

| Pass | Map | Language | Plays |
| --- | --- | --- | --- |
| Minimal, English | none | English | `01` to `07` (`08` skipped by its tag) |
| Minimal, French | none | French | same |
| Declared incompatibility | `wsl-deps.incompat-foxlamp15.map` | English | `08` |

No optional integration (no `loadAfter` beyond hard dependency, no patch, no `LoadFolders`), so no "with optional mods" pass. No DLC touched, so no DLC-absent pass. Nothing reads state across processes, so no restart pass. Incompatibility pass replayed when 1.5 fork moves, not each publication.

**Order.** Never-ran or red first, as small ticket. Full suite both languages, replaying what already green, deposited last, together, on final revision. Scenario is non-regression once it has green run on current logic; change to mod or step it uses makes it new again.

### Every scenario, and where it is answered

| TESTING.md | Answered by |
| --- | --- |
| 1 Without its dependency | Not applicable: game does not activate mod without hard dependency, game's own behaviour. Declaration read offline (`Check-DefRefs`, `About.xml`). |
| 2 Architect tab, no research, cost | Pickle `01-loads`. Tooltip text: `06-language` for description, `07-inspect-pane`. |
| 3 Build-menu icon is a book | Not applicable as scenario: authored art, untouched since 2020. Missing texture would log at load and fail `01-loads` "no errors". Picture itself not asserted. |
| 4 Beauty in the inspect pane | Pickle `02-construction` (class, Beauty 800) and `07-inspect-pane` (capture). 4.2, room's own beauty maths: not applicable, vanilla. |
| 5 Art without quality | Pickle `02-construction`. Second lamp by another artist: not a scenario, see header of that feature. |
| 6.1 Radius ring while placing | Not applicable as scenario: `PlaceWorker_GlowRadius` is vanilla's, def names it (offline type check). |
| 6.2 to 6.6 Lit, switch, fuel, run dry | Pickle `03-light-fuel-switch`, with two night captures. |
| 6.7 to 6.9 No heat, no flame, no fire | Offline: absence of comps and Flammability 0, read off def. |
| 7 No colour mask, no tint | Offline: mask file not shipped. Tint is question put to person on night captures. |
| 8 Drawn at 4.92 cells, 9 Walk-through | Offline: authored def fields. Night captures show drawn size. |
| 10.1 Meditation focus | Pickle `04-meditation-and-moving`. 10.2 four lamps worth one: offline, vanilla offset names three defs, not this one. |
| 11.1 and 11.2 Minify, put back, keep the title | Pickle `04-meditation-and-moving`. Stockpile filter tree and 11.3 deconstruct: vanilla behaviour driven by def fields read offline. |
| 12 French | Pickle `06-language` and `07-inspect-pane` in French pass. |
| 13.1 Save and reload, 13.2 Added to a colony | Pickle `05-save-reload`, `01-loads` (load of save with mod). |
| 13.3 Removed from a colony | Not applicable: game's own missing-content handling. |
| 13.4 A save from before the light | Not applicable to gate: no step can produce that save. Residual risk kept in `STATUS.md`. |
| 14.1 Mod-list warning | Not applicable: game's reaction to declaration. Declaration read offline. |
| 14.2 Both loaded | Pickle `08-incompatible-fork`: fork loads no Defs under 1.6, so nothing collides. |
| 14.3 Description tells fork users to leave | Read in `About.xml`, no test. |

### Proofs to keep after a run

Per pass and scenario, latest report for revision now in repository, minified: `summary.json`, `summary.md`,
`junit.xml`, `Player.log`, `evidence-complete.txt` (and `dropped-mods.txt` when present), plus `@review` captures a
person opened: two night stills of `03` once, inspect pane of `07` each language. Delete `report.html`,
`messages.ndjson` and every other capture once newer report replaces it. One text line per run in
`docs/runs/history.md`. Details and folder-by-folder state: `Tests/Pickle/README.md`, "Evidence".

## Before starting

- RimWorld 1.6. **No DLC required.** `Artistic` meditation focus is Core def, not Royalty, so scenario 10 works on bare install. Development mode on, so silent failures become red text.
- Enable **Harmony**, required by installed SydailyFox dependency, before SydailyFox.
- **【AF】SydailyFox (Continued)** (`Mlie.AFSydailyFox`, Workshop 3540588386) must be installed and
  loaded **before** this mod. Hard requirement, not courtesy: parent def, architect tab and both item categories all come from it.
- **【1.5】Fox Lamp Forked** (`mg.ferianstory.foxlamp`) must be **disabled**. Still in Workshop folder, declares same `Fox_Lamp`. See scenario 14.
- Log to read afterwards, and attach to any report:
  `C:\Users\nelim\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`
- Materials: **80 marble blocks**, so marble-bearing map or Debug actions → Spawn thing →
  `BlocksMarble`. Piece costs **24 000 work**, four fifths of vanilla large sculpture, takes builder days; Debug actions → Finish construction is the way through, except scenario 5, where work must complete normally.
- Fuel for scenario 6: **hay, wood or chemfuel**. Built with full frame, so none needed to see it light, but some needed to see it refuelled.

Useful comparisons, all read out of vanilla files:

| | Beauty | Work |
|---|---|---|
| Small sculpture | 50 | 18 000 |
| Large sculpture | 100 | 30 000 |
| Grand sculpture | 400 | 105 000 |
| **Fox Lamp** | **800** | **24 000** |

So twice as beautiful as best vanilla sculpture, for under quarter of its work.
Port did not introduce this balance — AmliFurx's, unchanged — but worth knowing
before judging whether piece feels right. Legendary vanilla sculpture reaches meditation focus strength 0.28, this sits flat at **0.4**.

## 1. Without its dependency, it must fail loudly

First thing to prove, since every other scenario assumes it. Four separate names in def
belong to other mod, none optional.

1. Enable **this mod alone**, SydailyFox disabled. Let game load.

**Pass:** def does not load, building absent from every architect tab, log says
so in as many words. Lines to find:

```
XML error: Could not find parent node named "AF_NaturalBuildingBase" for node "ThingDef"
Could not resolve cross-reference to RimWorld.DesignationCategoryDef named AF_Thankyou
Could not resolve cross-reference to Verse.ThingCategoryDef named AF_TC_RimFurry_Building_Thankyou
```

**Fail:** building appears anyway, or game loads in silence. Silent load would mean def resolved names from somewhere unexpected, worth knowing before release.

2. Re-enable SydailyFox, load again.

**Pass:** none of those three lines in log, nothing red names `Fox_Lamp`.

## 2. It is in AmliFurx's tab, buildable on day one

1. Open Architect menu, find **AmliFurx** tab.

**Pass:** **Fox Lamp** in it, beside other thank-you pieces parent mod ships. No research
prerequisite, cost 80 marble blocks, tech level neolithic — tribe must be able to build on day
one, materials permitting. Tooltip carries description, ending on AmliFurx's signature and
2020 date.

**Fail:** absent from tab, or filed in vanilla tab such as Furniture or Misc.

## 3. The build-menu icon is a book, and that is correct

Read before reporting as bug.

**Pass:** build menu icon is small **book**, not picture of sculpture. AmliFurx
drew series of stylised cards rather than representations, file shipped untouched. Scaled to 1.8 because source art small in its canvas.

**Fail:** pink or missing-texture square. Real fault; book is not.

## 4. Beauty reaches the inspect pane

Fix the port exists for. Before it, piece built around Beauty 800 and never
showed it, because def used plain `Building` class it inherits instead of vanilla's
`Building_Art`.

1. Build one. Select, read inspect pane.

**Pass:** **Beauty** line there, reading **800**. For scale, stand vanilla grand sculpture
beside it: reads 400, best vanilla has.
**Fail:** no Beauty line. Means `thingClass` override lost.

2. Put in small room, check room stats.

**Pass:** room beauty and impressiveness jump. 800 in one cell is a lot, should
be obvious.

## 5. It becomes a work of art without ever having a quality

Subtle one, and one an obvious "fix" would break. Def carries `CompProperties_Art` with
**no** `CompQuality`, unlike every vanilla art building. Works because
`Frame.CompleteConstruction` calls `InitializeArt` itself when finished thing has no quality
comp — art set up **by act of finishing construction**.

1. Build one ordinary way, colonist finishing work. **Do not** use Debug actions →
   Spawn thing here, do not skip frame: spawning finished building bypasses
   the very code path tested.
2. Select, open **Art** tab.

**Pass:** generated title, named author, sculpture description in art tab. Inspect
pane shows **no quality label** — no "good", no "excellent", nothing. Beauty stays flat at
800 whoever built it, no quality to scale it.

**Fail:** empty or missing art tab, or null-reference in log when frame
completes. Also fail, other direction: quality label appearing, meaning a
`CompQuality` crept in and flat Beauty now scaled.

3. Build second with much better or much worse artist.

**Pass:** both read 800. Trade for no quality: piece never rolls.

## 6. It lights, and that part is not AmliFurx's

Only thing in mod that is change to his work rather than repair, so longest scenario. Three comps do it, game wires them together: `CompGlower` asks
`CompRefuelable` for fuel and `CompFlickable` for switch. Vanilla torch pairs first two
but has no switch; all three together are wood-fired and chemfuel generators, so that trio is
pattern followed and one to compare against if step below misbehaves.

1. Place one, watch placement ghost before confirming.

**Pass:** lit-radius ring drawn around ghost while positioning, as for any
vanilla lamp. That is `PlaceWorker_GlowRadius`.

2. Finish building, then wait for night or Debug actions → set hour to 2.

**Pass:** **already lit**, no one hauling fuel first — `initialFuelPercent` is
1, so built with full frame. Pool reaches radius 10, same as vanilla torch or
brazier, in warm amber of sister lamps rather than white of electric light. Stand torch beside it, two pools should look same size.

**Fail:** built dark. Means initial fuel lost, player would reasonably conclude
light does not work.

3. Read inspect pane.

**Pass:** fuel bar, refuelling job when low, on/off switch. Twelve units at full.

4. Switch off.

**Pass:** glow goes out at once, fuel stops draining. Switch back on, light
returns.

5. Check what it accepts as fuel.

**Pass:** hay, wood and chemfuel, nothing else. Sister lamp's three, not choice
made here.

6. Let run dry, or Debug actions → empty fuel.

**Pass:** goes dark and **stays standing**. `destroyOnNoFuel` false, so unattended
monument is unlit monument, never lost one. Beauty, art title and meditation focus all
survive being unlit — none wired to glow.

7. Put in small sealed room, watch temperature.

**Pass:** room does **not** warm. No heat pusher, deliberately: marble carving
warming room would not read. Sister lamp pushes heat; this does not.

8. Look at sprite while lit.

**Pass:** no flame drawn on art — only light on ground changes. No fire
overlay, on purpose: vanilla draws flame at cell centre, piece drawn
at 4.92 cells, so flame would sit at its foot instead of inside lantern frame.

9. Start fire next to it.

**Pass:** does not catch. Flammability 0, same as vanilla torch base.

## 7. No colour mask, and no tint

Companion mask file never loaded in any version since 2020, deliberately not shipped, but
`CutoutComplex` shader that would use it kept so piece draws exactly as players knew it.

**Pass:** sculpture drawn in own marble greys and blacks, as texture looks. No
colour-picker gizmo, no faction colour, no black or magenta silhouette.
**Fail:** piece renders solid dark or takes tint. Means shader now finding
mask where should find none.

## 8. It is drawn five times the size of the cell it occupies

`drawSize` 4.92 on 1x1 building. Authored and correct, but looks wrong first
time.

1. Build one in open.

**Pass:** art spills well beyond own cell, shadow under it, while building
**occupies exactly one cell**. Build wall in cell directly north: wall goes up
normally, two overlap on screen, neither refusing placement.

## 9. You can walk through it

`fillPercent` 0, `pathCost` 0, `passability` PassThroughOnly, `isEdifice` false. Piece
blocks nothing, unusual — vanilla sculpture has path cost 50 and fills half
its cell.

1. Put in middle of corridor, watch traffic.

**Pass:** colonists walk straight over cell without slowing or stepping around, no red
pathing error.

2. Put in doorway-width gap in wall, check room.

**Pass:** two sides still **one room**. Not edifice, so does not divide space
and does not count toward room's structure.

3. Try painting growing zone over its cell.

**Pass:** zone refuses that one cell. `canOverlapZones` false.

## 10. Meditation: a flat focus, stronger than a legendary sculpture

1. Assign colonist meditation focus, look for Fox Lamp in list. Have them meditate
   in front of it.

**Pass:** offered as **Artistic** focus, focus strength reads **0.4**. Meditation
proceeds normally, colonist facing it.

2. Build three more within few cells, check strength again.

**Pass:** still 0.4. Vanilla gives bonus for standing among several sculptures, but that offset
names `SculptureSmall`, `SculptureLarge` and `SculptureGrand` by def, `Fox_Lamp` not among
them. Four of these worth exactly what one is.

3. Compare against legendary vanilla sculpture.

**Pass:** legendary reaches 0.28, this sits at 0.4, unchanging. Trade for
no quality: cannot roll badly, cannot roll well either.

## 11. It moves house, and it keeps its name

1. Select, choose **Uninstall**. Let colonist carry it away.

**Pass:** becomes minified Fox Lamp, item that can be hauled and stored. Appears in
stockpile filter tree under parent mod's two thank-you categories, not vanilla one.

2. Re-install elsewhere.

**Pass:** goes back up and **keeps art title and author** given when first
built. New title would mean art comp re-initialised on every install.

3. Deconstruct one instead.

**Pass:** marble blocks come back, as `leaveResourcesWhenKilled` promises.

Watch log at load for `is not minifiable yet has thing categories`. Def has both
`minifiedDef` and two thing categories, so satisfies check; line appearing means
`minifiedDef` lost, takes whole def down with it.

## 12. French

Switch game to French, walk scenarios 2, 4 and 5 again.

**Pass:** description reads *Une pousse de bambou taillée dans le marbre…* in build menu and
inspect pane, paragraph breaks intact, shout on own line. Label stays
**Fox Lamp** in English — deliberate, not missing translation. Title AmliFurx
gave piece, translating would rename someone's artwork.

**Fail:** English description showing through, or accented characters arriving mangled.

## 13. Saves, before and after

`defName` unchanged from 1.5 mod on purpose, so colony that already has one
standing does not lose it.

1. Build one, save, reload.

**Pass:** still there, still with art title, no red line on load.

2. Add mod to colony that never had it.

**Pass:** building appears in AmliFurx tab, nothing else changes, no error.

3. Remove from colony that had one built.

**Pass:** game gives usual missing-content warning, colony loads and plays, piece
gone. Deconstruct any built first if you prefer avoiding warning.

4. Upgrade case, if reachable: save made while piece still unlit, loaded with
   this version. Either old save from before light added, or one made with 1.5 fork
   in place of this mod.

**Pass:** standing piece gains fuel frame and switch, loads without red line, and
keeps art title. Whether it comes back lit or empty not the test — either acceptable, and
worth writing down, since fuel comp is new to thing saved without one.

## 14. The 1.5 fork and this mod must never be enabled together

Both declare `Fox_Lamp`, 1.5 mod additionally declares four lamps SydailyFox now
ships itself.

Since 2026-09-12 About declares `mg.ferianstory.foxlamp` in `<incompatibleWith>`, so game
says so rather than leaving it to be discovered.

1. Enable **【1.5】Fox Lamp Forked** and this mod together, in mod list.

**Pass:** mod list marks pair incompatible and warns before start, naming 1.5
fork. Warning is whole point: duplicate it prevents is silent otherwise.

2. Ignore warning, load anyway.

**Expected:** RimWorld keeps one `Fox_Lamp`, logs duplicate-defName error; whichever loads
last wins. Nothing crashes, but one of two mods does nothing. This is what declaration
exists to stop, so seeing it here is confirmation, not failure of mod.

3. Read mod description in list.

**Pass:** tells anyone still subscribed to fork to unsubscribe or disable it, says they
lose nothing doing so — everything fork had is in this mod or in parent it
requires.