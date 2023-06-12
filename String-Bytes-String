# String to bytes
$enc = [system.Text.Encoding]::UTF8
$consumerkey = "test"
$encconsumerkey = $enc.GetBytes($consumerkey)

$encconsumerkey
$enc.GetString($encconsumerkey)

# Decoding
# UTF8
[System.Text.Encoding]::UTF8.GetString($encconsumerkey)
# ASCII
[System.Text.Encoding]::ASCII.GetString($encconsumerkey)
# Windows-1252
[System.Text.Encoding]::Default.GetString($encconsumerkey)
