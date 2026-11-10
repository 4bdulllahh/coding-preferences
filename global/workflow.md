# Workflow: how every request goes

Follow these steps in order. **No code changes before step 3**, and step 3 only starts after my thumbs up.

Skip steps 1 and 2 only for a direct question or a small fix I spelled out exactly. When
unsure, do them.

## 1. Play my prompt back

Read the code the request touches first (only the parts you need), then reply with:

1. **Summary:** a numbered list of everything I asked for, in clear words. Include the
   small things I mentioned in passing.
2. **What you found:** a few lines on the current code, conflicts between my asks, and
   what you recommend.
3. **"Did you miss anything?"** I often forget things. Ask once, and again if my answer
   adds a lot.

Wait for my thumbs up.

## 2. Questions, then the plan

- After the thumbs up, ask multiple-choice questions with the AskUserQuestion form,
  even when you could guess. I prefer being asked. Use 4 options per question (the form
  adds "Other" as a 5th), put the recommended one first with "(Recommended)", and make
  each question make sense on its own. Do several rounds if needed.
- Things to ask about: anything vague, choices with trade-offs, and anything that's mine
  to decide (the stack on a new project, wording, design direction).
- Then show the **milestone plan** as a table: number, what it does, size (S/M/L). Wait
  for the final thumbs up.

## 3. Build in milestones

- **One feature, task or design per milestone.** A big prompt becomes 8 or more milestones.
- Split anything that looks L into smaller milestones.
- Every milestone ends in a working state: the code runs, its tests pass and the project
  checks are clean.
- At the end of each one: commit locally (see [git-and-releases.md](git-and-releases.md)),
  update `handover.md`, and tick it off in the roadmap if there is one.

## 4. Token check after every milestone

Then stop and report:

1. What's done, in a few lines.
2. The next milestone and its size (S/M/L).
3. My usage %. You can't see it, so ask me. To estimate, compare: "the last M took
   about X%, the next one is also M, so it needs about X%." Use my numbers from before
   and after each milestone to get better at this.
4. If it won't fit with some margin left, recommend stopping. Make sure `handover.md` is
   up to date and committed, and tell me to come back with **"continue read the handover"**.

If I say "run several" or "keep going", carry on without stopping until your estimate
says the next milestone won't fit.

## 5. "continue read the handover"

When a session starts with this:

1. Read `handover.md`, and only the files it points to for the next step.
2. Check `git status` and `git log --oneline -5` for anything that changed since.
3. Tell me in 2 or 3 lines where we are and what's next.
4. Carry on with the next milestone. The plan was already approved. If the plan is
   finished, ask what's next.

`handover.md` is updated at the end of **every** milestone, not only when stopping, so a
session can end at any time without losing anything. Template: `templates/handover.md`
in my preferences repo.

## 6. Commit and push

- **Commit freely:** a local commit after each milestone, with a clear message.
- **Ask before pushing:** one question listing the commits that would go up. Never force push.

## 7. Releases

When a milestone plan ends in a release, or I say "release": bump the version, write
paste-ready release notes, update the README (features, badges, logo, screenshots),
update the changelog and roadmap, and build. Details: [git-and-releases.md](git-and-releases.md).

## Saving tokens

- **Delegate easy jobs** (searching, reading lots of files, formatting, screenshots) to a
  cheaper model, following the `model-router` skill. Keep planning and hard code on the main model.
- **Don't re-read** files you've already read in this session. Read only the part you need.
- **Talk style:** ponytail and i-have-adhd are always on. Caveman only when I say "caveman".
- **Suggest `/clear`** when we move to an unrelated task, after the handover is up to date.
