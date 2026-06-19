[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Name,

    [string]$DisplayName,
    [string]$ShortDescription,

    [switch]$WithScripts,
    [switch]$WithReferences,
    [switch]$WithAssets,
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Normalize-SkillName {
    param([string]$RawName)

    $normalized = $RawName.Trim().ToLowerInvariant() -replace "[^a-z0-9]+", "-"
    $normalized = $normalized.Trim("-") -replace "-{2,}", "-"
    return $normalized
}

function Escape-YamlDoubleQuoted {
    param([string]$Value)

    return $Value.Replace("\", "\\").Replace('"', '\"')
}

function Title-FromSkillName {
    param([string]$SkillName)

    $textInfo = (Get-Culture).TextInfo
    return $textInfo.ToTitleCase(($SkillName -replace "-", " "))
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillsRoot = Join-Path $repoRoot "skills"
$skillName = Normalize-SkillName $Name

if (-not $skillName) {
    throw "Skill name must include at least one letter or digit."
}

if ($skillName.Length -gt 64) {
    throw "Skill name '$skillName' is too long. Use 64 characters or fewer."
}

$skillDir = Join-Path $skillsRoot $skillName
$agentsDir = Join-Path $skillDir "agents"

if (Test-Path -LiteralPath $skillDir) {
    throw "Skill already exists: $skillDir"
}

$title = if ($DisplayName) { $DisplayName } else { Title-FromSkillName $skillName }
$summary = if ($ShortDescription) { $ShortDescription } else { "Draft this skill's concise UI summary." }
$description = "Describe what this skill does and when Codex should use it."
$defaultPrompt = "Use $" + $skillName + " to handle this task."

$skillMarkdown = @"
---
name: $skillName
description: $description
---

# $title

## Workflow

1. Define the trigger and concrete examples.
2. Keep SKILL.md focused on the steps every run needs.
3. Move branch-specific details into references/.
4. Add scripts only for repeatable deterministic work.
5. Validate before considering the skill done.

## References

Read files under references/ only when this skill points to them for the current task.
"@

$openAiYaml = @"
interface:
  display_name: "$(Escape-YamlDoubleQuoted $title)"
  short_description: "$(Escape-YamlDoubleQuoted $summary)"
  default_prompt: "$(Escape-YamlDoubleQuoted $defaultPrompt)"
"@

if ($DryRun) {
    Write-Host "Would create skill: $skillDir"
    Write-Host "Normalized name: $skillName"
    return
}

New-Item -ItemType Directory -Path $skillDir | Out-Null
New-Item -ItemType Directory -Path $agentsDir | Out-Null

Set-Content -LiteralPath (Join-Path $skillDir "SKILL.md") -Value $skillMarkdown -Encoding UTF8
Set-Content -LiteralPath (Join-Path $agentsDir "openai.yaml") -Value $openAiYaml -Encoding UTF8

if ($WithScripts) {
    New-Item -ItemType Directory -Path (Join-Path $skillDir "scripts") | Out-Null
}

if ($WithReferences) {
    New-Item -ItemType Directory -Path (Join-Path $skillDir "references") | Out-Null
}

if ($WithAssets) {
    New-Item -ItemType Directory -Path (Join-Path $skillDir "assets") | Out-Null
}

Write-Host "Created skill: $skillDir"
