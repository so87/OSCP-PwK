Get-ChildItem -Path . -Recurse -Force -Include *.sh | ForEach-Object {
  (Get-Content $_ -Raw).Replace("`r`n","`n") | Set-Content $_ -Force
}