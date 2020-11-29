class Calculator {

    <#
        .DESCRIPTION
        Returns the addition of two integers
    #>
    [int] Add([int]$x, [int]$y) {
        return $x + $y
    }

    <#
        .DESCRIPTION
        Returns the subtraction of two integers
    #>
    
    [int] Subtract([int]$x, [int]$y) {
        return $x - $y
    }

    <#
        .DESCRIPTION
        Returns the multiplication of two integers
    #>

    [int] Multiply([int]$x, [int]$y) {
        return $x * $y
    }

    <#
        .DESCRIPTION
        Returns the division of two integers
    #>

    [int] Divide([int]$x, [int]$y) {
        try {
            return $x / $y
        }
        catch {
            if ($_.Exception.Message -eq "Attempted to divide by zero.") {
                Write-Warning "You cannot divide by zero"
                throw
            }
            else {
                throw
            }
        }
    }

    <#
        .DESCRIPTION
        Returns the input squared
    #>

    [bigint] Power([int]$x) {
        return $x * $x
    }

    <#
        .DESCRIPTION
        Returns the input cubed
    #>

    [bigint] Cube([int]$x) {
        return $x * $x * $x
    }
}