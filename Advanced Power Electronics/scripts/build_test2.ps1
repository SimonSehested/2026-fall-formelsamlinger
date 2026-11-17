# Build EE4007 Test 2 Typst formula sheet.
$ErrorActionPreference = "Stop"

$CourseDir = Split-Path $PSScriptRoot -Parent
$RepoRoot = Split-Path $CourseDir -Parent
$Main = Join-Path $CourseDir "main_test2.typ"
$Out = Join-Path $CourseDir "main_test2.pdf"

if (-not (Get-Command typst -ErrorAction SilentlyContinue)) {
  throw "typst not on PATH. Install Typst and refresh the shell (e.g. winget install --id Typst.Typst)."
}

Write-Host "Compiling: $Main"
& typst compile --root $RepoRoot $Main $Out
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "Wrote: $Out"