# Fox Lamp — attribution

There are two links in this chain, and both are credited here.

| | |
| --- | --- |
| **AmliFurx** | wrote the piece. `Fox_Lamp` first appeared in **Fox Lamp** (https://steamcommunity.com/sharedfiles/filedetails/?id=2166575832), signed and dated in its own description: *"--By:AmliFurx / --2020-7-15"*. |
| **Megapa3yM** (MEGA) | carried it to 1.5 in **【1.5】Fox Lamp Forked** (https://steamcommunity.com/sharedfiles/filedetails/?id=3248294052), published 17 May 2024, one version note, stopped at 1.5. Their own description says: *"Updated version of AmliFurx's Fox Lamp mod. If AmliFurx require, i will remove this mod from workshop."* |
| **nelim** | this 1.6 port. |

Neither the 1.5 mod folder nor its Workshop page states a licence. This port follows the
usual practice for abandoned mods: **explicit credit to both authors, links to both
originals, and removal on request.** Megapa3yM applied that same clause to AmliFurx, and it
is passed on unchanged.

Thanks also to **Mlie** (emipa606), whose 【AF】SydailyFox (Continued) is what this mod
stands on — see below.

## What was taken

Exactly one def, and two of its three textures.

| Element | Source |
| --- | --- |
| `Fox_Lamp` — a bamboo shoot carved from marble, in an open lantern frame | `1.5/Defs/[Thankyou]/Hello_Lansy.xml` |
| `Textures/Thankyou/Fox_Lamp.png` | 82 KB, the building sprite |
| `Textures/Thankyou/UI_Fox_Lamp.png` | 63 KB, the build-menu icon |

The `defName` is unchanged on purpose: renaming it would drop the piece out of any save
that already has one standing.

## What was left out, and why it is most of the mod

**The 1.5 mod's other four buildings are already in RimWorld 1.6, shipped by the mod it
declares as its own dependency.**

【AF】SydailyFox (Continued) (https://steamcommunity.com/sharedfiles/filedetails/?id=3540588386,
`Mlie.AFSydailyFox`) supports 1.6 and carries, identical to whitespace reformatting:

- `AF_theFurLight`
- `AF_theFurLight_Normal`
- `AF_theFurLight_Tiny`
- `BambooShootLamp`
- the `AF_CITE` designation category
- `Patches/Flickable.xml`, byte-for-byte once whitespace is stripped

Porting them here would put five duplicate `defName`s against a mod the user is *required*
to have installed. RimWorld keeps one of a duplicate pair and logs the collision; the
result is a mod that is both broken and pointless.

`Fox_Lamp` is the one def the parent mod does not have. The parent's nearest equivalent,
`Sydaily_Fox`, is a different piece: a different texture, a different description, a
different date (2020-6-19), and a different `defName`.

Also left out:

- **`Textures/Thankyou/Fox_Lampm.png`**, 24 KB — see *What was fixed*.
- **All twenty-six `Languages/` folders.** They were byte-identical: `md5sum` over the
  twenty-six copies of `DefInjected/ThingDef/Hello_Lansy.xml` returns **one** hash. Every
  one of them, French and Japanese included, held the same untranslated English stub that
  RimTrans generates. There was nothing in them to carry over.
- **The `old/` folder**, a duplicate copy of the defs for RimWorld 1.1–1.3, and the
  `LoadFolders.xml` that pointed at it.
- **The `Mlie.AFSydailyFox` dependency was kept, not dropped.** Noted here because the
  opposite call was considered: it is not a thematic listing. `AF_NaturalBuildingBase` —
  the parent of `Fox_Lamp` — is *not* among the abstract bases the 1.5 mod defines locally;
  `1.5/Defs/【Base】/AF_SpecialBuildingBase.xml` declares `AF_SpecialBuildingBase` and
  `AF_SpecialBenchBase`, and nothing else. The parent, the `AF_Thankyou` architect tab and
  both `AF_TC_RimFurry_Building_Thankyou*` categories all live in the dependency. Remove it
  and the def does not resolve.

## What was fixed

### The colour mask never loaded, in any version

`Graphic_Single.MaskSuffix` is `"_m"`, and the lookup is `path + MaskSuffix`:

```csharp
// Verse.Graphic_Single.Init
req2.maskTex = ContentFinder<Texture2D>.Get(
    maskPath.NullOrEmpty() ? (path + MaskSuffix) : maskPath,
    reportFailure: false);
```

With `texPath` of `Thankyou/Fox_Lamp`, the game asks for `Thankyou/Fox_Lamp_m`. The file
shipped is `Fox_Lampm.png` — no underscore — so the request has missed since 2020, and
`reportFailure: false` means it missed in silence. The mask covers the shoot in green,
which is the `colorTwo` channel; with no `color` or `colorTwo` set on the def, it would
have tinted nothing even had it loaded.

**Removed rather than renamed.** Renaming it would hand the shader a mask it has never had,
and how that changes the render cannot be established without launching the game. A port
should look like the mod people knew. `shaderType` stays `CutoutComplex` for the same
reason: it is what the sprite has always been drawn with.

### Beauty was never shown

Vanilla art buildings use `Building_Art`, whose entire body is one thing:

```csharp
// RimWorld.Building_Art
return text + $"{StatDefOf.Beauty.LabelCap}: {...GetStatValue(StatDefOf.Beauty)}";
```

`AF_NaturalBuildingBase` sets `thingClass` to plain `Building`, and `Fox_Lamp` never
overrode it — so the one stat the piece is built around, a Beauty of 800, was the one thing
its inspect pane would not say. It is now `Building_Art`.

### The description said nothing about the object

The original description is the joke and the signature, and nothing else. Both are kept word
for word; one sentence saying what the thing is now comes before them, so the build menu
tooltip describes something.

The shipped English was also wrong. `不！准！吃！竹！笋！！！！` is *"don't you eat the
bamboo shoot"*, chopped between characters for emphasis. It had been machine-translated to
*"No! Shoot! Eat! Bamboo! Shoot! ! !"*, which reads as neither. It now says what the
original says, in the original's rhythm.

The description also mixed real newlines with literal `\n` escapes, which
`DirectXmlToObject.InnerTextWithReplacedNewlinesOrXML` turns into *more* newlines
(`InnerText.Replace("\\n", "\n")`) — so every break rendered doubled. It now uses newlines
only.

## What was changed against the author, and why that is allowed here

**The lantern lights, and he never meant it to.** This is the only thing in the mod that is not
a repair, and it breaks the rule the section below sets out — that a value the author wrote down
is kept. He wrote down no glower at all, which is a written choice as much as a number is.

The evidence that it was a choice and not an oversight is strong enough to be worth recording,
because it is what makes this an honest change rather than a careless one:

- All four lamps in the required mod — `AF_theFurLight`, `_Normal`, `_Tiny` and
  `BambooShootLamp` — carry `CompProperties_Glower` **and** `CompProperties_Refuelable`. He knew
  how to make a lamp; he made four.
- He filed those four in the `Furniture` and `AF_CITE` tabs. He filed this one in `AF_Thankyou`,
  with the statues, and gave it a Beauty of 800 against their 8 to 40.
- `Lansy_Statue`, another of his thank-you pieces in that same tab, **does** carry a glower. So
  the tab is not a rule against light either. He added one where he wanted one.
- Even the colour mask that never loaded points the same way: it covers the marble shoot and
  leaves the lantern frame out of it entirely. A colour mask, never a glow map.

So the name was the joke, not a promise, and the piece he made is a sculpture.

It lights here because we wanted it to light. The licence for that is the `Renew` suffix, which
in this repository does the work `(Continued)` does elsewhere: it says the mod has been taken
over and may be changed, not merely recompiled. A straight port would have had to leave this
alone. Anyone who wants the sculpture as he made it has it: the 1.5 fork is still on the
Workshop, unlit, and says 1.5 on the tin.

**What the light is made of, and where the numbers come from.** Glower at radius 10 in
`(227,115,32,0)`, flickable, refuelable on hay, wood or chemfuel at 0.4 a day against a 12-unit
frame. The colour and the fuel are `BambooShootLamp`'s, unchanged — the nearest thing he drew to
this piece and the same subject, a bamboo shoot. Borrowing his own numbers for a thing he did not
build is the least invention available. Two additions of our own: `initialFuelPercent` 1, so a
finished piece is lit rather than waiting on a hauler, and `PlaceWorker_GlowRadius`, which every
vanilla light has.

**The radius is the exception, and it is rebalancing rather than borrowing.** It was 4.2 for a
day, his bamboo lamp's figure, and that was the wrong instinct: it is the smallest of his five
lamps, it is below everything the base game calls a lamp, and a pool of 4.2 would not have covered
this sculpture, which is drawn at 4.92 cells. The piece would have lit less ground than it stands
on.

| | Radius |
|---|---|
| `BambooShootLamp`, 2020 | 4.2 |
| `AF_theFurLight_Normal` and `_Tiny` | 8.2 |
| Vanilla `TorchWallLamp` | 9 |
| Vanilla `TorchLamp`, `Brazier` | **10** |
| Vanilla `WallLamp` | 11 |
| Vanilla `StandingLamp` | 12 |
| `AF_theFurLight`, his flagship | 14.2 |
| Vanilla `SunLamp` | 14 |

10 is where a fuel-burning floor light sits in 1.6, and the piece lands between his own two
middling lamps and his flagship rather than under all of them. The objection that a strong light
turns a monument into everyone's cheap lamp does not survive the cost: 80 marble blocks and 24 000
work is eight times a torch in every currency. The gate is the price, not a dim glow.

**Two things `BambooShootLamp` has that were declined.** `CompProperties_HeatPusher`, because a
marble carving warming a room is the one part of this that does not read, and the piece keeps
`Flammability` 0 — which vanilla's own `TorchBase` also uses, so that is not the oddity it looks
like. And `CompProperties_FireOverlay`, because vanilla draws that flame at the centre of the
cell while this sprite is drawn at 4.92 cells: the flame would appear at the sculpture's foot
rather than inside the lantern frame.

## What was checked and deliberately not changed

**No `CompQuality`, unlike every vanilla art building.** `ArtBuildingBase` pairs
`CompProperties_Art` with a quality comp; `Fox_Lamp` has art without it. This was checked
rather than assumed, because `CompArt.Active` is `taleRef != null` and `InitializeArt` is
normally reached through `CompQuality.SetQuality`. The game covers the case explicitly:

```csharp
// RimWorld.Frame.CompleteConstruction
CompArt compArt = thing.TryGetComp<CompArt>();
if (compArt != null)
{
    if (compQuality == null)
    {
        compArt.InitializeArt(ArtGenerationContext.Colony);
    }
    compArt.JustCreatedBy(worker);
}
```

`CompArt.CanShowArt` likewise returns `true` when `TryGetQuality` fails. So the piece gets
its generated title, its author and its art tab. The consequence of having no quality is
that Beauty and focus strength are flat rather than rolled — which, for a one-off trophy,
is a defensible thing to want.

**The build-menu icon is a book, and it stays a book.** `uiIconPath` points at
`Thankyou/UI_Fox_Lamp`, a 256 x 256 drawing of a black book with a gold emblem on the cover —
not a picture of the marble shoot the def builds. That looks exactly like a copy-paste
mistake, and the `uiIconScale` of 1.8 seems to confirm it: 1.8 suits a small object adrift on
a large transparent canvas, which describes the building sprite and not an icon that already
fills its square.

It is not a mistake. The 1.5 mod's other icons are the same kind of thing — `UI_theFurLight`
is a sheet of calligraphy, `UI_BambooShootLamp` is an acorn on an orange card. AmliFurx drew a
set of small stylised cards, not depictions, and the book belongs to it. Dropping `uiIconPath`
so the game would fall back to the building's own graphic would have been the obvious "fix",
and it would have broken a deliberate style across the whole set. Both fields ship untouched.

**The numbers.** They are high: Beauty 800 against 400 for a vanilla grand sculpture, on a
quarter of the footprint, for 80 marble blocks against 400 stuff, and 24 000 work against
105 000. `MeditationFocusStrength` of 0.4 flat is above the 0.28 a *legendary* vanilla
sculpture reaches through `FocusStrengthOffset_Quality`.

They are left alone **for now**, and the reason is no longer the one this document used to
give.

The old line came from Shallow Water Floor: a number gets corrected when it was never
*chosen* — an absent field falling back to a default — and is kept when the author wrote it
down. Every one of these was written down, so every one of them stayed.

**That line does not govern a Renew.** Decided on 2026-09-12: rebalancing is part of what
the suffix means, not a violation of it. A mod that has sat untouched for years is being
measured against an ecosystem that moved on without it, and a value the author chose in 2020
can be wrong in 1.6 without the author ever having been wrong. The glow radius is the worked
example, two sections up: 4.2 was his figure, and keeping it would have lit less ground than
the sculpture covers.

So Beauty 800, `MeditationFocusStrength` 0.4 and 24 000 work are now open questions rather
than settled ones. They are untouched here because rebalancing them is a deliberate pass and
not a side effect of adding a lamp, and because the case for leaving them is still real: it
is a thank-you piece, and being out of scale may be the point of it. What has changed is
that "he wrote it down" is no longer the answer on its own.

## Verified against 1.6

Every field of the def was checked against the 1.6 game files and the 1.6 assembly.
Nothing in it was broken by 1.6 itself — everything under *What was fixed* was already
broken in 1.5.

- `AF_NaturalBuildingBase` still exists in the dependency's 1.6 build, and still sets
  `category`, `thingClass`, `terrainAffordanceNeeded`, `filthLeaving` and `tradeability`.
- `MeditationFocusStrength`, the `Artistic` `MeditationFocusDef`, `NamerArtSculpture`,
  `ArtDescription_Sculpture` and `BlocksMarble` are all in **Core** in 1.6 — no Royalty or
  Ideology requirement, which is why none is declared.
- `ai_chillDestination`, `clearBuildingArea`, `useHitPoints`, `descriptionMaker`,
  `canBeEnjoyedAsArt`, `uiIconScale`, `uiIconPath`, `shadowData`, `nameMaker`, `isEdifice`,
  `ITab_Art` and the `CutoutComplex` shader are each still read from XML by vanilla 1.6
  defs.

## Adoption

If I do not answer within a reasonable time after being contacted, anyone may freely update
this or any other of my mods, including publishing a continuation of it. All credit must be
preserved.
