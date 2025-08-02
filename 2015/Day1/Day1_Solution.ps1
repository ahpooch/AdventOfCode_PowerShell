# https://adventofcode.com/2015/day/1

function Get-Answer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $InputData
    )

    $UPs = $Inputs.Replace(")","").Length
    $DOWNs = $Inputs.Replace("(","").Length
    return $UPs - $DOWNs
}

$Inputs = Get-Content -Path "$PSScriptRoot\Day1_Inputs.txt" -Raw

Get-Answer -InputData $Inputs