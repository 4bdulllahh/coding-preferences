# coding-preferences

**How I work with Claude, written down once, so I never explain it from scratch again.**

This repo is the single source of truth for my coding standards, my workflow with
Claude Code, the skills I use and the templates every project starts from. Claude reads
it at the start of a project and writes a tailored `CLAUDE.md` for that project.

**Owner:** Abdullah (abzoola) · [abdullahexe.online](https://abdullahexe.online) ·
[GitHub](https://github.com/4bdulllahh) · [LinkedIn](https://linkedin.com/in/abzoola)

## How it works

There are two layers:

| Layer | Loaded | What it holds |
| --- | --- | --- |
| `global/` | In **every** Claude session, through `~/.claude/CLAUDE.md` | Who I am, how a request goes, code rules, writing style, git and releases |
| Everything else | Only when a task needs it | New project kickoff, stack options, skills catalog, templates |

`install.ps1` points `~/.claude/CLAUDE.md` at the files in `global/`. It imports them,
it doesn't copy them, so after a `git pull` every new session has the latest rules with
nothing to reinstall.

`global/` costs tokens in every session, so it stays short. Long material goes in the
on-demand files.

## Setting up a PC (once)

```powershell
git clone https://github.com/4bdulllahh/coding-preferences.git
cd coding-preferences
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

Then install the always-on skills (ponytail, i-have-adhd) from
[skills/catalog.md](skills/catalog.md). To check it worked, start a new session and ask
"what should you call me?". After that, `git pull` here is all it takes to update.

## Starting a new project

Open Claude Code in the new project's folder and paste:

```text
I'm starting a new project in this folder. Read my preferences repo at
C:\Users\Computer\Documents\GitHub\CodingPrefrences (or
https://github.com/4bdulllahh/coding-preferences), starting with new-project.md, and
follow it: ask me your questions, and once I give the thumbs up, write this project's
CLAUDE.md and handover.md from the templates.
```

Then describe the project as usual. Claude plays your prompt back, asks what you missed,
runs the question round (stack, languages, hosting, design, skills) and only then sets
the project up.

## Coming back to a project

```text
continue read the handover
```

Every project keeps a `handover.md` that is updated after each milestone. It says
where the work stopped and what comes next.

## What's in here

| Path | What it is |
| --- | --- |
| `global/about-me.md` | Who I am, my links, how I write prompts |
| `global/workflow.md` | How every request goes: summary, questions, thumbs up, milestones, token check, handover, commit, release |
| `global/code-rules.md` | Code standards for every stack |
| `global/writing-style.md` | Plain English for UI text, docs and repo descriptions |
| `global/git-and-releases.md` | Commits, versions, release notes, README |
| `new-project.md` | The kickoff: questions to ask and how to write the project's `CLAUDE.md` |
| `stacks.md` | Stacks I've used before, offered as options, never forced |
| `skills/catalog.md` | Every skill I use: what it does, when to use it, how to install it |
| `skills/model-router/` | My skill that hands easy jobs to cheaper models |
| `templates/` | `CLAUDE.md`, `handover.md`, `roadmap.md`, `release-notes.md`, `README.md` |
| `install.ps1` | Wires `global/` into `~/.claude/CLAUDE.md` |
| `handover.md` | Where work on this repo itself stands |
| `CHANGELOG.md` | What changed in this repo and when |

## Adding to it

This repo is meant to keep growing. Keep one topic per file and put each thing where it
belongs:

| I want to add | Put it in |
| --- | --- |
| A rule for every project | The matching file in `global/`. Keep it to one line if you can. |
| A rule for one kind of project | `stacks.md` under that stack |
| A new skill | One row in `skills/catalog.md` |
| A question Claude should ask on new projects | The question list in `new-project.md` |
| A new standard file for projects | A new file in `templates/`, listed in `new-project.md` |

Then add a line to `CHANGELOG.md` and push. Nothing else needs updating.

## License

[MIT](LICENSE)
