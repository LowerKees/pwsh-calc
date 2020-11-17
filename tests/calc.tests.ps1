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
    It "Should add to integers" -TestCases $TestCases {
        param($Calc)

        $Calc.Add(1,1) | Should -Be 2
    }
}

# Unit tests for subtraction go here

# Unit tests for multiplication go here

# Unit tests for division go here

# Unit test for squaring input go here

# Unit test for cubing input go here

