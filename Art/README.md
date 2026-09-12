# Art — sources

RimWorld never reads this folder, and neither does Steam: only `Mod/` is published. What lives
here is the material needed to rebuild the shipped showcase, and nothing else.

It was composed from **the mod's own sprite** rather than generated. For a mod that is one
object, the object is the honest showcase — and AmliFurx's texture already is the thing being
sold. `STYLE_RIMWORLD.md` describes a painted RimWorld *scene*, which is the repository's
default; this is a deliberate departure, noted here so a later pass can regenerate rather than
guess why.

**The mod ships a `ModIcon.png` since 2026-09-12.** See the last section but one for what it is.

**The banner's light rule was reversed on 2026-09-12**, the day the piece was given a glower. Both
images now show it giving off light, which it does. The old rule and the reason it fell are kept in
the `Preview.png` section below rather than deleted.

## `sprite-trimmed.png` — 166 x 321, 44 KB

`Mod/Textures/Thankyou/Fox_Lamp.png` is 812 x 812 with the piece occupying a small part of a
mostly transparent canvas. The alpha bounding box was measured, not eyeballed:

```
ffmpeg -i Mod/Textures/Thankyou/Fox_Lamp.png -vf "alphaextract,bbox=min_val=16" -f null -
# x1:323 x2:488 y1:168 y2:488 -> crop=166:321:323:168
ffmpeg -y -i Mod/Textures/Thankyou/Fox_Lamp.png -vf "crop=166:321:323:168" Art/sprite-trimmed.png
```

Kept because both images below are built from it, and because re-deriving it means re-measuring.

## `Mod/About/Preview.png` — 896 x 504, 345 KB

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

**The light is emitted, and the pool is anchored on the lantern.** The gradient sits at 76 % width
and 71 % height, which is the frame's opening in the sprite rather than the piece's centre of mass.

**This rule was the opposite until 2026-09-12, and the reversal is the point.** It used to read:
the light comes from off-frame right, and the piece never emits any — because it had no
`CompProperties_Glower`, no fuel and no heat, and a banner showing it aglow would have advertised
something the mod did not ship. The pool sat at 50 % height and stood for a source outside the
frame. The Renew release gives the piece a glower, a fuel frame and a switch, so the banner now
shows what the mod actually does. Anyone who finds the old wording quoted elsewhere is reading a
document that predates the light.

The summary engraved under the rule is **unchanged**, and deliberately so. It is the first sentence
of the `About.xml` description, word for word, as the standard requires, and that sentence did not
change when the light was added. The picture carries the new fact; the words did not have to.

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

**The lantern it holds is lit**, and it agrees with the banner, which now shows the piece emitting
light as well.

It did not always agree. For one day, 2026-09-12, this icon shipped against a banner rule that
forbade showing the piece aglow, and the paragraph here argued the difference: the icon is a
character holding an ordinary lantern, not a picture of the sculpture, so it promised nothing the
mod lacked. That argument is now moot, because the mod does not lack it. Kept in a sentence rather
than deleted, so that the icon is not mistaken for a leftover of the unlit era and darkened to
match something.

The second reason it was drawn lit still stands on its own, and it is the one to keep in mind if
the icon is ever redrawn. It is read at **32 px** in a mod list. An unlit lantern at that size is a
brown smudge with no silhouette; the glow is the only thing that makes the object legible as a
lantern, which is the one word the icon has to say. Checked at 32 px: the ears, the wink and the
lit lantern all survive.

**Whatever is drawn, it must not be built from `UI_Fox_Lamp.png`.** That file is the *build-menu*
icon and it is a **book** — the author's deliberate style, shipped untouched, and explained in
`ATTRIBUTION.md`. It names nothing at 32 px in a list of mod icons.

## Tooling on this machine, as of 2026-09-05

`ffmpeg` and Chrome are present. **ImageMagick is not** — the `convert` on `PATH` is Windows'
own filesystem tool, which will fail with `Paramètre non valide` on an image path. Everything
above is therefore ffmpeg and Chrome only.
