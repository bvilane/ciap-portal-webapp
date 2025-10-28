param(
  [string]$RepoRoot = ".",
  [string]$OutFile = "TREE.md"
)

$PruneDirs = @(".git","node_modules","dist","build","coverage",".next",".turbo",".cache")

$files = Get-ChildItem -Path $RepoRoot -Recurse -File -ErrorAction SilentlyContinue | Where-Object {
  $skip = $false
  foreach ($d in $PruneDirs) {
    if ($_.FullName -like "*\$d\*") { $skip = $true; break }
  }
  -not $skip
} | Sort-Object FullName

"# Repository File Tree`n" | Out-File -FilePath $OutFile -Encoding UTF8
"```" | Out-File -FilePath $OutFile -Append -Encoding UTF8
$files | ForEach-Object { $_.FullName.Replace("$RepoRoot\","") } | Out-File -FilePath $OutFile -Append -Encoding UTF8
"```" | Out-File -FilePath $OutFile -Append -Encoding UTF8

Write-Host "Wrote $OutFile"
