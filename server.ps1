Start-PodeServer {
  Add-PodeEndpoint -Address localhost -Port 8080 -Protocol Https -SelfSigned

  New-PodeLoggingMethod -File -Name 'errors' | Enable-PodeErrorLogging
  New-PodeLoggingMethod -File -Name 'requests' | Enable-PodeRequestLogging

  Add-PodeRoute -Method GET -Path '/' -ScriptBlock {
    Write-PodeJsonResponse -Value @{ processes = (Get-Process).Name }
  }
}