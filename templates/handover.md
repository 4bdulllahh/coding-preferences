<!--
Template for a project's handover.md. Fill in the <placeholders> and delete this comment.
Update it at the end of EVERY milestone, so a session can stop at any time. When it grows
past about 300 lines, split it into docs/handover/ (one file per area plus a README.md index
that says which file to read for which change).
-->

# <App name>: handover

For the next Claude session. The user starts it with **"continue read the handover"**: read
this file, check `git status` and `git log --oneline -5`, say in 2 or 3 lines where things
stand, then carry on with the next milestone. The plan below is already approved.

## What it is

<Two or three sentences: what the app does, for whom, and its most important design choice
(for example "no backend, everything stays on the device").>

| What | Where |
| --- | --- |
| Folder | `<C:\Users\Computer\Documents\GitHub\...>`, branch `main` |
| Remote | <https://github.com/4bdulllahh/...> |
| Live site / download | <url or "not released yet"> |
| CI | <`.github/workflows/...`, what it runs> |

## Starting a session

```
<install, then run the checks: the exact commands>
```

## How the code is organised

| Folder | What's in it |
| --- | --- |
| <`src/domain/`> | <pure logic, fully tested> |

## Data and storage

<What's saved, where, in which format, and how old data is migrated.>

## Rules that must not break

<Anything beyond CLAUDE.md's list that would cause real damage: data loss, broken releases,
security. Say why for each.>

## Checking your work

<The exact commands, and how to check the running app (screenshots, browser checks).>

## Milestones

| # | Milestone | Size | Status |
| --- | --- | --- | --- |
| M1 | Project setup | S | <✅ done / next / blank> |
| M2 | <feature> | <S/M/L> | |

## Current state

- **Last done:** <milestone and what it delivered>
- **Next:** <milestone, and the first concrete step>
- **Open questions:** <anything waiting on the user>
- **Known issues:** <bugs or shortcuts to come back to>
- **Not pushed:** <commits waiting for the user's OK to push, or "nothing">
