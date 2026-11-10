# Wires this repo into Claude Code for every session on this PC.
#  1. Adds a block to ~/.claude/CLAUDE.md that imports the files in global/ (imports, not
#     copies: a git pull here updates every new session).
#  2. Links skills/model-router into ~/.claude/skills/ (a directory junction, no admin needed).
# Safe to run again: the block is replaced, not duplicated, and anything else in
# CLAUDE.md is kept. A backup of CLAUDE.md is saved before it changes.

$ErrorActionPreference = 'Stop'

$repo = $PSScriptRoot
$claudeDir = Join-Path $HOME '.claude'
$claudeMd = Join-Path $claudeDir 'CLAUDE.md'
$begin = '<!-- BEGIN coding-preferences (managed by install.ps1, edit the repo instead) -->'
$end = '<!-- END coding-preferences -->'

# 1. The import block
$files = 'about-me', 'workflow', 'code-rules', 'writing-style', 'git-and-releases'
$imports = $files | ForEach-Object { '@' + ((Join-Path $repo "global\$_.md") -replace '\\', '/') }
$block = (@($begin, "My preferences repo: $($repo -replace '\\', '/')", '') + $imports + @($end)) -join "`n"

New-Item -ItemType Directory -Force $claudeDir | Out-Null
$old = ''
if (Test-Path $claudeMd) {
    $old = [IO.File]::ReadAllText($claudeMd)
    Copy-Item $claudeMd "$claudeMd.bak" -Force
}
$pattern = '(?s)' + [regex]::Escape($begin) + '.*?' + [regex]::Escape($end)
if ($old -match $pattern) {
    $new = [regex]::Replace($old, $pattern, { param($m) $block })
} elseif ($old.Trim()) {
    $new = $old.TrimEnd() + "`n`n" + $block + "`n"
} else {
    $new = $block + "`n"
}
[IO.File]::WriteAllText($claudeMd, $new, (New-Object Text.UTF8Encoding $false))
Write-Host "Updated $claudeMd"

# 2. The model-router skill
$skillsDir = Join-Path $claudeDir 'skills'
$link = Join-Path $skillsDir 'model-router'
$target = Join-Path $repo 'skills\model-router'
New-Item -ItemType Directory -Force $skillsDir | Out-Null
if (Test-Path $link) {
    $item = Get-Item $link -Force
    if ($item.LinkType) {
        $item.Delete()  # removes only the link, never the repo folder it points to
    } else {
        Write-Warning "$link is a real folder, not a link. Left alone: delete or rename it and run this again."
        return
    }
}
New-Item -ItemType Junction -Path $link -Target $target | Out-Null
Write-Host "Linked $link -> $target"
Write-Host 'Done. Start a new Claude Code session to load it.'
