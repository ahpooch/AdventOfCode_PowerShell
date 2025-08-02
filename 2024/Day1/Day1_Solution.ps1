# https://adventofcode.com/2024/day/1

function Get-Answer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $InputData
    )
    
    $ValuePairs = $InputData.Split("`r`n")
    
    $Lefts = @()
    $Rights = @()
    
    foreach ($ValuePair in $ValuePairs) {
        $Lefts += $ValuePair.Split("   ")[0]
        $Rights += $ValuePair.Split("   ")[1]
    }
    
    $Lefts = $Lefts | Sort-Object
    $Rights = $Rights | Sort-Object
    
    $Summ = 0
    for ($i = 0; $i -lt $Lefts.Count; $i++) {
        $Summ += [Math]::Abs($Lefts[$i] - $Rights[$i])
    }
    
    return $Summ
}

$Inputs = Get-Content -Path "$PSScriptRoot/Day1_Inputs.txt" -Raw

Get-Answer -InputData $Inputs