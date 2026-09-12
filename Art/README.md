# Art — sources

RimWorld never reads this folder, and neither does Steam: only `Mod/` is published. What lives
here is the material needed to rebuild the shipped showcase, and nothing else.

It was composed from **the mod's own sprite** rather than generated. For a mod that is one
object, the object is the honest showcase — and AmliFurx's texture already is the thing being
sold. `STYLE_RIMWORLD.md` describes a painted RimWorld *scene*, which is the repository's
default; this is a deliberate departure, noted here so a later pass can regenerate rather than
guess why.

**The mod ships a `ModIcon.png` since 2026-09-12.** See the last section but one for what it is and
for the one rule it deliberately departs from.

## `sprite-trimmed.png` — 166 x 321, 44 KB

`Mod/Textures/Thankyou/Fox_Lamp.png` is 812 x 812 with the piece occupying a small part of a
mostly transparent canvas. The alpha bounding box was measured, not eyeballed:

```
ffmpeg -i Mod/Textures/Thankyou/Fox_Lamp.png -vf "alphaextract,bbox=min_val=16" -f null -
# x1:323 x2:488 y1:168 y2:488 -> crop=166:321:323:168
ffmpeg -y -i Mod/Textures/Thankyou/Fox_Lamp.png -vf "crop=166:321:323:168" Art/sprite-trimmed.png
```

Kept because both images below are built from it, and because re-deriving it means re-measuring.

## `Mod/About/Preview.png` — 896 x 504, 340 KB

Built by `preview.html` in this folder, rasterised by Chrome headless. The page references
`sprite-trimmed.png` by relative path, so the command below reproduces the shipped file
**byte for byte** — verified by `md5sum`.

```
"/c/Program Files/Google/Chrome/Application/chrome.exe" --headless --disable-gpu \
  --hide-scrollbars --force-device-scale-factor=1 --window-size=896,504 \
  "--screenshot=C:\Users\nelim\Documents\rimworld\FoxLampRenew\Mod\About\Preview.png" \
  "file:///C:/Users/nelim/Documents/rimworld/FoxLampRenew/Art/preview.html"
```

**`--screenshot` needs an absolute Windows path.** Given a path relative to the shell, Chrome
resolves it against its own working directory and fails with `Le chemin d'accès spécifié est
introuvable`, leaving the previous file untouched — so the render looks like it silently did
nothing rather than like an error. `--force-device-scale-factor=1` pins the rasterisation to
1:1 whatever the display is set to.

Text is composed **at final size**, so the glyphs are never resampled. The repository engraving
standard is followed exactly:

| | Value |
|---|---|
| Title | `Fox Lamp Renew`, 48 px, two lines |
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

## `Art/ModIcon-source.png` — 1254 x 1254, 1.2 MB

The mascot at full resolution, kept so the icon can be rebuilt without redrawing it. Never
published: it sits here, outside `Mod/`.

## `Mod/About/ModIcon.png` — 128 x 128, 24 KB

Downscaled from the source above, and from nothing else:

```
ffmpeg -y -i Art/ModIcon-source.png -vf "scale=128:128:flags=lanczos" Mod/About/ModIcon.png
```

It is the repository mascot, and it follows the family: a round head seen three-quarter, winking
one eye, a thick near-black outline, flat cel shading, and the mod's own subject fused into it.
The ponytail the other icons wear is replaced here by fox ears, which is the fusion doing its job
rather than a departure — Mintchoco's head *is* a scoop of ice cream, and this one *is* a fox.

**The lantern it holds is lit, and that is deliberate.** It reads as a contradiction of the rule
two sections up, which says the banner must never show the piece aglow, so here is why the two
differ.

The banner rule is about **the piece**. The sculpture ships with no `CompProperties_Glower`, no
fuel and no heat, so a banner showing *it* giving off light would advertise a thing the mod does
not contain. The icon shows no sculpture at all: it is a character holding an ordinary lantern,
the way the Mintchoco mascot holds nothing the mod ships either.

And the icon has a constraint the banner does not. It is read at **32 px** in a mod list. An unlit
lantern at that size is a brown smudge with no silhouette; the glow is the only thing that makes
the object legible as a lantern, which is the one word the icon has to say. Checked at 32 px: the
ears, the wink and the lit lantern all survive.

Left as it is on purpose. A later pass should not darken it to match the banner.

**Whatever is drawn, it must not be built from `UI_Fox_Lamp.png`.** That file is the *build-menu*
icon and it is a **book** — the author's deliberate style, shipped untouched, and explained in
`ATTRIBUTION.md`. It names nothing at 32 px in a list of mod icons.

## Tooling on this machine, as of 2026-09-05

`ffmpeg` and Chrome are present. **ImageMagick is not** — the `convert` on `PATH` is Windows'
own filesystem tool, which will fail with `Paramètre non valide` on an image path. Everything
above is therefore ffmpeg and Chrome only.
