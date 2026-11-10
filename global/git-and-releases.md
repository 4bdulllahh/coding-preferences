# Git and releases

## Commits

- **One commit per milestone,** made locally as soon as the milestone works. Commit freely,
  **ask before pushing**, and never force push.
- **Subject:** a type, then a plain-English list of what changed, so the log reads like a story:
  - `feat: M7 pause and resume, spaced-out requests`
  - `fix: Start Emailing works again after import`
  - `docs: handover after M7`
  - Releases add the version in brackets: `feat: undo and redo, PDF colours (v1.3.0)`
- **Body:** what changed and why, a few lines. End with the attribution trailer the session gives.
- Work on `main` directly, no pull requests, unless the project says otherwise.
- Never commit secrets, `.env`, build output (`dist/`, `build/`, `out/`) or `node_modules/`.

## Versions

- **Semantic versions:** `MAJOR.MINOR.PATCH`. New features bump the minor, fixes bump the patch.
- **Desktop apps start in beta at `0.1.0-beta`** and stay `0.x.y-beta` until I say it's ready
  for 1.0. Web apps start at `0.1.0`, or `1.0.0` when they first go public, whichever I choose.
- The version lives in **one place** (`APP_VERSION`, `package.json`) and everything reads it from there.
- Tag each release `v<version>`, for example `v0.3.2-beta`.

## Releasing

When a milestone plan ends in a release, or I say "release":

1. Bump the version.
2. Write the release notes in `docs/releases/v<version>.md` (template: `templates/release-notes.md`).
3. Give me a **short paste-ready paragraph** in the chat as well, for the GitHub release or a
   message to testers.
4. Update the README: new features, version line, badges, logo, fresh screenshots
   (template: `templates/README.md`).
5. Update `CHANGELOG.md` if the project has one, and move shipped items to Done in the roadmap.
6. Build: the desktop zip or installer, or the web production build. Check that it starts.
7. Commit as `feat: <headline> (v<version>)`, tag it, then ask before pushing.
8. After the push, offer to create the GitHub release with the notes (CI attaches the build
   for desktop apps).

## Release notes

- Written for testers and users, not developers: what they'll notice, in plain English.
- Title: `## <App> <version>: <headline>`, then one or two sentences on the big change.
- Grouped by theme with `###` headings, bullets with bold first words, then `### Fixed` last.
- No code, file names or internal names.

## README

- **Updated on every release,** not only when asked.
- Centred logo (if the app has one), name, bold one-line tagline, a short pitch.
- A line with download or live link, version and platforms, then badges (build, latest
  release, license, platform) from shields.io.
- A hero screenshot, a Features list, then setup and the rest. Screenshots use made-up data
  and the README says so.
