<!--
Template for a project's CLAUDE.md. Fill in the <placeholders>, delete sections that don't
apply and delete this comment. Keep it short: only what's specific to this project. The
global rules (workflow, code, writing, git) are loaded from ~/.claude/CLAUDE.md already.
-->

# <App name>: notes for Claude

<One paragraph: what the app does, who it's for, the stack, and where it stands (for example
"free beta, sold later" or "demo for client review").>

**Read [handover.md](handover.md) before changing anything.** It has the milestone plan and
where the work stopped.

## Project choices

| Choice | This project |
| --- | --- |
| Stack | <e.g. Python 3.12 + PyQt6> |
| Data | <e.g. SQLite on the device, no backend> |
| Languages | <e.g. English only / en, ar (RTL), de, es, fr> |
| Themes | <e.g. light + dark> |
| Design | <reference site, design system file, or skill> |
| Shipping | <e.g. GitHub Releases zip / Vercel at https://...> |
| Version | <e.g. 0.1.0-beta>, stored in <file> |
| Skills | <e.g. ponytail, i-have-adhd, taste-skill> |
| Repo | <https://github.com/4bdulllahh/...> |

## Rules that are easy to break

<!-- Things a new session would get wrong. One line each, the most important first. Examples: -->

- <`app/core/` never imports the UI. Business rules live there and are tested.>
- <Database changes need a migration and a `SCHEMA_VERSION` bump: users update in place.>
- <Every new piece of on-screen text needs translating, or `tests/test_i18n.py` fails.>

## Everyday commands

```
<install dependencies>
<run the app>
<run all checks / tests>
<build a release>
```
