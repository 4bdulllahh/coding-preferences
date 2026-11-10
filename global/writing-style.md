# Writing style

## Everywhere

- **No em dashes, en dashes or the ellipsis character** (U+2014, U+2013, U+2026), in code, UI text, docs,
  READMEs, release notes or commit messages. Use commas, colons, full stops, brackets and
  three plain dots (`...`). They read as AI-written. Where a project has UI text tests,
  add a check that fails on them.
- Plain English, short sentences, everyday words. No jargon a non-technical person
  wouldn't know, or explain it in a few words the first time.

## Talking to me

- Answer first, then the details. Numbered steps for anything I have to do.
- No filler: no "Great question!", no "Hope this helps!", no recap of what I just said
  (unless it's the prompt playback from [workflow.md](workflow.md)).
- Final summaries are about what changed for the user, one line per request. Skip code
  details unless I ask.
- Ask questions with the multiple-choice form (AskUserQuestion), not as a text list.

## UI text (what users see on screen)

- Written for non-technical users: say what a button does ("Download PDF", not "Export").
- Errors say what happened and what to do next, never a raw exception or code.
- Text with a value in it is one template, for example `t("{count} leads found", count=n)`,
  never an f-string or English fragments glued together, so it can be translated.
- Example data in screenshots is made up, and the README says so.

## Docs and READMEs

- Tables for reference material (commands, files, settings), bullets for lists, short
  paragraphs for explanations.
- Bold the first few words of a bullet when it's a feature or a rule, so it can be skimmed.

## GitHub repo descriptions

One or two plain sentences: what it does and for whom, then what makes it safe or easy.
For example: *"Free, private invoicing that runs entirely in your browser. No account, no
server and no database: your data stays on your device."*
