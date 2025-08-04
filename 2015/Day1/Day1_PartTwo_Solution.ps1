# link: https://adventofcode.com/2015/day/1#part2
# meta: {year:2015,day:1,part:2,name:"Not Quite Lisp",state:solved}

function Get-Answer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $InputData
    )

    $Array = [char[]]$Inputs
    $CurrentFloor = 0
    for ($i = 0; $i -lt $Array.Count; $i++) {
        if ($Array[$i] -eq "(") {
            $CurrentFloor += 1
        }
        else {
            $CurrentFloor -= 1
        }
        if ($CurrentFloor -lt 0) {
            return $i + 1
        }
    }
}

$Inputs = Get-Content -Path "$PSScriptRoot\Day1_Inputs.txt" -Raw

Get-Answer -InputData $Inputs