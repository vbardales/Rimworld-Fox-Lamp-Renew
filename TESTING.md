# Fox Lamp Renew — in-game test scenarios

This mod is one building and no code at all: a single `ThingDef`, two textures and a French
translation. Everything below has to be watched in a running colony, because nothing that can be
checked off the disk tells you whether the piece draws, whether a colonist can meditate at it, or
whether its Beauty finally reaches the inspect pane.

It is not shipped: it lives beside `Mod/`, never inside it, so Steam never receives it.

## Before starting

- RimWorld 1.6. **No DLC required.** The `Artistic` meditation focus is a Core def, not a Royalty
  one, so scenario 10 works on a bare install. Development mode on, so silent failures become red
  text.
- **【AF】SydailyFox (Continued)** (`Mlie.AFSydailyFox`, Workshop 3540588386) must be installed and
  loaded **before** this mod. It is a hard requirement, not a courtesy: the parent def, the
  architect tab and both item categories all come from it.
- **【1.5】Fox Lamp Forked** (`mg.ferianstory.foxlamp`) must be **disabled**. It is still in the
  Workshop folder and it declares the same `Fox_Lamp`. See scenario 14.
- The log to read afterwards, and to attach to any report:
  `C:\Users\nelim\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`
- Materials: **80 marble blocks**, so a marble-bearing map or Debug actions → Spawn thing →
  `BlocksMarble`. The piece costs **24 000 work**, four fifths of a vanilla large sculpture, and
  will take a builder days; Debug actions → Finish construction is the way through it, except in
  scenario 5, where the work has to complete normally.
- Fuel for scenario 6: **hay, wood or chemfuel**. It is built with a full frame, so none is needed
  to see it light, but some is needed to see it refuelled.

Useful comparisons, all read out of the vanilla files:

| | Beauty | Work |
|---|---|---|
| Small sculpture | 50 | 18 000 |
| Large sculpture | 100 | 30 000 |
| Grand sculpture | 400 | 105 000 |
| **Fox Lamp** | **800** | **24 000** |

So it is twice as beautiful as the best sculpture vanilla has, for less than a quarter of its work.
That is not a balance the port introduced — it is AmliFurx's, unchanged — but it is worth knowing
before judging whether the piece feels right. A legendary vanilla sculpture also reaches a
meditation focus strength of 0.28, where this sits flat at **0.4**.

## 1. Without its dependency, it must fail loudly

The first thing to prove, because every other scenario assumes it. Four separate names in the def
belong to the other mod, and none of them is optional.

1. Enable **this mod alone**, with SydailyFox disabled. Let the game load.

**Pass:** the def does not load, the building is absent from every architect tab, and the log says
so in as many words. The lines to find:

```
XML error: Could not find parent node named "AF_NaturalBuildingBase" for node "ThingDef"
Could not resolve cross-reference to RimWorld.DesignationCategoryDef named AF_Thankyou
Could not resolve cross-reference to Verse.ThingCategoryDef named AF_TC_RimFurry_Building_Thankyou
```

**Fail:** the building appears anyway, or the game loads in silence. A silent load would mean the
def resolved names from somewhere unexpected, which is worth knowing before release.

2. Re-enable SydailyFox, load again.

**Pass:** none of those three lines is in the log, and nothing red names `Fox_Lamp`.

## 2. It is in AmliFurx's tab, buildable on day one

1. Open the Architect menu and find the **AmliFurx** tab.

**Pass:** **Fox Lamp** is in it, beside the other thank-you pieces the parent mod ships. No research
prerequisite, cost 80 marble blocks, tech level neolithic — a tribe must be able to build it on day
one, materials permitting. The tooltip carries the description, ending on AmliFurx's signature and
the 2020 date.

**Fail:** absent from the tab, or filed in a vanilla tab such as Furniture or Misc.

## 3. The build-menu icon is a book, and that is correct

Read this before reporting it as a bug.

**Pass:** the icon in the build menu is a small **book**, not a picture of the sculpture. AmliFurx
drew a series of stylised cards rather than representations, and the file is shipped untouched. It
is scaled to 1.8 because the source art is small in its canvas.

**Fail:** a pink or missing-texture square. That is a real fault; a book is not.

## 4. Beauty reaches the inspect pane

This is the fix the port exists for. Before it, the piece was built around a Beauty of 800 and never
showed it, because the def used the plain `Building` class it inherits instead of vanilla's
`Building_Art`.

1. Build one. Select it and read the inspect pane.

**Pass:** a **Beauty** line is there, reading **800**. For scale, stand a vanilla grand sculpture
beside it: that one reads 400, and it is the best vanilla has.
**Fail:** no Beauty line at all. That means the `thingClass` override was lost.

2. Put it in a small room and check the room's stats.

**Pass:** the room's beauty and impressiveness jump. 800 in one cell is a great deal, and it should
be obvious.

## 5. It becomes a work of art without ever having a quality

The subtle one, and the one an obvious "fix" would break. The def carries `CompProperties_Art` with
**no** `CompQuality`, unlike every vanilla art building. It works because
`Frame.CompleteConstruction` calls `InitializeArt` itself when the finished thing has no quality
comp — so the art is set up **by the act of finishing construction**.

1. Build one the ordinary way, letting a colonist finish the work. **Do not** use Debug actions →
   Spawn thing for this scenario, and do not skip the frame: spawning the finished building bypasses
   the very code path being tested.
2. Select it and open the **Art** tab.

**Pass:** it has a generated title, a named author, and a sculpture description in the art tab. The
inspect pane shows **no quality label** — no "good", no "excellent", nothing. Beauty stays flat at
800 whoever built it, because there is no quality to scale it.

**Fail:** an empty or missing art tab, or a null-reference in the log at the moment the frame
completes. Also a fail, in the other direction: a quality label appearing, which would mean a
`CompQuality` crept in and the flat Beauty is now being scaled.

3. Build a second one with a much better or much worse artist.

**Pass:** both read 800. The trade for having no quality is that the piece never rolls.

## 6. It lights, and that part is not AmliFurx's

The one thing in this mod that is a change to his work rather than a repair of it, so it gets the
longest scenario. Three comps do it, and the game wires them together: `CompGlower` asks
`CompRefuelable` for fuel and `CompFlickable` for the switch. Vanilla's torch pairs the first two
but has no switch; the three together are the wood-fired and chemfuel generators, so that trio is
the pattern being followed and the one to compare against if a step below misbehaves.

1. Place one, and watch the placement ghost before confirming.

**Pass:** a lit-radius ring is drawn around the ghost while you position it, the way it is for any
vanilla lamp. That is `PlaceWorker_GlowRadius`.

2. Finish building it, then wait for night or Debug actions → set the hour to 2.

**Pass:** it is **already lit**, without anyone hauling fuel to it first — `initialFuelPercent` is
1, so it is built with a full frame. The pool reaches radius 10, the same as a vanilla torch or
brazier, in the warm amber of its sister lamps rather than the white of an electric light. Stand a
torch beside it and the two pools should look the same size.

**Fail:** built dark. That means the initial fuel was lost, and a player would reasonably conclude
the light does not work.

3. Read the inspect pane.

**Pass:** a fuel bar, a refuelling job when it runs low, and an on/off switch. Twelve units at full.

4. Switch it off.

**Pass:** the glow goes out at once and fuel stops draining. Switch it back on and the light
returns.

5. Check what it will accept as fuel.

**Pass:** hay, wood and chemfuel, and nothing else. Those are its sister lamp's three, not a choice
made here.

6. Let it run dry, or Debug actions → empty the fuel.

**Pass:** it goes dark and **stays standing**. `destroyOnNoFuel` is false, so an unattended
monument is an unlit monument, never a lost one. Beauty, the art title and the meditation focus all
survive being unlit — none of them is wired to the glow.

7. Put it in a small sealed room and watch the temperature.

**Pass:** the room does **not** warm up. It has no heat pusher, deliberately: a marble carving
warming a room is the part that would not read. Its sister lamp does push heat; this one does not.

8. Look at the sprite while it is lit.

**Pass:** no flame is drawn on the art — only the light on the ground changes. There is no fire
overlay, on purpose: vanilla draws that flame at the centre of the cell, and this piece is drawn
at 4.92 cells, so the flame would sit at its foot instead of inside the lantern frame.

9. Start a fire next to it.

**Pass:** it does not catch. Flammability is 0, which is what vanilla's own torch base uses too.

## 7. No colour mask, and no tint

The companion mask file never loaded in any version since 2020 and is deliberately not shipped, but
the `CutoutComplex` shader that would use it is kept so the piece draws exactly as players knew it.

**Pass:** the sculpture is drawn in its own marble greys and blacks, the way the texture looks. No
colour-picker gizmo, no faction colour, no black or magenta silhouette.
**Fail:** the piece renders solid dark or takes on a tint. That would mean the shader is now finding
a mask where it should find none.

## 8. It is drawn five times the size of the cell it occupies

`drawSize` is 4.92 on a 1x1 building. This is authored and correct, but it looks wrong the first
time.

1. Build one in the open.

**Pass:** the art spills well beyond its own cell, with a shadow under it, while the building
**occupies exactly one cell**. Build a wall in the cell directly north of it: the wall goes up
normally and the two overlap on screen without either refusing to be placed.

## 9. You can walk through it

`fillPercent` 0, `pathCost` 0, `passability` PassThroughOnly, and `isEdifice` false. This piece
blocks nothing at all, which is unusual — a vanilla sculpture has a path cost of 50 and fills half
its cell.

1. Put it in the middle of a corridor and watch the traffic.

**Pass:** colonists walk straight over its cell without slowing or stepping around, and no red
pathing error appears.

2. Put it in a doorway-width gap in a wall and check the room.

**Pass:** the two sides are still **one room**. It is not an edifice, so it does not divide space
and it does not count towards a room's structure.

3. Try to paint a growing zone over its cell.

**Pass:** the zone refuses that one cell. `canOverlapZones` is false.

## 10. Meditation: a flat focus, stronger than a legendary sculpture

1. Assign a colonist a meditation focus and look for the Fox Lamp in the list. Have them meditate
   in front of it.

**Pass:** it is offered as an **Artistic** focus, and its focus strength reads **0.4**. Meditation
proceeds normally with the colonist facing it.

2. Build three more within a few cells and check the strength again.

**Pass:** still 0.4. Vanilla gives a bonus for standing among several sculptures, but that offset
names `SculptureSmall`, `SculptureLarge` and `SculptureGrand` by def, and `Fox_Lamp` is not among
them. Four of these are worth exactly what one is.

3. Compare against a legendary vanilla sculpture.

**Pass:** the legendary one reaches 0.28 and this one sits at 0.4, unchanging. That is the trade for
having no quality: it cannot roll badly, and it cannot roll well either.

## 11. It moves house, and it keeps its name

1. Select it and choose **Uninstall**. Let a colonist carry it away.

**Pass:** it becomes a minified Fox Lamp, an item that can be hauled and stored. It appears in a
stockpile's filter tree under the parent mod's two thank-you categories, not under a vanilla one.

2. Re-install it somewhere else.

**Pass:** it goes back up and **keeps the art title and author** it was given when it was first
built. A new title would mean the art comp is being re-initialised on every install.

3. Deconstruct one instead.

**Pass:** marble blocks come back, as `leaveResourcesWhenKilled` promises.

Watch the log at load for `is not minifiable yet has thing categories`. This def has both a
`minifiedDef` and two thing categories, so it satisfies that check; the line appearing would mean
the `minifiedDef` was lost, and it takes the whole def down with it.

## 12. French

Switch the game to French and walk scenarios 2, 4 and 5 again.

**Pass:** the description reads *Une pousse de bambou taillée dans le marbre…* in the build menu and
the inspect pane, with its paragraph breaks intact and the shout on its own line. The label stays
**Fox Lamp** in English — that is deliberate and not a missing translation. It is the title AmliFurx
gave the piece, and translating it would rename someone's artwork.

**Fail:** the English description showing through, or accented characters arriving mangled.

## 13. Saves, before and after

The `defName` is unchanged from the 1.5 mod on purpose, so that a colony that already has one
standing does not lose it.

1. Build one, save, reload.

**Pass:** it is still there, still with its art title, no red line on load.

2. Add the mod to a colony that never had it.

**Pass:** the building appears in the AmliFurx tab, nothing else changes, no error.

3. Remove it from a colony that had one built.

**Pass:** the game gives its usual missing-content warning, the colony loads and plays, and the
piece is gone. Deconstruct any you have built first if you would rather avoid the warning.

4. The upgrade case, if you can reach it: a save made while the piece was still unlit, loaded with
   this version. Either an old save from before the light was added, or one made with the 1.5 fork
   in place of this mod.

**Pass:** the standing piece gains the fuel frame and the switch, loads without a red line, and
keeps its art title. Whether it comes back lit or empty is not the test — either is acceptable, and
worth writing down, since the fuel comp is new to a thing that was saved without one.

## 14. The 1.5 fork and this mod must never be enabled together

Both declare `Fox_Lamp`, and the 1.5 mod additionally declares the four lamps that SydailyFox now
ships itself.

Since 2026-09-12 the About declares `mg.ferianstory.foxlamp` in `<incompatibleWith>`, so the game
says so rather than leaving it to be discovered.

1. Enable **【1.5】Fox Lamp Forked** and this mod at the same time, in the mod list.

**Pass:** the mod list marks the pair as incompatible and warns before you start, naming the 1.5
fork. The warning is the whole point: the duplicate it prevents is silent otherwise.

2. Ignore the warning and load anyway.

**Expected:** RimWorld keeps one `Fox_Lamp` and logs a duplicate-defName error; whichever loads
last wins. Nothing crashes, but one of the two mods is doing nothing. This is what the declaration
exists to stop, so seeing it here is the confirmation, not a failure of the mod.

3. Read the mod description in the list.

**Pass:** it tells anyone still subscribed to the fork to unsubscribe or disable it, and says they
lose nothing by doing so — everything the fork had is either in this mod or in the parent it
requires.
