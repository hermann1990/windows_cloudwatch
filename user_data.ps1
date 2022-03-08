$parameters = @{
    url = 'https://s3.amazonaws.com/amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.zip'
    outFile = "env:TMP\mazon-cloudwatch-agent.zip"
}
Invoke-WebRequest @parameters

Expand-Archive -Path "env:TMP\mazon-cloudwatch-agent.zip" -DestinationPath "env:TMP\mazon-cloudwatch-agent"
Set-Location -Path "env:TMP\mazon-cloudwatch-agent"
.\install.ps1