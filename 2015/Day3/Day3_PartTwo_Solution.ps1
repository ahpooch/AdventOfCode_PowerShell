# link: https://adventofcode.com/2015/day/3
# meta: {year:2015,day:3,part:2,name:"Perfectly Spherical Houses in a Vacuum",state:solved}

function Get-Answer {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $InputData
    )

    class OneHorseOpenSleigh {
        [int] $x = 0
        [int] $y = 0
        [hashtable[]] $Visited

        OneHorseOpenSleigh () {
            $this.Visited += @{x = 0; y = 0 }
        }

        [void] Move([String] $Direction) {
            switch ($Direction) {
                '^' { $this.y += 1 }
                'v' { $this.y -= 1 }
                '>' { $this.x += 1 }
                '<' { $this.x -= 1 }
            }

            $this.Visited += @{ x = $this.x; y = $this.y }
        }
    }

    $SantaSleigh = New-Object OneHorseOpenSleigh
    $RoboSantaSleigh = New-Object OneHorseOpenSleigh

    $isRoboSantaTurn = $false

    foreach ($Move in [char[]] $InputData) {
        if (-not $isRoboSantaTurn) {
            $SantaSleigh.Move($Move)
            $isRoboSantaTurn = $true
        } else {
            $RoboSantaSleigh.Move($Move)
            $isRoboSantaTurn = $false
        }
    }

    $VisitedInTotal = ($SantaSleigh.Visited | Select-Object -Unique x,y) + ($RoboSantaSleigh.Visited | Select-Object -Unique x,y)
    return ($VisitedInTotal | Select-Object -Unique x,y).Count
}

$Inputs = Get-Content -Path "$PSScriptRoot\Day3_Inputs.txt" -Raw

Get-Answer -InputData $Inputs