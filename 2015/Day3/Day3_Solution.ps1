# https://adventofcode.com/2015/day/3

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
    foreach ($Move in [char[]] $InputData) {
        $SantaSleigh.Move($Move)
    }

    return ($SantaSleigh.Visited | Select-Object -Unique x,y).Count
}

$Inputs = Get-Content -Path "$PSScriptRoot\Day3_Inputs.txt" -Raw

Get-Answer -InputData $Inputs