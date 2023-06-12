# String to SHA1

$enc = [system.Text.Encoding]::UTF8
$string1 = "test" 
$data1 = $enc.GetBytes($string1) 

# SHA1 Crypto Service Provider
$sha = New-Object System.Security.Cryptography.SHA1CryptoServiceProvider 

# hash
$result1 = $sha.ComputeHash($data1)

[System.Convert]::ToBase64String($result1)
