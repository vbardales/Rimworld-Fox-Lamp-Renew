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
showcase:     banner only
tested_on:
workshop:
remaining:
  - unverified: never seen running
  - defect: Mod/About/ModIcon.png is a raw 1254x1254 source of 1.2 MB, uncommitted
  - defect: nothing keeps the dead 1.5 fork out, and it declares the same Fox_Lamp
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
  The three lines above are this mod's, not the repository's boilerplate.

## What the two defects are

**The icon was never finished.** The sweep that generates mod icons dropped a full-resolution
source into `Mod/About/` on 2026-09-12 at 00:18 and stopped there. A finished icon is 128x128 at
roughly 30 KB, the size Fullzoon Cookies carries; this one is 1254x1254 at 1.2 MB and is not
committed. Being uncommitted does not make it harmless, because the Workshop uploader sends
`Mod/` as it stands from disk, with no filtering. So `showcase` reads `banner only`: the banner
is done and to standard at 896x504, the icon is not.

**The 1.5 fork is still subscribed.** 【1.5】Fox Lamp Forked, `mg.ferianstory.foxlamp`, is still
in the Workshop folder and declares `Fox_Lamp`, the one defName this mod exists to carry. Enabled
together they are a silent duplicate, and RimWorld keeps only one. Neither is active in the
current mod list, so nothing is broken today. The guard would be an `<incompatibleWith>` naming
that packageId; it has not been written.

## Vocabulary

`licence`: `open` an explicit licence, `silent` no licence and a dead source, `alive` no licence
but a living source, `forbidden` a written refusal, `original` owing nothing to anyone — not a
name, not an idea traceable to one mod, not a value derived from its assets.

`showcase`: `complete` both images done and to standard, `banner only` the 896x504 banner done
and the icon missing or unfinished, `none` neither.
