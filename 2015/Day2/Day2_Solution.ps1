# https://adventofcode.com/2015/day/2

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
        [int] $SmallestSide
        [int] $SurfaceArea
    
        Box([string] $Dimentions) {
            $this.Length = $Dimentions.split("x")[0]
            $this.Width = $Dimentions.split("x")[1]
            $this.Height = $Dimentions.split("x")[2]
            $this.SmallestSide = 1
            $this.Length, $this.Width, $this.Height | Sort-Object | Select-Object -First 2 | ForEach-Object { $this.SmallestSide *= $_ }
            $this.SurfaceArea = (2 * $this.Length * $this.Width) + (2 * $this.Width * $this.Height) + (2 * $this.Height * $this.Length) + $this.SmallestSide
        }
    
    }

    $Boxes = @()
    foreach ($Data in $InputData.Split("`r`n")) {
        $Boxes += New-Object Box $Data
    }
    
    return ($Boxes.SurfaceArea | Measure-Object -Sum).Sum
}

$Inputs = Get-Content -Path "$PSScriptRoot\Day2_Inputs.txt" -Raw

Get-Answer -InputData $Inputs