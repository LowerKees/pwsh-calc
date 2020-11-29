Import-Module Pester -MinimumVersion 5.0.0

. $PSScriptRoot\..\calc\calc.ps1

$TestCases = @{
    Calc = [Calculator]::new();
}

Describe "The class Calculator and its properties" {
    It "Should be instantiated without errors" -TestCases $TestCases {
        param($Calc)

        $Calc | Should -BeOfType [Calculator]
    }
}
Describe "The addition function of the calculator" {
    It "Should add two integers" -TestCases $TestCases {
        param($Calc)

        $Calc.Add(1,1) | Should -Be 2
    }
}

Describe "The subtraction function of the calculator" {
    It "Should subtract two integers" -TestCases $TestCases {
        param($Calc)

        $Calc.Subtract(10, 5) | Should -Be 5
    }

    It "Should throw when non integer data types are used" -TestCases $TestCases {
        param($Calc)

        { $Calc.Subtract('string', 'string2') } | Should -Throw
        { $Calc.Subtract(10, 'string2') } | Should -Throw
        { $Calc.Subtract('string', 10) } | Should -Throw
    }
}

Describe "The multiplication function of the calculator" {
    It "Should multiply two integers" -TestCases $TestCases {
        param($Calc)

        $Calc.Multiply(10, 5) | Should -Be 50
    }
}

Describe "The division function of the calculator" {
    It "Should divide two integers" -TestCases $TestCases {
        param($Calc)

        $Calc.Divide(10, 5) | Should -Be 2
    }
}

Describe "The squaring function of the calculator" {
    It "Should return the second power of the input" -TestCases $TestCases {
        param($Calc)

        $Calc.Power(10) | Should -Be 100
    }
}

Describe "The cubing function of the calculator" {
    It "Should return the third power of the input" -TestCases $TestCases {
        param($Calc)

        $Calc.Cube(10) | Should -Be 1000
    }
}

