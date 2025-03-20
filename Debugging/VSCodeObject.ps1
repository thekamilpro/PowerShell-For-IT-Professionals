function Get-Stock {
    param(
        [int]$Initial = 10,
        [int]$Returned = 3,
        [int]$Sold = 12
    )
    
    $current = $Initial
    Write-Result -Result $current
    $current = Measure-Return -Current $current -Returned $Returned
    Write-Result -Result $current
    $current = Measure-Sold -Current $current -Sold $Sold
    Write-Result -Result $current

    $output = [PSCustomObject]@{
        Stock = [PSCustomObject]@{
            Initial = $Initial
            Current = $current
        }
        Returned = $Returned
        Sold = $Sold
    }

    return $output
}

function Measure-Return {
    param(
        [int]$Current,
        [int]$Returned
    )
    
    $result = $Current + $Returned
    return $result
}

function Measure-Sold {
    param(
        [int]$Current,
        [int]$Sold
    )
    
    $result = $Current - $Sold
    return $result
}

function Write-Result {
    param(
        [int]$Result
    )
    
    Write-Host "Current stock: $Result"
}

Get-Stock