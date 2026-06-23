<#
Write-Host "Start Loop" -ForegroundColor Green

for($i; $i -le 10; $i++){
    Write-Host $i -ForegroundColor Yellow
}

Write-Host "End Loop" -ForegroundColor Red
#>

# -----------------------------------------------------------------

<#
Write-Host "Start Loop" -ForegroundColor Green

$Collection = 1..10

ForEach($item in $Collection){
    Write-Host "The value is: $item"
}

Write-Host "End Loop" -ForegroundColor Red
#>

# -----------------------------------------------------------------

<#
Write-Host "Start Loop" -ForegroundColor Green

ForEach ($service in (Get-Service | Select-Object -Last 5)){
    Write-Host Service name is: $service.name and status is $service.status
}

Write-Host "End Loop" -ForegroundColor Red
#>

# -----------------------------------------------------------------

<#
Write-Host "Start Loop" -ForegroundColor Green

$var = 1

while ($var -le 10 -and $var -ne 5)
{
    Write-Host The value of Var is: $var
    $var++
}

Write-Host "End Loop" -ForegroundColor Red
#>