# Art — sources

RimWorld never reads this folder, and neither does Steam: only `Mod/` is published. What lives
here is the material needed to rebuild the shipped showcase, and nothing else.

It was composed from **the mod's own sprite** rather than generated. For a mod that is one
object, the object is the honest showcase — and AmliFurx's texture already is the thing being
sold. `STYLE_RIMWORLD.md` describes a painted RimWorld *scene*, which is the repository's
default; this is a deliberate departure, noted here so a later pass can regenerate rather than
guess why.

**The mod ships with no `ModIcon.png`.** See the last section for why, and for what has to be
drawn before it gets one.

## `sprite-trimmed.png` — 166 x 321, 44 KB

`Mod/Textures/Thankyou/Fox_Lamp.png` is 812 x 812 with the piece occupying a small part of a
mostly transparent canvas. The alpha bounding box was measured, not eyeballed:

```
ffmpeg -i Mod/Textures/Thankyou/Fox_Lamp.png -vf "alphaextract,bbox=min_val=16" -f null -
# x1:323 x2:488 y1:168 y2:488 -> crop=166:321:323:168
ffmpeg -y -i Mod/Textures/Thankyou/Fox_Lamp.png -vf "crop=166:321:323:168" Art/sprite-trimmed.png
```

Kept because both images below are built from it, and because re-deriving it means re-measuring.

## `Mod/About/Preview.png` — 896 x 504, 337 KB

Built by `preview.html` in this folder, rasterised by Chrome headless. The page references
`sprite-trimmed.png` by relative path, so the command below reproduces the shipped file
**byte for byte** — verified by `md5sum`.

```
"/c/Program Files/Google/Chrome/Application/chrome.exe" --headless --disable-gpu \
  --hide-scrollbars --window-size=896,504 \
  --screenshot=Mod/About/Preview.png \
  "file:///C:/Users/nelim/Documents/rimworld/FoxLampRenew/Art/preview.html"
```

Text is composed **at final size**, so the glyphs are never resampled. The repository engraving
standard is followed exactly:

| | Value |
|---|---|
| Title | `Fox Lamp`, 62 px, one line |
| Rule | 58 x 3, amber `#D68F2C` |
| Summary | 21 px over 430 px |
| Darkening | radial from the top-left corner, `rgba(6,5,4,.86)` at the centre, nil at **74 %** |

The summary is lifted word for word from the `About.xml` description, as the standard requires.
No count is engraved: the rule allows one for a frozen source, but "one sculpture" would read as
an apology for the mod rather than a description of it.

**The light comes from off-frame right, and the piece never emits any.** This is the one thing
about this mod that a showcase can get wrong. It is called Fox *Lamp* and it is drawn inside a
lantern frame, but it has no `CompProperties_Glower`, no fuel and no heat — it is a sculpture. A
banner showing it aglow would advertise something the mod does not ship. The warm pool is a
radial gradient anchored at 74 % width, outside the object.

Checked at 268 px, the real Workshop thumbnail width: the name reads, the silhouette reads. The
summary falls to about 6 px and is not meant to be read there — it is written for whoever opens
the mod page.

## `Mod/About/ModIcon.png` — removed, pending a mascot

There was one, briefly: the same crop scaled to 54 x 104 and centred on a near-black ground, a
pale marble ogive on a dark square base. It was 128 x 128 and 8 KB, so it broke no file
constraint. It was removed on **2026-09-11** all the same, under a rule that runs across the
repository.

The `ModIcon` block of `STYLE_RIMWORLD.md` used to ask for an object pictogram — *"no character,
no face"* — and that is what the ogive was. The block was wrong about what this repository
actually draws: the sixty icons that exist are all **one mascot**, a round head seen
three-quarter, winking one eye, a small ponytail at the top right, a thick near-black outline
and flat cel shading, with the mod's own subject fused into it. Shallow Water Floor's is blue
with ripples across the face; Mintchoco's head *is* a scoop of mint ice cream on a cone. The
block was rewritten from the files themselves on 2026-09-11.

An off-style icon is worse than none, because the mascot is what makes the family read at 32 px
in a mod list — a lone grey ogive would read as a mod from somewhere else. Shipping without one
is a normal state here rather than a broken one: `ModIcon` is optional to RimWorld, and most of
the repository has none while the set is being drawn.

The replacement brief lives in `PROMPT_FOXLAMP.md` at the repository root, per the workflow
`PUBLISHING.md` sets out. It is gitignored, and it gets deleted the day the icon exists.

**Whatever is drawn, it must not be built from `UI_Fox_Lamp.png`.** That file is the
*build-menu* icon and it is a **book** — the author's deliberate style, shipped untouched, and
explained in `ATTRIBUTION.md`. It names nothing at 32 px in a list of mod icons.

## Tooling on this machine, as of 2026-09-05

`ffmpeg` and Chrome are present. **ImageMagick is not** — the `convert` on `PATH` is Windows'
own filesystem tool, which will fail with `Paramètre non valide` on an image path. Everything
above is therefore ffmpeg and Chrome only.
