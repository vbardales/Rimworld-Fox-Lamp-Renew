# Pickle run history

One line per run that still proves something about the current `Mod/`. AUDIT.md, per-mod section.
Trimmed 2026-10-02: the intermediate lines were dropped, the folders they cited are gone.

- 2026-09-28, English, minimal, step DLL before `6ec3002`: 12 passed, 2 failed (minify step, construction staging), 2 skipped
  by `@requires`. Proves the 11 other scenarios. `Evidence/20260928-english`.
- 2026-09-28, French, minimal, same DLL: 13 passed, 1 failed (minify), 2 skipped. `Evidence/20260928-french`.
- 2026-09-29, revision `6ec3002`, English, the 3 fixed scenarios: 3/3 passed. `Evidence/20260928-english-fix`.
- 2026-09-29, revision `6ec3002`, incompatibility pass with the 1.5 fork (ticket `8b2f`): 2/2 passed, after rewriting
  `08-incompatible-fork` to assert the real LoadFolders finding. `Evidence/20260929-incompat-3`.
- 2026-10-02, revision `681683e`, French, minimal (ticket `b262`): 2/2 passed, `exitReason: passed`, set `sans-facultatifs`. The minify and construction scenarios, new in French, are green. `Evidence/20261002-french-new`.
