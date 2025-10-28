param(
  [string]$RepoRoot = ".",
  [string]$OutFile = "ALL_CODE.txt"
)

$PruneDirs = @(".git","node_modules","dist","build","coverage",".next",".turbo",".cache")
$Exts = @("js","jsx","ts","tsx","json","md","yml","yaml","html","css","sh","py","sql","env","example")

if (Test-Path $OutFile) { Remove-Item $OutFile }

$files = Get-ChildItem -Path $RepoRoot -Recurse -File -ErrorAction SilentlyContinue | Where-Object {
  $skip = $false
  foreach ($d in $PruneDirs) {
    if ($_.FullName -like "*\$d\*") { $skip = $true; break }
  }
  if ($skip) { return $false }
  $name = $_.Name.ToLower()
  if ($name -eq "dockerfile" -or $name -eq "docker-compose.yml") { return $true }
  foreach ($e in $Exts) {
    if ($name.EndsWith(".$e")) { return $true }
  }
  return $false
} | Sort-Object FullName

foreach ($f in $files) {
  "===== FILE: $($f.FullName) =====" | Out-File -FilePath $OutFile -Append -Encoding UTF8
  try {
    Get-Content -Path $f.FullName -Raw -ErrorAction Stop | Out-File -FilePath $OutFile -Append -Encoding UTF8
  } catch {}
  "`n`n" | Out-File -FilePath $OutFile -Append -Encoding UTF8
}

Write-Host "Wrote $OutFile"
