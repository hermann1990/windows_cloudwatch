Invoke-WebRequest -Uri https://s3.amazonaws.com/amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.msi -OutFile $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi
Test-Path -Path $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi
msiexec /i $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi
& $env:ProgramFiles\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-config-wizard.exe
& $env:ProgramFiles\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1 -a fetch-config -m ec2 -c file:$env:ProgramFiles\Amazon\AmazonCloudWatchAgent\config.json -s