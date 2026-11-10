# Starting a new project

Instructions for Claude when I start a project with the bootstrap prompt from the README.
The global rules in `global/` apply throughout. This file adds the kickoff steps.

## 1. Read

1. `global/` (skip it if it's already loaded through `~/.claude/CLAUDE.md`).
2. [stacks.md](stacks.md) and [skills/catalog.md](skills/catalog.md).
3. Look at the new folder: is it empty, an existing project, or a git repo already?

If `~/.claude/CLAUDE.md` doesn't import this repo's `global/` files, tell me and offer to run
`install.ps1`.

## 2. Play my description back

As in [workflow.md](global/workflow.md) step 1: a numbered summary of the project as you
understood it, then "did you miss anything?". Wait for my thumbs up.

## 3. Question rounds

Use the AskUserQuestion form, with 4 options per question and the recommended one first.
Skip a question only if my description already answered it clearly.

**Round 1: the product**

- What kind: Windows desktop app, browser app, website (mine or a client's), game, hardware, other.
- Who uses it: non-technical public, a client and their customers, developers, only me.
- Name and logo: already have both, have a name only, need both (offer `web-asset-generator`).
- Money: free, free beta then paid, client project, portfolio piece.

**Round 2: the stack**

- The stack: suggest the 3 best fits from [stacks.md](stacks.md) with one line on why, and
  "something else" through Other. Always ask, never assume.
- Anything to avoid: libraries, frameworks or services I don't want.
- Data: on the device only, a file I pick, a backend (which one), not needed.
- Shipping: Vercel, GitHub Releases with an installer, client's own hosting, not decided.

**Round 3: look and feel**

- Languages: English only, English + Arabic (right to left), all 5 (en, ar, de, es, fr), other.
- Themes: light + dark, light only, dark only, follow the system.
- Design direction: a reference site I'll name, a client design system, taste-skill or
  impeccable to set one, keep it plain for now.

**Round 4: setup**

- Skills for this project (multi-select): from [skills/catalog.md](skills/catalog.md), the
  ones that fit. ECC is offered here, only installed if I say yes.
- License: MIT, private (no license), client owns it, decide later.
- Starting version: `0.1.0-beta` for desktop apps, `0.1.0` for web, or my choice.
- CI: GitHub Actions with tests and build, tests only, none yet.

## 4. The plan

A milestone table as in [workflow.md](global/workflow.md) step 2: M1 is always the setup
below, then one milestone per feature. Wait for the final thumbs up.

## 5. Setup (milestone 1)

Create only what applies:

| File | From | Notes |
| --- | --- | --- |
| `CLAUDE.md` | [templates/CLAUDE.md](templates/CLAUDE.md) | Only project-specific choices, rules and commands. Don't copy the global rules: they're loaded already. |
| `handover.md` | [templates/handover.md](templates/handover.md) | With the full milestone plan filled in. |
| `docs/roadmap.md` | [templates/roadmap.md](templates/roadmap.md) | Features that didn't make the first plan go here. |
| `README.md` | [templates/README.md](templates/README.md) | A short version now, filled out at the first release. |
| `LICENSE` | | As chosen. |
| `.gitignore`, `.gitattributes` | | `.gitattributes` with `* text=auto eol=lf` so Windows line endings don't cause noise. |
| CI workflow | [stacks.md](stacks.md) | `.github/workflows/`, as chosen. |
| Project skeleton | [stacks.md](stacks.md) | The folder layout for the chosen stack. |

I usually make the repo on github.com and clone it first. If GitHub already created a
`README.md`, `LICENSE` or `.gitignore`, keep them and fill them in rather than replacing them.
The repo and remote already exist then, so skip `git init` and creating the GitHub repo.

Then:

1. Install the chosen skills. Plugin installs need me to type the slash command, so give me
   the exact commands from the catalog to paste.
2. `git init` if needed, and commit as `feat: M1 project setup`.
3. Ask before creating the GitHub repo or pushing.
