# Base64 StringToSec and SecToString

function StringToSec ($str)
	{
        $b  = [System.Text.Encoding]::UTF8.GetBytes($str)
        [System.Convert]::ToBase64String($b)
    }

function SecToString ($str)
	{
        $b  = [System.Convert]::FromBase64String($str)
        [System.Text.Encoding]::UTF8.GetString($b)
    }

StringToSec "123123123asfasfsssa"

SecToString "MTIzMTIzMTIzYXNmYXNmc3NzYQ=="
