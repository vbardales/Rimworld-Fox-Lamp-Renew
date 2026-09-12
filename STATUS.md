---
mod:          Fox Lamp Renew
packageId:    nelim.foxlamprenew
repo:         Rimworld-Fox-Lamp-Renew
visibility:   public
detached:     yes
stage:        in monorepo
licence:      silent
licence_at:   neither the 1.5 mod folder nor its Workshop page says anything
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running
session:      local_7c385da5-e8e6-4eb1-92ff-dd3e44a2b6ec
updated:      2026-09-12, the mod's own session
---

# Fox Lamp Renew — status

It lives at the root, never inside `Mod/`, so Steam never receives it.

A sweep across every mod started this sheet, filled what the disk could tell it, and left four
fields for whoever held the mod. This session holds it now and has answered them.

## The four fields the sweep could not read

- **`stage`** — mirrors the sidebar group of the session holding the mod. Usually one of `port`,
  `showcase`, `preTest`, `done`, `tested`, `published`; here it is `in monorepo`, which that list
  did not have a word for. It does **not** contradict `detached` below, and neither should be
  edited to agree with the other: the detachment is done on disk and on GitHub, but the step has
  not been signed off, so the group has deliberately not moved. Confirmed on 2026-09-12.
- **`tested_on`** — the date of the last run in game. Empty means never, which is the case here:
  RimWorld has never loaded this mod.
- **`dependencies`** — `declared`. The About names 【AF】SydailyFox (Continued) in
  `modDependencies`, and the single `loadAfter` entry is that same mod, so nothing is implied
  without being declared. An undeclared dependency is not cosmetic: on 2026-09-11 Reequilibrage
  animaux took 47 vanilla animals down with it, Muffalo included, because the class it injects
  belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line above is this mod's, not the repository's boilerplate.

## The two defects that were here, and what closed them

Both were closed on 2026-09-12, in the same pass that wrote them down. Kept here because the next
sweep will otherwise find the same two things and wonder whether they were ever looked at.

**The icon was never finished.** The sweep that generates mod icons dropped a full-resolution
mascot into `Mod/About/` at 00:18 and stopped there, leaving 1254x1254 and 1.2 MB where a finished
icon is 128x128 at roughly 30 KB. Being uncommitted made it no safer, because the Workshop uploader
sends `Mod/` as it stands from disk, with no filtering. The source now lives at
`Art/ModIcon-source.png` and the shipped icon is downscaled from it, so `showcase` reads `complete`.

**The 1.5 fork could be enabled alongside.** 【1.5】Fox Lamp Forked, `mg.ferianstory.foxlamp`, is
still in the Workshop folder and declares `Fox_Lamp`, the one defName this mod exists to carry.
Nothing stopped the two loading together, and RimWorld keeps only one. The About now declares that
packageId in `<incompatibleWith>`, and the description says so in words for anyone still
subscribed to it.

## The one thing left

`remaining` holds a single line, and it is the one no document can close: **RimWorld has never
loaded this mod.** Everything asserted about it comes from reading the def against the game's own
files and assembly. `TESTING.md` beside this file is the list of what has to be watched in a
running colony; `tested_on` stays empty until someone walks it.

## Vocabulary

`licence`: `open` an explicit licence, `silent` no licence and a dead source, `alive` no licence
but a living source, `forbidden` a written refusal, `original` owing nothing to anyone — not a
name, not an idea traceable to one mod, not a value derived from its assets.

`showcase`: `complete` both images done and to standard, `banner only` the 896x504 banner done
and the icon missing or unfinished, `none` neither.
