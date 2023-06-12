# String to Basic string
# https://docs.microsoft.com/en-us/previous-versions/windows/desktop/automat/bstr

$PlainPassword = "test phrase" | ConvertTo-SecureString -AsPlainText -Force
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PlainPassword)
$PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
Write-Host "Password is: " $PlainPassword
Write-Host "BSTR: " $BSTR
