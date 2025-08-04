# link: https://adventofcode.com/2015/day/2
# meta: {year:2015,day:2,part:2,name:"I Was Told There Would Be No Math",state:solved}

function Get-Answer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $InputData
    )

    class Box {
        [int] $Length
        [int] $Width
        [int] $Height
        [int] $SmallestPerimeter
        [int] $BowLength

        [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '', Justification = '$sp is used in different scriptblocks of ForEach')]
        Box([string] $Dimentions) {
            $this.Length = $Dimentions.split("x")[0]
            $this.Width = $Dimentions.split("x")[1]
            $this.Height = $Dimentions.split("x")[2]
            $this.SmallestPerimeter = $this.Length, $this.Width, $this.Height | `
                Sort-Object | Select-Object -First 2 | `
                ForEach-Object -Begin { $sp = 0 } -Process { $sp += 2 * $_ } -End { $sp }
            $this.BowLength = $this.Length * $this.Width * $this.Height
        }

        [int] RequiredRibbonLength() {
            return $this.SmallestPerimeter + $this.BowLength
        }
    }

    $Boxes = @()
    foreach ($Data in $InputData.Split("`r`n")) {
        $Boxes += New-Object Box $Data
    }

    return ($Boxes.RequiredRibbonLength() | Measure-Object -Sum).Sum
}

$Inputs = Get-Content -Path "$PSScriptRoot\Day2_Inputs.txt" -Raw

Get-Answer -InputData $Inputs