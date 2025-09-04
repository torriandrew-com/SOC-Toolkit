param([int]$Hours = 24)

$start = (Get-Date).AddHours(-$Hours)

Get-WinEvent -FilterHashtable @{ LogName='Security'; Id=4625; StartTime=$start } |
  ForEach-Object {
    [pscustomobject]@{
      Time = $_.TimeCreated
      User = $_.Properties[5].Value       # Account Name
      IP   = $_.Properties[19].Value      # Source IP (may be empty for local)
      LogonType = $_.Properties[10].Value
    }
  } |
  Group-Object IP |
  Sort-Object Count -Desc |
  Select-Object @{n='IP';e={$_.Name}}, Count
