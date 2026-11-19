# Art — sources

## Current rendering — 2026-09-13

This section supersedes historical overlay dimensions and rendering command below.
Run `node Art/render-preview.cjs` from repository with Playwright installed (or set
PLAYWRIGHT_MODULE to its module path). Chrome required. Renderer serves local
composition, loads preview-palette.json as sole overlay palette, waits for fonts and images,
writes shipped Preview.png, clean Art/Preview.png and preview-background.png.
268-pixel QA thumbnail kept separately as preview-thumbnail.png.

Title uses Segoe UI 46 px/600; Renew is 65 percent in sand-colored secondary ink.
Unofficial tag uses 24 px, orange triangle displays declared version 1.6.
Origin of artwork remains authored sprite and HTML ground, not generated scene.


RimWorld never reads this folder, neither does Steam: only `Mod/` published. Here lives only material needed to rebuild shipped showcase.

Composed from **mod's own sprite**, not generated. For a mod that is one object, object is honest showcase — AmliFurx's texture already is thing being sold. `STYLE_RIMWORLD.md` describes painted RimWorld *scene*, repository default; this is deliberate departure, noted here so later pass can regenerate rather than guess why.

**Mod ships `ModIcon.png` since 2026-09-12.** See last section but one for what it is.

**Banner's light rule reversed 2026-09-12**, day piece got a glower. Both images now show it giving off light, which it does. Old rule and reason it fell kept in `Preview.png` section below, not deleted.

## `sprite-trimmed.png` — 166 x 321, 44 KB

`Mod/Textures/Thankyou/Fox_Lamp.png` is 812 x 812, piece occupying small part of mostly transparent canvas. Alpha bounding box measured, not eyeballed:

```
ffmpeg -i Mod/Textures/Thankyou/Fox_Lamp.png -vf "alphaextract,bbox=min_val=16" -f null -
# x1:323 x2:488 y1:168 y2:488 -> crop=166:321:323:168
ffmpeg -y -i Mod/Textures/Thankyou/Fox_Lamp.png -vf "crop=166:321:323:168" Art/sprite-trimmed.png
```

Kept because both images below built from it, and re-deriving means re-measuring.

## `Mod/About/Preview.png` — 896 x 504, 345 KB

Built by `preview.html` in this folder, rasterised by Chrome headless. Page references `sprite-trimmed.png` by relative path, so command below reproduces shipped file **byte for byte** — verified by `md5sum`.

```
"/c/Program Files/Google/Chrome/Application/chrome.exe" --headless --disable-gpu \
  --hide-scrollbars --force-device-scale-factor=1 --window-size=896,504 \
  "--screenshot=C:\Users\nelim\Documents\rimworld\FoxLampRenew\Mod\About\Preview.png" \
  "file:///C:/Users/nelim/Documents/rimworld/FoxLampRenew/Art/preview.html"
```

**`--screenshot` needs absolute Windows path.** Given path relative to shell, Chrome resolves it against own working directory and fails with `Le chemin d'accès spécifié est
introuvable`, leaving previous file untouched — render looks like silently did nothing, not like error. `--force-device-scale-factor=1` pins rasterisation to 1:1 whatever display set to.

Text composed **at final size**, glyphs never resampled. Repository engraving standard followed exactly:

| | Value |
|---|---|
| Title | `Fox Lamp Renew`, 48 px, two lines |
| Rule | 58 x 3, amber `#D68F2C` |
| Summary | 21 px over 430 px |
| Darkening | radial from the top-left corner, `rgba(6,5,4,.86)` at the centre, nil at **74 %** |

Summary lifted word for word from `About.xml` description, as standard requires. No count engraved: rule allows one for frozen source, but "one sculpture" would read as apology for mod, not description.

**Light is emitted, pool anchored on lantern.** Gradient sits at 76 % width and 71 % height: frame's opening in sprite, not piece's centre of mass.

**This rule was opposite until 2026-09-12, and reversal is the point.** Used to read: light comes from off-frame right, piece never emits any — no `CompProperties_Glower`, no fuel, no heat, and banner showing it aglow would advertise something mod did not ship. Pool sat at 50 % height, stood for source outside frame. Renew release gives piece glower, fuel frame and switch, so banner now shows what mod actually does. Anyone finding old wording quoted elsewhere reads document predating the light.

Summary engraved under rule **unchanged**, deliberately. It is first sentence of `About.xml` description, word for word, as standard requires, and that sentence did not change when light added. Picture carries new fact; words did not need to.

Checked at 268 px, real Workshop thumbnail width: name reads, silhouette reads. Summary falls to about 6 px, not meant to be read there — written for whoever opens mod page.

## `Art/ModIcon-source.png` — 1254 x 1254, 1.2 MB

Mascot at full resolution, kept so icon can be rebuilt without redrawing. Never published: sits here, outside `Mod/`.

## `Mod/About/ModIcon.png` — 128 x 128, 24 KB

Downscaled from source above, nothing else:

```
ffmpeg -y -i Art/ModIcon-source.png -vf "scale=128:128:flags=lanczos" Mod/About/ModIcon.png
```

Repository mascot, follows the family: round head seen three-quarter, winking one eye, thick near-black outline, flat cel shading, mod's own subject fused into it. Ponytail other icons wear replaced here by fox ears, fusion doing its job, not departure — Mintchoco's head *is* scoop of ice cream, this one *is* a fox.

**Lantern it holds is lit**, agrees with banner, which now shows piece emitting light too.

It did not always agree. For one day, 2026-09-12, icon shipped against banner rule forbidding showing piece aglow, and paragraph here argued difference: icon is character holding ordinary lantern, not picture of sculpture, so promised nothing mod lacked. Argument now moot, since mod does not lack it. Kept in one sentence rather than deleted, so icon not mistaken for leftover of unlit era and darkened to match something.

Second reason drawn lit still stands on own, and is the one to remember if icon ever redrawn. Read at **32 px** in mod list. Unlit lantern at that size is brown smudge with no silhouette; glow only thing making object legible as lantern, the one word icon must say. Checked at 32 px: ears, wink and lit lantern all survive.

**Whatever is drawn, must not be built from `UI_Fox_Lamp.png`.** That file is *build-menu* icon and it is a **book** — author's deliberate style, shipped untouched, explained in `ATTRIBUTION.md`. Names nothing at 32 px in list of mod icons.

## Tooling on this machine, as of 2026-09-05

`ffmpeg` and Chrome present. **ImageMagick is not** — `convert` on `PATH` is Windows' own filesystem tool, fails with `Paramètre non valide` on image path. Everything above therefore ffmpeg and Chrome only.