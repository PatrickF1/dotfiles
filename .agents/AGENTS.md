# Global agent instructions

## Time

Use Pacific Time (PT) for all user-facing timestamps, never UTC.

## Approval before external changes

Get explicit user approval before any:

- Google Workspace MCP action that creates, edits, formats, comments on, deletes, moves, copies, renames, or shares content or changes permissions. This includes Docs tabs, Sheets data, Drive files/folders, and Calendar events/attendees.
- Slack MCP action that sends, drafts, schedules, or replies to messages; modifies channels; or creates/edits visible content.

## Code and comments

Write code, names, comments, and docstrings for a reader who has no access to the editing conversation. Describe current behavior and enduring reasons; do not embed change history, dates, prior values, removed technologies, abandoned approaches, or instructions defending the latest edit. Put change history in commit messages or PR descriptions.

Comment only when it adds a non-obvious constraint, invariant, or tradeoff. State the reason directly (e.g. "Enable acknowledgments so failed writes can be retried"), rather than narrating a previous bug or contrasting with deleted code. Mention an alternative only when it remains relevant to understanding or safely maintaining the current code. Remove stale comments in code you change; omit comments that merely restate the code.

## Git workflow

Before code changes in any repository, create a new branch from current HEAD and a new worktree; perform all edits, builds, and tests there.
Preserve iteration history: make a new commit for each revision, even tiny fixes. Never amend unless I explicitly request it in that message. Rebasing to correct a branch's base is allowed.

## GitHub identity

- The `gh` on PATH is a DoorDash wrapper pinned to work account `PatrickF27`.
- Personal account: `PatrickF1`. Use `/opt/homebrew/bin/gh` with explicit per-command identity selection as documented in `/Users/patrick.fong/Code/AGENTS.md`; do not assume the active keyring account is personal. SSH pushes authenticate as `PatrickF1`.
- Just as PatrickF27 can access DoorDash repos but not personal repos, PatrickF1 can access personal repos but not DoorDash repos.
- Before ANY Git/GitHub operation involving a repository, clone, or worktree under `/Users/patrick.fong/Code`, read and follow `/Users/patrick.fong/Code/AGENTS.md` in full; it is above Git roots and may not load automatically.
