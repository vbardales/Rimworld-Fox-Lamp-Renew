# Fox Lamp Renew (unofficial)

UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

RimWorld 1.6 port of **Fox Lamp**, by **AmliFurx** — kept alive through 1.5 by **Megapa3yM**.

**I am not the author of this mod.** The piece is AmliFurx's, made in July 2020 as a
thank-you to a player, and signed inside its own description. Megapa3yM carried it to 1.5.
Most of what I did was the work needed to make it run on 1.6. The light is the exception, and it
is described below. Credit goes to them; mistakes here are mine.

- Original: https://steamcommunity.com/sharedfiles/filedetails/?id=2166575832 (AmliFurx)
- 1.5 fork: https://steamcommunity.com/sharedfiles/filedetails/?id=3248294052 (Megapa3yM, stopped at 1.5)

## What it is

One building: a bamboo shoot carved from marble, standing in an open lantern frame. It is a
**sculpture first** — that is what its beauty and its meditation focus are for — and, since
the Renew release, **a small lamp as well**.

| | |
| --- | --- |
| Cost | 80 marble blocks, 24 000 work |
| Beauty | 800, twice a vanilla grand sculpture |
| Meditation | `Artistic` focus, strength 0.4, flat |
| Light | radius 10, switchable, hay / wood / chemfuel |
| Fuel | 12 units, 30 days to a tank |
| Heat | none — it is marble |
| Tab | **AmliFurx**, alongside the other thank-you pieces |

**The light is mine, not AmliFurx's.** He gave the piece no glower in any version since 2020,
and that was a choice rather than an oversight: the four lamps in the mod this one requires all
have one, he filed this piece in a different architect tab from them, and he added a glower to
another of his own thank-you statues. The name was the joke, not a promise. It lights here
because I wanted it to, which is the difference between a Renew and a straight port. The unlit
piece he made is still on the Workshop as the 1.5 fork.

No code, no Harmony, no patches. Safe to add to an ongoing save; deconstruct any you have
built before removing it mid-save.

## It requires 【AF】SydailyFox (Continued)

Not a courtesy listing — a hard requirement.
https://steamcommunity.com/sharedfiles/filedetails/?id=3540588386 (`Mlie.AFSydailyFox`)

`Fox_Lamp` inherits `AF_NaturalBuildingBase` from it, sits in its `AF_Thankyou` architect
tab, and files itself under two of its `AF_TC_*` categories. Without it the def does not
resolve.

## Why this mod is one def and not five

**The 1.5 mod's other four buildings are already in 1.6 — in the mod it depends on.**

【AF】SydailyFox (Continued) ships `AF_theFurLight`, `AF_theFurLight_Normal`,
`AF_theFurLight_Tiny`, `BambooShootLamp`, the `AF_CITE` category and `Patches/Flickable.xml`
— all identical to the fork's, once whitespace is stripped. Republishing them would put five
duplicate `defName`s against a mod you are required to have.

`Fox_Lamp` is the only def in the fork that the parent mod never had. Its nearest relative
there, `Sydaily_Fox`, is a different piece with a different texture, description and date.

**If you are here for the fox lamps, you want the parent mod, not this one.**

## What changed in the 1.6 update

Nothing in the def was broken by 1.6 itself. Three things were broken before it.

### The colour mask never loaded, in any version

`Graphic_Single.MaskSuffix` is `"_m"`, and the game looks up `path + MaskSuffix` — so with a
`texPath` of `Thankyou/Fox_Lamp` it asks for `Thankyou/Fox_Lamp_m`. The file shipped is
`Fox_Lampm.png`, without the underscore, and the lookup passes `reportFailure: false`. It
has missed silently since 2020.

The 24 KB file is **not shipped, rather than renamed**: handing the shader a mask it has
never had would change the render, and that cannot be established without launching the
game. A port should look like the mod people knew.

### Beauty was never shown

Vanilla art buildings use `Building_Art`, whose whole body is a line appending Beauty to the
inspect string. `AF_NaturalBuildingBase` leaves `thingClass` at plain `Building` and
`Fox_Lamp` never overrode it — so the one stat the piece is built around was the one it
would not show. Fixed.

### The description said nothing about the object, and its English was wrong

AmliFurx's line — the joke and the signature — is kept word for word, with one sentence
before it saying what the thing is, so the build menu tooltip describes something.

The shipped English read *"No! Shoot! Eat! Bamboo! Shoot! ! !"*, a machine translation of
`不！准！吃！竹！笋！！！！`, which is *"don't you eat the bamboo shoot"* chopped between
characters for emphasis. It now says what the original says.

## One thing that looks broken and is not

The build-menu icon is **a book** — not a picture of the marble shoot. That reads as a
copy-paste slip, and dropping `uiIconPath` so the game falls back to the building's own graphic
is the obvious fix.

It would have been wrong. The 1.5 mod's other icons are the same kind of thing: a sheet of
calligraphy for the fur light, an acorn on an orange card for the bamboo shoot lamp. AmliFurx
drew a set of small stylised cards rather than depictions. The book belongs to that set and
ships untouched.

## What was left out

- All **twenty-six** `Languages/` folders. They were byte-identical — `md5sum` over the
  twenty-six copies returns one hash. Every one held the same untranslated English stub.
  English now lives in the def, and there is a real French translation.
- The `old/` folder, a duplicate of the defs for 1.1–1.3, and its `LoadFolders.xml`.
- `Fox_Lampm.png`, above.

## Terms

Neither the 1.5 mod folder nor its Workshop page states a licence. This port follows the
usual practice for abandoned mods: **explicit credit to both authors, links to both
originals, and removal on request.** Megapa3yM applied that clause to AmliFurx; it is passed
on unchanged.

If I do not answer within a reasonable time after being contacted, anyone may freely update
this or any other of my mods, including publishing a continuation of it. All credit must be
preserved.

## Credits

- **AmliFurx** — the piece itself.
- **Megapa3yM** — the 1.5 fork this port starts from.
- **Mlie** (emipa606) — 【AF】SydailyFox (Continued), the mod this one stands on.
- 1.6 port by nelim. Written with the help of Claude (Anthropic).

Full detail, including what was checked and deliberately left alone, is in
[ATTRIBUTION.md](ATTRIBUTION.md).
