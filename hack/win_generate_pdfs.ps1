#!/usr/bin/env pwsh

# --- Prerequisite checks ---
$missing = @()

if (-not (Get-Command "npx" -ErrorAction SilentlyContinue)) {
    if (-not (Get-Command "nvm" -ErrorAction SilentlyContinue)) {
        $missing += "nvm (install via: winget install -e --id CoreyButler.NVMforWindows)"
    }
    $missing += "npx/Node.js (install via nvm: nvm install lts && nvm use lts)"
}

if ($missing.Count -gt 0) {
    Write-Host "Error: missing required tools:" -ForegroundColor Red
    foreach ($m in $missing) {
        Write-Host "  - $m" -ForegroundColor Yellow
    }
    exit 1
}

# --- PDF generation ---
New-Item -ItemType Directory -Force -Path "docs/pdf" | Out-Null

if ($args.Count -gt 0) {
    $f = "docs/$($args[0]).md"
    if (-not (Test-Path $f)) {
        Write-Host "Error: $f not found. Available:"
        Get-ChildItem docs/*.md -ErrorAction SilentlyContinue | ForEach-Object {
            $_.Name -replace '\.md$', ''
        }
        exit 1
    }
    $files = @($f)
} else {
    $files = @(Get-ChildItem docs/*.md | ForEach-Object { $_.FullName })
}

# Identity lives in profile.env at the repo root
$profilePath = Join-Path $PSScriptRoot "..\profile.env"
if (-not (Test-Path $profilePath)) {
    Write-Error "profile.env not found at $profilePath"
    exit 1
}
$pdfSlug = $null
foreach ($line in Get-Content $profilePath) {
    if ($line -match '^\s*PDF_SLUG\s*=\s*(.+?)\s*$') { $pdfSlug = $Matches[1].Trim('"').Trim("'") }
}
if (-not $pdfSlug) {
    Write-Error "PDF_SLUG not set in profile.env"
    exit 1
}

foreach ($f in $files) {
    $base = [System.IO.Path]::GetFileNameWithoutExtension($f)
    $outName = "$pdfSlug-resume-$base.pdf"
    Write-Host "Converting $f -> docs/pdf/$outName"
    npx --yes md-to-pdf $f
    $generatedPdf = $f -replace '\.md$', '.pdf'
    Move-Item -Force $generatedPdf "docs/pdf/$outName"
}

Write-Host "Done:"
Get-ChildItem docs/pdf/*.pdf | Format-Table Name, Length, LastWriteTime
