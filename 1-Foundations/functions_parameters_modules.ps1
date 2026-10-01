<# Step 1: Retrieve porcesses where the CPU field value is greater than 100. Sort this retrieved list in descending ordser by CPU

Get-Process | Where-Object {$_.CPU -gt 100} | Sort-Object CPU -Descending

#>

#-------------------------------------------------------------------------------------------------

<# Step 2: Take the script above and write it as a Function
function Get-HighCPUProcess {
    Get-Process |
        Where-Object {$_.CPU -gt 100} |
            Sort-Object CPU -Descending
}

#Call the function
Get-HighCPUProcess

#>

#-------------------------------------------------------------------------------------------------

<# Step 3: Examine Function Scope
function Test-Scope {
    # Make the variable global (NOT BEST PRACTISE
    # $global:InternalValue = "Inside function"

    $InternalValue = "Inside function"
}

#Call the function
Test-Scope

# Print the variable (NOT AVAILABLE OUTSIDE FUNCTION)
# $InternalValue

#>

#-------------------------------------------------------------------------------------------------

<#Step 4: Adding parameters to the function
function Get-HighCPUProcess {
    param(
        [int]$CPUThreshold
    )

    Get-Process |
        Where-Object {$_.CPU -gt $CPUThreshold} |
            Sort-Object CPU -Descending
}

#Call the function with a parameter of CPUThershold=500
Get-HighCPUProcess -CPUThreshold 500

#>

#-------------------------------------------------------------------------------------------------

<#Step 5: Adding a parameter with a default value
function Get-HighCPUProcess {
    param(
        [int]$CPUThreshold = 100
    )

    Get-Process |
        Where-Object {$_.CPU -gt $CPUThreshold} |
            Sort-Object CPU -Descending
}

#Call the function with a parameter of CPUThershold=500
Get-HighCPUProcess -CPUThreshold 500

#>


#-------------------------------------------------------------------------------------------------

<#Step 6: Switch parameters: Allows to add functionality in-promptu
function Get-HighCPUProcess {
    param(
        [int]$CPUThreshold = 100,
        [switch]$Detailed
    )

    $results = Get-Process |
        Where-Object {$_.CPU -gt $CPUThreshold} |
        Sort-Object CPU -Descending

    if ($Detailed) {
        $results
    }
    else {
        $results | Select-Objet Name,CPU
    }
}

# Call the function:
Get-HighCPUProcess

Get-HighCPUProcess -Detailed

#>

#-------------------------------------------------------------------------------------------------

#Step 7: Bonus Example
function Get-FailedLogons{
    param(
        [int]$Count = 10
    )

    Get-WinEvent -FilterHashtable @{
        LogName = 'Security'
        Id = 4625
    }-MaxEvents $Count |
    Select-Object TimeCreated, Id, Message

}

Get-FailedLogons
