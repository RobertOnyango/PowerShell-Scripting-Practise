## Script that investigates the name of the Parent process of a particular process

## Clear the terminal screen
Clear-Host
# Prompt the user to input the name of the process and store in name variable
$name = Read-Host -Prompt "Name the process you wish to find it's parent"

# Retrieve the process information of the user inputted process
$PPID = Get-CimInstance -ClassName Win32_Process -Filter "Name = '$name'"

# Retrieve the Parent Process PID.
$output = $PPID[0].ParentProcessId

# Output the process ID on the terminal
Write-Host $output -BackgroundColor White -ForegroundColor Black

# Get the parent process details
$parent_process = Get-CimInstance -ClassName Win32_Process -Filter "ProcessId=$output"

# Print on screen
Write-Host $parent_process


# -------------------------------------------------------------------------
# BETTER SOLUTION WITH ERROR CHECKING

<# 
Clear-Host

$name = Read-Host -Prompt "Name the process you wish to find it's parent"

$process = Get-CimInstance -ClassName Win32_Process -Filter "Name = '$name'"

if($process) {
    $output = $Process.ParentProcessId
    Write-Host $output -BackgroundColor White -ForegroundColor Black
}
else {
    Write-Host "Process not found"
}

# Get the parent process details
$parent_process = Get-CimInstance -ClassName Win32_Process -Filter "ProcessId=$output"

# Print on screen
Write-Host $parent_process

#>
