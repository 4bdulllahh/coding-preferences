# Code rules

For every project and stack. A project's own `CLAUDE.md` can add to these or override them.

## Writing code

- **Production-ready, simple, readable.** Make the smallest change that fully does the job.
  No features, options or abstractions nobody asked for.
- **Reuse before writing:** the project's own helpers and components first, then the standard
  library or platform, then an installed dependency. Never add a dependency for a few lines.
- **Follow the project's existing structure,** naming and patterns. Don't restructure unasked.
- **Types everywhere:** TypeScript in strict mode with no `any`. Python with type hints on
  every function, and dataclasses for structured data.
- Clear names, small modules with one job each. Comments only explain *why*.

## Structure

- **Core logic is separate from the UI.** Business rules live in a core layer (`app/core/`,
  `src/domain/`, `src/lib/`) that never imports UI code and is unit tested. The UI only
  displays things and calls the core.
- **Storage, network and AI calls** sit behind small service modules, not inside UI code.
- **Nothing slow on the UI thread:** desktop apps use workers (`app/workers/`), and web apps
  use web workers or load heavy code on demand with `import()`.

## Errors and boundaries

- **Validate everything that comes from outside:** user input, files, network responses,
  saved data and env vars (zod in TypeScript, explicit checks in Python).
- **Never swallow an error.** Log it, and show the user a plain message saying what to do.
- **Never lose user data:** write to a temp file then rename, confirm destructive actions,
  offer undo where it's cheap, keep a backup/restore option.

## Data: local-first

- **Default to no backend:** no server, accounts or analytics. Data stays on the device
  (SQLite on desktop, IndexedDB or localStorage on the web). Ask before adding a server.
- **Secrets:** never in code or the repo. `.env` is gitignored. No built-in API keys: users
  bring their own, stored encrypted (DPAPI on Windows, the OS keychain elsewhere).
- **Updates keep data:** a schema version and a migration step for every database change.
  Old saved settings are converted, never dropped.
- **First run starts blank:** no pre-filled templates, contacts or settings. Examples only
  appear behind a button like "Show me an example".
- **Money is exact:** integer minor units (cents) or decimal types, never floats.

## UI

- **Light and dark themes.** Web layouts work at 390 px wide with no sideways scrolling.
- **Accessible:** keyboard works everywhere, every control has a label, and contrast passes
  (check with axe on the web).
- **Languages** (when the project has more than one): every string goes through `t()` as a
  template, Arabic is properly right to left, and a test fails on missing translations.
- **No custom cursor.**

## Security

- Web: security headers and a Content Security Policy without `unsafe-eval`. Never put
  unsanitised user content into HTML.
- No `eval`, no shell commands built from user input.

## Tests and checks

- **New logic gets a test.** Core logic is tested thoroughly. UI gets tests where it breaks easily.
- **Before every commit, run what CI runs:** lint, format check, typecheck, tests, build.
  CI is GitHub Actions on every push to `main`.
- **UI changes are checked in the running app** (open it, click through, take a screenshot),
  not only in tests.

## Dependencies and licenses

- Commit the lockfile. Prefer well-maintained, permissive (MIT, Apache, BSD) packages.
- Apps that bundle dependencies ship a `THIRD-PARTY-NOTICES.md`.

## Windows

- My machine is Windows 11 with PowerShell. Scripts and commands must work there first.
  Quote paths with spaces.
