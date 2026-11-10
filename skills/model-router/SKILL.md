---
name: model-router
description: Save tokens by handing easy jobs to cheaper models through subagents. Use during any milestone or multi-step task, before searching a codebase or the web, reading many files, running tests or builds and reading their output, taking screenshots, or doing mechanical edits and docs from a clear outline.
---

# Model router

Keep the main session on its model: switching models mid-session throws away the prompt
cache. Save tokens by sending jobs to a subagent with the Agent tool's `model` parameter
(`haiku` or `sonnet`). Only the subagent's short answer comes back into the main context.

## Who does what

| Model | Jobs |
| --- | --- |
| **haiku** | Find files, symbols and usages. Read many files and summarise them. Look up facts on the web. Run tests, lint or a build and report only the failures. Take and describe screenshots. Fully specified mechanical edits (rename, move, reformat). Check links. |
| **sonnet** | A fully specified change across a few files. Tests for behaviour that's already decided. Docs, README sections, release notes and translations from a clear outline. A bug whose cause is already known. Checking a diff against a list of rules. |
| **main model** | Reading the user's prompt, the playback, the questions and the milestone plan. Architecture and design. Bugs with an unknown cause. Security, data migrations, money. Checking what subagents return. Anything that talks to the user. |

## How to delegate

1. **Write a tight brief.** A subagent starts with no context: give it the goal, the exact
   files or paths, what done looks like, and what to send back ("paths and line numbers
   only", "failures only", "under 20 lines").
2. **Read-only searches** use `subagent_type: "Explore"` with `model: "haiku"`.
3. **Run independent jobs in parallel,** in one message.
4. **Check the result** before building on it (look at the diff, run the tests). If it's wrong
   or thin, retry once on the next model up, then do it yourself.

## Don't delegate

- **Tiny jobs:** one search, one file read, a two-line edit. Starting a subagent costs more
  than it saves. Delegate when it saves several file reads or a long output.
- **Anything needing the conversation:** the user's wishes, earlier decisions, taste.
- **Commits, pushes and questions to the user.** Those stay in the main session.
