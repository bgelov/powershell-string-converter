# Encrypt with keyfile

if (!(Test-Path "$PSScriptRoot\script.conf.encrypted")) {
    if (Test-Path "$PSScriptRoot\script.conf") {
       
        $enc = [system.Text.Encoding]::UTF8
        $secretstring = "You secret string here" 
        $Key = $enc.GetBytes($secretstring)
        $Key | Set-Content "$PSScriptRoot\keyfile.key"
        $Key = Get-Content "$PSScriptRoot\keyfile.key"

        $unencrData = Get-Content "$PSScriptRoot\script.conf" | Convertto-Json -Depth 1
        $unencrData | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString -key $Key | Set-Content -Path "$PSScriptRoot\script.conf.encrypted"

        [System.Windows.MessageBox]::Show("script.conf.encrypted and keyfile.key was generated", "Information", "OK", "None")
    } else {
        [System.Windows.MessageBox]::Show("Cleartext script.conf not found", "Information", "OK", "None")
    }
}
if (Test-Path "$PSScriptRoot\script.conf.encrypted"){

    if (!(Test-Path "$PSScriptRoot\keyfile.key")) {
        [System.Windows.MessageBox]::Show("keyfile.key not found", "Information", "OK", "None")
    } else { $Key = Get-Content "$PSScriptRoot\keyfile.key" }

    $EncrData = Get-Content -Path "$PSScriptRoot\script.conf.encrypted" | ConvertTo-SecureString -key $Key
    $LoadedData = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($EncrData))

    $configData = ($LoadedData | ConvertFrom-Json).value
}