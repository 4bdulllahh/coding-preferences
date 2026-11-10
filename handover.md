# Handover: coding-preferences

For the next Claude session on this repo. Read this file, then continue with the next
milestone. Don't re-ask anything under "Decisions": the user already answered it.

## What this repo is

The user's (Abdullah, called **abzoola**) master copy of how they work with Claude:
global rules loaded in every session via `~/.claude/CLAUDE.md`, plus on-demand files
(new-project kickoff, stack options, skills catalog, templates). See `README.md`.

- Local folder: `C:\Users\Computer\Documents\GitHub\CodingPrefrences`, branch `main`
- GitHub name to use: **coding-preferences** (not pushed yet)

## Working with the user on this repo

- One milestone at a time. After each: commit locally, update this file, give a size
  guess (S/M/L) for the next milestone, ask for the token %, and stop.
- Commit freely, **ask before pushing**.
- No em dashes or typographic ellipses in any file. Use commas, colons, full stops, `...`.
- Keep `global/` files short: they load in every session.

## Decisions (already answered, 2026-11-10)

| Topic | Decision |
| --- | --- |
| Name | Abdullah, called **abzoola**. Links: abdullahexe.online, github.com/4bdulllahh, linkedin.com/in/abzoola |
| Request flow | Writes long rambling prompts and forgets things. Claude plays the prompt back as a summary and asks once or twice "missed anything?". Then 👍, then a multiple-choice question round (AskUserQuestion form, 4 options + automatic Other = 5), even when not strictly needed. Code only after the final 👍. |
| Milestones | Break work into many milestones (8+ for big jobs, like Paperless and typencut). One feature/task/design at a time. |
| Token check | After each milestone: guess the next milestone's size, ask for the usage %, and estimate whether it fits. If not, suggest stopping and update `handover.md`. Resume with "continue read the handover". Claude can't read the usage % itself. |
| Commit/push | Commit freely (clear message per change), **ask before push**. |
| Releases | Desktop apps start at `v0.x.y-beta`. Every release: paste-ready release notes, README updated (badges, logo if any, screenshots). |
| Install | Global + per project: `global/` imported by `~/.claude/CLAUDE.md` via `install.ps1`, project `CLAUDE.md` written at kickoff. |
| Stacks | No fixed stack guides. Claude asks/suggests the stack on every new project; `stacks.md` lists past stacks as options only. |
| Languages | Ask per project (main choices: English only, or en + ar RTL + de + es + fr). |
| Talk-style skills | ponytail + i-have-adhd always on; caveman only on demand. |
| ECC | Suggested per project in the question round, installed only on yes. |
| Em dashes | Banned everywhere (code, UI, docs, READMEs, release notes, commits). |
| Model router | Write our own small skill: delegate easy jobs to Haiku/Sonnet subagents, keep planning and hard code on the main model. Existing repos are listed as alternatives (all under 30 stars). |
| Graphify | To learn later; list it in the catalog. |

## Preferences found in their projects (use these in M2 to M8)

From Paperless, DocSanitize, typencut, GeoHarvest (folder MapScout), HomingPigeon (Email-Sender),
LeadPulse (Auto-Leads-Checker-), Perfect-Shades-Website, Uniformers, Matrixii, all in
`C:\Users\Computer\Documents\GitHub\`.

- **Docs for the next session:** `handover.md` or `docs/handover/` (one file per area + index
  table), plus a short `CLAUDE.md` with "Rules that are easy to break" and "Everyday commands".
- **Release notes:** `docs/releases/<tag>.md` + a short paste-ready paragraph, plain English
  for testers, grouped by theme, then "Fixed".
- **Commits:** plain-English subject listing what changed, version in brackets for releases,
  e.g. `feat: undo and redo, PDF colours (v1.3.0)` or `v0.3.2 beta: pause and resume...`.
  Milestone commits: `feat: M19 <summary>`.
- **README:** centred logo, `<h1>` name, bold one-line tagline, short pitch, a line
  `Download · Version · Works on`, shields.io badges (build, latest release, license,
  platform), hero screenshot from `docs/screenshots/`, "made-up data" note, Features list.
- **Repo descriptions:** what it does in plain words, then "No account, no server, runs on your device".
- **UI text:** plain English for non-technical users; text with values uses templates
  (`t("{count} leads", count=n)`), never f-strings or glued fragments.
- **Local-first:** no backend/accounts/analytics where possible; data on device
  (localStorage/IndexedDB/SQLite); no built-in API keys, user keys stored encrypted (DPAPI).
- **First run is blank:** no pre-filled examples; examples only behind a button.
- **Updates keep data:** DB migrations with a schema version; old settings converted, never dropped.
- **PyQt6 desktop:** `app/core` (no UI imports, unit tested), `app/workers` (nothing slow on the
  UI thread), `run.py`, `tools/build.py`, PyInstaller + installer, pytest, GitHub Actions
  builds on release, Windows-first, light/dark themes, 5 languages.
- **Web:** React 19 + TypeScript, Vite or Next.js, Tailwind 4, zustand, zod, lucide-react,
  vitest (+ Testing Library), oxlint + prettier, Node 24, Vercel with security headers/CSP,
  works at 390 px phone width, accessibility (axe), no custom cursor, heavy code lazy-loaded.
- **Client sites:** static or React, design system doc, EN/AR with real RTL, demo for client review.
- **Files:** MIT `LICENSE`, `SECURITY.md`, `PRIVACY.md`, `THIRD-PARTY-NOTICES.md`, roadmap file
  checked before each release.
- **Windows/PowerShell** environment.

## Skills (for M9)

Starred list (github.com/stars/4bdulllahh/lists/claude-skills), with install commands:

| Skill | Install |
| --- | --- |
| DietrichGebert/ponytail | `/plugin marketplace add DietrichGebert/ponytail` then `/plugin install ponytail@ponytail` |
| affaan-m/ECC | `npx ecc-universal@2.2.3 setup` (plugin `ecc@ecc`) |
| Leonxlnx/taste-skill | `/plugin marketplace add Leonxlnx/taste-skill` then `/plugin install taste-skill@taste-skill` (needs Node 22+, Chrome/Edge) |
| mattpocock/skills | `claude plugin install mattpocock-skills@claude-plugins-official`, then `/setup-matt-pocock-skills` |
| alonw0/web-asset-generator | `/plugin marketplace add alonw0/web-asset-generator` then `/plugin install web-asset-generator@web-asset-generator-marketplace`, `pip install Pillow` |
| ayghri/i-have-adhd | `claude plugin marketplace add ayghri/i-have-adhd` then `claude plugin install i-have-adhd@i-have-adhd` |
| JuliusBrussee/caveman | `claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman` |
| Graphify-Labs/graphify | `uv tool install graphifyy` (knowledge graph of a codebase) |
| pbakaus/impeccable | `npx impeccable install` (design vocabulary, critique/audit) |
| coreyhaines31/marketingskills | `npx skills add coreyhaines31/marketingskills` (CRO, copy, SEO) |
| supabase/agent-skills | `npx skills add supabase/agent-skills` |
| czlonkowski/n8n-skills | `/plugin marketplace add czlonkowski/n8n-skills` |
| conorluddy/ios-simulator-skill | `/plugin marketplace add conorluddy/ios-simulator-skill` then `/plugin install ios-simulator-skill@conorluddy` |
| latent-spaces/brag | `/plugin marketplace add latent-spaces/brag` then `/plugin install brag@brag` (launch video) |
| Donchitos/Claude-Code-Game-Studios | see its README (game dev agents) |
| Panniantong/Agent-Reach | see its README (read/search Twitter, Reddit, YouTube...) |

Model-router alternatives: thevrus/efficient-claude, Rajvardhman05/claude-model-router,
celiktech24-cell/smart-task-router, CodeShuX/tokenwise, AqueGen/model-routing,
titouannwtt/claude-tools, Zihao-Wu06/claude-code-orchestrate. Note from token-router: a SKILL.md
`model:` field only applies together with `context: fork`. Verify against current Claude Code docs.

## Milestones

| # | Milestone | Size | Status |
| --- | --- | --- | --- |
| M1 | Skeleton: README, CHANGELOG, LICENSE, this handover | S | ✅ done |
| M2 | `global/about-me.md`, `global/writing-style.md` | S | ✅ done |
| M3 | `global/workflow.md` (the request process) | M | next |
| M4 | `global/code-rules.md` | M | |
| M5 | `global/git-and-releases.md` | S | |
| M6 | `new-project.md`, `stacks.md` | M | |
| M7 | `templates/CLAUDE.md`, `templates/handover.md`, `templates/roadmap.md` | M | |
| M8 | `templates/release-notes.md`, `templates/README.md` | S | |
| M9 | `skills/catalog.md` | M | |
| M10 | `skills/model-router/SKILL.md` | S | |
| M11 | `install.ps1`, test in a fresh session, ask, push as `coding-preferences` | M | |

## Current state

M1 and M2 done and committed locally. Nothing pushed. Next: M3.
