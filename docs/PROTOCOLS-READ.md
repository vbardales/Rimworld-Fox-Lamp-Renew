# Protocol documents read for this mod

Records which shared protocol a given audit actually consulted, at what version, and
whether it changed anything for this mod. Written so the next audit does not reread a
document that never mattered here unless it has moved since. "Version" is the file's
`git log -1 --format=%h --date=short --format="%h %ad"` in the monorepo (or working-tree
mtime where the file is not versioned there).

## 2026-10-02 audit (session `local_f3473595`)

**Version note.** The protocol documents moved to `vbardales/Rimworld-protocols` (git dir `../rimworld-protocols.git`, work tree =
monorepo root). `git log` from the monorepo returns the commit that *deleted* them, so the versions below were read with
`git --git-dir=../rimworld-protocols.git --work-tree=. log -1 -- <file>`. The two earlier tables above used the monorepo log and
their versions are not reliable. `[M]` = modified, uncommitted at read time.

| Document | Version | Read | Mattered here? |
| --- | --- | --- | --- |
| AGENTS.md | `7fd7475` 2026-09-29 | in full (loaded as project instructions) | Yes: evidence rule, gates, CI publishing rule. |
| AUDIT.md | `d1fdbe1` 2026-10-02 | in full | Yes: this run's instructions; the new `done -> tested` lines (no `@wip`, conditional passes, no manual test), pass order, title format. |
| MOD_SETTINGS.md | `b83933b` 2026-09-23 | in full | Confirmed `not_applicable`. Nothing new for a mod with no settings. |
| TRANSLATIONS.md | `af8427f` 2026-10-02 | in full | Yes: French review file by Virginie, three-segment gender rule (n/a here, no pawn text), plural rule (n/a, no counted noun). |
| PUBLISHING.md | `4e8f11a` 2026-10-02 | sections only: "Départ depuis le projet d'origine", "Sources hors du dossier publié", "Juste après", "À chaque mise à jour"; headings and grep for the rest | Origin-repo/PR rule (no origin repo exists here), `PublishedFileId.txt`, fail-fast. CI mechanics and description sections not reread: the mod is not at `prepublished`. |
| STYLE_RIMWORLD.md | `c105a43` 2026-10-01 [M] | not read | Gates icon and Preview generation, which this audit does not touch (owner's). |
| WORKSHOP_COMMENTS.md | `7fd7475` 2026-09-29 | not read | Gates the thank-you comments at `tested -> prepublished`. |
| scripts/SEARCHING.md | `50de695` 2026-09-28 | not read | No Workshop search needed (origin repos already checked 2026-09-27). |
| PickleTools/README.md | `ff20d89` 2026-09-29 [M] | first 80 lines (tool table, layout) | No tool is needed by this suite. |
| PickleTools/Authoring/README.md | `a47799f` 2026-09-29 | in full | Yes: pass matrix, evidence rules, the three timeouts. |
| PickleTools/Headless/README.md | `ed4e73a` 2026-09-26 | not read | Launching goes through the dispatcher's `Submit-PickleRun.ps1`; WELCOME and SUBMIT cover what a session does. |
| PickleTools/docs/steps.md | `da7c3b0` 2026-09-28 [M] | not read | No new step is written in this pass. |
| Rimworld-Release-Admin/docs/OPERATIONS.md | `3c03f51` 2026-09-26 | not read | Gates the CI `publish`, unreachable before `prepublished`. |
| Rimworld-Ticket-Dispatcher/docs/WELCOME.md | `77ca9d7` 2026-09-27 | in full | Yes: `REGISTER`, one ticket per pass, the tree must stay frozen, docs-read note, the protocols-repo quirk above. |
| Rimworld-Ticket-Dispatcher/docs/SUBMIT.md | `d07b2b8` 2026-09-26 | in full | Yes: options of `Submit-PickleRun.ps1`, exit codes, `-EvidenceDir` never overwrites. |

Not useful to a mod at `done` with no code and no settings, so not to be reread when they move unless the mod advances:
STYLE_RIMWORLD.md, WORKSHOP_COMMENTS.md, SEARCHING.md, Headless/README.md, steps.md, OPERATIONS.md.

**Mod-local documents.** Read this pass: `STATUS.md`, `CHANGELOG.md` (structure and the 0.1.0 entry), `TESTING.md`,
`Tests/Pickle/README.md`, the 8 feature files, `docs/runs/history.md`, `Mod/About/About.xml`. Not reread (unchanged in this
pass and not gating it): `README.md`, `ATTRIBUTION.md` and `Mod/ATTRIBUTION.md`. Absent, and not required before
`prepublished`: `LICENSE` (licence `silent`, nothing to grant), `PUBLICATION.md`, `NOTES.md`, `BUGS.md`, `BACKLOG.md`.

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
