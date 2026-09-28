# Protocol documents read for this mod

Records which shared protocol a given audit actually consulted, at what version, and
whether it changed anything for this mod. Written so the next audit does not reread a
document that never mattered here unless it has moved since. "Version" is the file's
`git log -1 --format=%h --date=short --format="%h %ad"` in the monorepo (or working-tree
mtime where the file is not versioned there).

## 2026-09-27 audit

| Document | Version read | Mattered here? |
| --- | --- | --- |
| AGENTS.md | 3ce13d1 2026-09-24 (working tree at read time) | Yes — the gate chain and the two-document order (MOD_SETTINGS.md then TRANSLATIONS.md) it sets. |
| AUDIT.md | working tree, 2026-09-26 mtime | Yes — this run's own instructions. |
| MOD_SETTINGS.md | 2026-09-13 mtime, unchanged since the last audit of this mod | Confirmed, not reread in depth: `settings_audit: not_applicable` still holds, no assembly, no MainButtonDef exists to check. |
| TRANSLATIONS.md | 2026-09-25 mtime, rewritten since the last audit | Read in full. Nothing it added contradicts this mod's static coverage; the runtime FR/EN check it separates out was already `unverified` here. |
| STYLE_RIMWORLD.md | 2026-09-25 mtime | Read only "ModIcon : contrôle, pas génération" (128x128, 20-30 KB, control not generation). Checked against the shipped file: 128x128, 24,403 bytes — inside the band. |
| PUBLISHING.md | 2026-09-26 mtime | Read the description-order section and the adoption-clause convention. The description was missing the `IF I GO QUIET` / `AI-GENERATED` / `THANKS` labelled sections that other mods (Architect Studio) now ship; rewritten to match, content unchanged. Not read: the CI publish mechanics (`publish`, dry-run, semantic-release) — this mod has not reached `prepublished`. |
| WORKSHOP_COMMENTS.md | 2026-09-27 mtime | Not read. Gates the `THANKS`-to-comment cross-check at `tested -> prepublished`; this mod has not reached `done` this pass, let alone `tested`. |
| scripts/SEARCHING.md | 2026-09-17 mtime | Not read. No search task in this audit needed it. |
| PickleTools/README.md | 2026-09-25 mtime | Not read in full. See Authoring/README.md below, which is the one that actually decided something. |
| PickleTools/Headless/README.md | 2026-09-26 mtime | Not read. Gates running a suite, and this mod has none written yet. |
| PickleTools/Authoring/README.md | 2026-09-26 mtime, self-dated "reviewed 2026-09-22" | Read §1. It states plainly that `done` requires Pickle scenarios to be **written**, with no exemption for a code-free XML mod. This mod's `TESTING.md` is prose, not Gherkin — that is the finding that moves the stage back to `preTest`. |
| PickleTools/docs/steps.md | 2026-09-25 mtime | Not read yet. Needed before writing the Gherkin suite, not before reporting that it is missing. |
| Rimworld-Release-Admin/docs/OPERATIONS.md | 2026-09-26 mtime | Not read. Gates the CI `publish` step; unreachable from `preTest`. |
| Rimworld-Ticket-Dispatcher/docs/WELCOME.md | 2026-09-26 mtime | Not read. Gates depositing a Pickle run; nothing to deposit until the suite exists. |
| Rimworld-Ticket-Dispatcher/docs/SUBMIT.md | 2026-09-26 mtime | Not read, same reason. |

## Mod-local documents checked against the disk

`STATUS.md`, `README.md`, `CHANGELOG.md`, `ATTRIBUTION.md` (root and `Mod/`), `TESTING.md`,
`Tests/RESULTS.md`, `Tests/run.log`, `Mod/About/About.xml`. No `LICENSE`, `PUBLICATION.md`,
`NOTES.md`, `BUGS.md` or `BACKLOG.md` exist for this mod; none is required yet at `preTest`.

## 2026-09-28 follow-up (writing the Pickle suite)

| Document | Version read | Mattered here? |
| --- | --- | --- |
| PickleTools/Authoring/README.md | 2026-09-26 mtime | Read in full this time. Sections 3 (pass matrix), 4 (isolation, `@requires`, the three timeouts) and 7 (evidence) shaped the suite and its README. |
| PickleTools/docs/steps.md | 2026-09-25 mtime | Read. It lists only Nelim's Pickle Tools steps and points at Pickle's own catalogue upstream, which is not in the checkout. None of those steps was needed. |
| Pickle's own vocabulary | installed Workshop 3791648678 | No local copy of its `Docs/steps.md`: read instead from the `Pickle/Features/*.feature` files it ships and from the step expressions in `RimWorks.Pickle.Vanilla.dll`. A step used from that source and not seen in another suite is a guess until a first run confirms it. |
| Model suite | FireworkStand `Tests/Pickle/` | Read for structure (companion About, `wsl-ids.map`, dep maps, `Directory.Build.props`, step class idioms). Nothing copied that names its own mod. |
| PickleTools/Headless/README.md, Ticket-Dispatcher SUBMIT.md and WELCOME.md, Release-Admin OPERATIONS.md | 2026-09-26 mtime | Still not read: they gate launching a run and publishing, and nothing was launched. |
