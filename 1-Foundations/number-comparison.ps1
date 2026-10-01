<#Clear-Host

[int]$num = Read-Host "Pick a number between 1 and 20"

if($num -gt 10){
    Write-Host "$num is greater than 10" -ForegroundColor Green
}
else{
    Write-Host "$num is NOT greater than 10" -ForegroundColor Red
}
#>
Clear-Host

[int]$num = Read-Host "Pick a number between 1 and 20"

if($num -eq 10){
   Write-Host "$num is EQUAL to 10" -ForegroundColor Yellow
}
elseif($num -gt 20){
    Write-Host "$num is NOT a number between 1-20" -ForegroundColor White -BackgroundColor Red
}
elseif($num -gt 10){
    Write-Host "$num is greater than 10" -ForegroundColor Green
}
else{
    Write-Host "$num is NOT greater than 10" -ForegroundColor Red
}