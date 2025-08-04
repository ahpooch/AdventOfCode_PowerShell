# link: https://adventofcode.com/2015/day/1
# meta: {year:2015,day:1,part:1,name:"Not Quite Lisp",state:"solved"}

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