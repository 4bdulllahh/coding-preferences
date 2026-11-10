# Stacks

Stacks I've used before, as **options to suggest** at the start of a project. Nothing here is
a default: always ask which stack I want (see [new-project.md](new-project.md)). When a project
uses a stack well, add what it taught us here.

## Windows desktop app: Python + PyQt6

**Fits:** tools for non-technical users that run on their own PC, work with local files, or
do long jobs (scraping, emailing, checking). **Used in:** GeoHarvest, HomingPigeon, LeadPulse.

| Part | Choice |
| --- | --- |
| Language | Python 3.12, type hints |
| UI | PyQt6, light/dark themes and a theme maker, sidebar that shrinks to icons |
| Data | SQLite with `SCHEMA_VERSION` and migrations in `db._migrate()` |
| Network | httpx; slow work in `app/workers/` |
| Secrets | user's own API keys, DPAPI-encrypted |
| Tests | pytest, headless, `python -m pytest tests/ -q` |
| Build | PyInstaller; `tools/build.py` makes `dist/<App>-vX.Y.Z-windows.zip` with a setup exe and self-tests it |
| CI | GitHub Actions on `windows-latest`: tests and build on every push; on a published release, builds and attaches the zip |
| Updates | the app checks GitHub Releases and installs updates by itself |

Layout:

```
app/core/        business rules, no PyQt imports, unit tested
app/workers/     anything slow (network, files, AI)
app/ui/          windows and pages (lazy-loaded pages go in the build's hidden imports)
assets/          logo and icons
docs/            handover/, releases/, screenshots/, roadmap.md
installer/       installer script
tools/           build.py, screenshot.py, i18n.py, make_icons.py
tests/
run.py           starts the app
requirements.txt, requirements-dev.txt (comment why each dependency is there)
```

Extra files: `PRIVACY.md`, `SECURITY.md`, `DISCLAIMER.md` where needed, `THIRD-PARTY-NOTICES.md`.

## Browser app with no backend: React + Vite

**Fits:** tools that run entirely in the browser with data on the device, single screen
apps, offline use. **Used in:** Paperless.

| Part | Choice |
| --- | --- |
| Core | React 19, TypeScript strict, Vite, Node 24 (`.nvmrc` and `engines`) |
| Styling | Tailwind 4 with tokens in `src/index.css`, `clsx` + `tailwind-merge`, lucide-react icons |
| State and data | zustand, zod for anything loaded or imported, IndexedDB (`idb-keyval`) and localStorage |
| Offline | `vite-plugin-pwa` with update on user click (`registerType: 'prompt'`) |
| Checks | oxlint, prettier (+ tailwind plugin), `tsc -b`, vitest + Testing Library + jsdom, coverage thresholds on domain code |
| Scripts | `dev`, `build`, `lint`, `typecheck`, `test`, `test:coverage`, `format`, `format:check`, `check` |
| Hosting | Vercel; `vercel.json` with security headers and CSP; `index.html` and `sw.js` never cached long |
| Browser checks | playwright-core driving the installed Edge, axe for accessibility |

Layout: `src/features/<feature>/`, `src/domain/` (pure logic, fully tested), `src/services/`
(storage, PDF, network), tests next to the code as `*.test.ts(x)`.

## Browser app with Next.js

**Fits:** bigger browser tools with many pages or tools, or when static export and routing
help. **Used in:** DocSanitize, typencut.

- Next.js (current version) with TypeScript, Tailwind 4 (`@tailwindcss/postcss`), zustand.
- Static export (`out/`) when there's no server work. Heavy libraries (pdf.js, ffmpeg, tesseract)
  loaded on demand, processing in the browser.
- vitest (happy-dom), playwright-core for end-to-end, eslint-config-next. Vercel.
- Next ships an `AGENTS.md` that says to read the docs in `node_modules/next/dist/docs/`
  before coding, because the APIs change between versions. Follow it.

## 3D and games in the browser

**Fits:** games and interactive 3D. **Used in:** typencut.

- three.js through `@react-three/fiber` and `drei`, on Next.js or Vite.
- Models, sounds and music generated in code where possible, so no assets to license.
- Check on laptop, big screen and phone (touch controls).

## Websites (mine or a client's)

**Fits:** portfolios, business sites, catalogues, demos for client review.
**Used in:** Perfect Shades, Uniformers, Abdullah.exe, Dekor, Matrixii.

Two ways:

- **No build step:** hand-written HTML, one CSS file, one JS file. Best for catalogues and
  simple sites (Uniformers: 204 pages in English and Arabic).
- **React + Vite + Tailwind + react-router:** for sites with shared components and more
  interaction (Perfect Shades).

Both: a design system file (colours, fonts, spacing) before pages, full right-to-left Arabic
when bilingual, SEO basics (titles, meta descriptions, `sitemap.xml`, `robots.txt`, a 404
page), Vercel hosting, and forms that work without a backend (WhatsApp, email, or a demo
form clearly marked).

## Hardware: Python + Arduino

**Fits:** projects with sensors, servos or a camera. **Used in:** Face-Tracking-Laser.

- Python on the PC (OpenCV for vision), sending commands over serial to an Arduino running C++.
- Keep calibration values (servo limits, camera offsets) in one config, never hard-coded.

## Not used yet: offer when they fit

| Option | When |
| --- | --- |
| Supabase | A project really needs accounts, sync or a shared database (there's a Supabase skill) |
| Expo / React Native | A phone app |
| Tauri | A small desktop app with a web UI, when PyQt6 isn't a fit |
| n8n | Automations and workflows (there's an n8n skill) |
| Base44 | Quick hosted app builds (used once, for Hannah Morgan Homes) |
