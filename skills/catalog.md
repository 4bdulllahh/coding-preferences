# Skills catalog

Every skill I use or have saved, with when to use it and how to install it. My full collection
is the GitHub list [claude-skills](https://github.com/stars/4bdulllahh/lists/claude-skills).
At the start of a project, suggest the ones that fit (see [new-project.md](../new-project.md)).

**Adding a skill:** add one row to the right table below and a line to `CHANGELOG.md`.

## Rules

- **Install only from the official repo** linked here. Several of these projects warn that
  copies elsewhere (npm or PyPI look-alikes, re-uploads) may contain malware.
- **Always-on skills install user-wide.** Per-project skills install with project scope
  (`claude plugin install <name> --scope project`), so they only load where they're used.
- **Plugin commands are typed by me** (`/plugin ...`). Claude gives me the exact lines to paste.
- **Talk style:** ponytail and i-have-adhd are always on. Caveman only when I say "caveman",
  because its very short replies clash with prompt playbacks, summaries and release notes.
- **ECC** is offered per project and only installed if I say yes: it's large and overlaps ponytail.

## Always on

| Skill | What it does | Install |
| --- | --- | --- |
| [ponytail](https://github.com/DietrichGebert/ponytail) | Lazy senior dev: the smallest change that fully solves the task, so less code and fewer tokens. Also `/ponytail-review`, `/ponytail-audit`, `/ponytail-debt`. **Must have.** | `/plugin marketplace add DietrichGebert/ponytail` then `/plugin install ponytail@ponytail` |
| [i-have-adhd](https://github.com/ayghri/i-have-adhd) | Straight answers: action first, numbered steps, no filler. | `/plugin marketplace add ayghri/i-have-adhd` then `/plugin install i-have-adhd@i-have-adhd` |
| [model-router](model-router/SKILL.md) | Mine. Hands easy jobs to cheaper models to save tokens. | `install.ps1` in this repo |

## On demand

| Skill | Use when | Install |
| --- | --- | --- |
| [caveman](https://github.com/JuliusBrussee/caveman) | I say "caveman": very short replies during long build stretches. Cuts output tokens a lot. | `/plugin marketplace add JuliusBrussee/caveman` then `/plugin install caveman@caveman` |
| [mattpocock/skills](https://github.com/mattpocock/skills) | Planning and engineering: `/grill-me` (get interviewed about a plan), `/to-spec`, `/to-tickets`, `/wayfinder` (work bigger than one session), `/tdd`, `diagnosing-bugs`, `/handoff`, `/wait-what`. | `claude plugin install mattpocock-skills@claude-plugins-official`, then run `/setup-matt-pocock-skills` in the project |

## Per project: design and assets

| Skill | Use when | Install |
| --- | --- | --- |
| [taste-skill](https://github.com/Leonxlnx/taste-skill) | Any UI or website: art direction, reference images and a browser check instead of generic AI-looking pages. Needs Node 22+ and Edge or Chrome. | `/plugin marketplace add Leonxlnx/taste-skill` then `/plugin install taste-skill@taste-skill` |
| [impeccable](https://github.com/pbakaus/impeccable) | Polishing a design: words like "polish" and "bolder", `critique` and `audit`, catches AI slop. `npx impeccable detect <url>` scans a page. | `npx impeccable install` |
| [web-asset-generator](https://github.com/alonw0/web-asset-generator) | Favicons, app icons and social share images from a logo, text or emoji. | `/plugin marketplace add alonw0/web-asset-generator` then `/plugin install web-asset-generator@web-asset-generator-marketplace`, then `pip install Pillow` |
| [brag](https://github.com/latent-spaces/brag) | A short launch video of a finished project, for socials. | `/plugin marketplace add latent-spaces/brag` then `/plugin install brag@brag` |

## Per project: building

| Skill | Use when | Install |
| --- | --- | --- |
| [ECC](https://github.com/affaan-m/ECC) | Big projects that want its agents, security checks and research-first workflow. Ask first: large, overlaps ponytail. | `npx ecc-universal@2.2.3 setup` (plugin `ecc@ecc`). Don't stack a manual install on top. |
| [supabase/agent-skills](https://github.com/supabase/agent-skills) | The project uses Supabase (accounts, sync, a shared database). | `npx skills add supabase/agent-skills` |
| [n8n-skills](https://github.com/czlonkowski/n8n-skills) | Building n8n automations. | `/plugin marketplace add czlonkowski/n8n-skills` then `/plugin install` from it |
| [ios-simulator-skill](https://github.com/conorluddy/ios-simulator-skill) | iPhone apps: build, run and drive the iOS simulator (needs a Mac with Xcode). | `/plugin marketplace add conorluddy/ios-simulator-skill` then `/plugin install ios-simulator-skill@conorluddy` |
| [Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) | Bigger games: 49 agents and 72 workflow skills set up like a game studio. It's a template you clone, not a plugin. | `git clone https://github.com/Donchitos/Claude-Code-Game-Studios.git <game-folder>` |

## Per project: research and marketing

| Skill | Use when | Install |
| --- | --- | --- |
| [marketingskills](https://github.com/coreyhaines31/marketingskills) | Landing pages, copywriting, SEO, conversion. Good for client websites. | `npx skills add coreyhaines31/marketingskills` (`--list` to pick single skills) |
| [Agent-Reach](https://github.com/Panniantong/Agent-Reach) | Reading and searching Twitter, Reddit, YouTube and more, with no API fees. | Ask Claude to follow `https://raw.githubusercontent.com/Panniantong/Agent-Reach/main/docs/install.md`. **Not** the `agent-reach` package on PyPI: that's someone else's. |

## Later

| Skill | Notes | Install |
| --- | --- | --- |
| [graphify](https://github.com/Graphify-Labs/graphify) | Turns a codebase into a knowledge graph Claude can query, so it reads less. I'll learn it later: suggest it when a project gets big. | `uv tool install graphifyy` (two y's), then see its README |

## Model routing: other skills I looked at

I wrote my own [model-router](model-router/SKILL.md) because none of these were proven yet
(November 2026, all under 30 stars). Check again later. Most of them route through subagents too.

| Repo | Approach |
| --- | --- |
| [smart-task-router](https://github.com/celiktech24-cell/smart-task-router) | Opus plans, Haiku/Sonnet build, each step checked, moves up a model only on failure |
| [claude-model-router](https://github.com/Rajvardhman05/claude-model-router) | Picks the cheapest model per subagent job, never switches the main model (keeps the cache) |
| [efficient-claude](https://github.com/thevrus/efficient-claude) | Routes subagent jobs to the cheapest Claude model that still gets them right |
| [tokenwise](https://github.com/CodeShuX/tokenwise) | Router that measures real savings, with an A/B command |
| [model-routing](https://github.com/AqueGen/model-routing) | Pinned subagents: Sonnet scout and implementer, Haiku test runner, Opus reviewer |
| [claude-tools](https://github.com/titouannwtt/claude-tools) | A hook that enforces routing on every subagent launch |
| [claude-code-orchestrate](https://github.com/Zihao-Wu06/claude-code-orchestrate) | Haiku for read-only scouting, Sonnet for fully specified work, Opus plans |
