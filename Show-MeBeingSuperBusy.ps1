Function Show-MeBeingSuperBusy {
    [CmdletBinding()]
    Param (
        [Parameter()]
        [ValidateRange(1,10)]
        [int]$ConsoleCount = 1
    )
    
    Begin {
        $Argument = 
			'-NoProfile -Command & {1..50 | ForEach-Object {Get-PSDrive}}',
            '-NoProfile -Command & {1..50 | ForEach-Object {Get-Process}}',
			'-NoProfile -Command & {1..50 | ForEach-Object {Get-Process}}',
            '-NoProfile -Command & {1..50 | ForEach-Object {Get-Service}}',
            '-NoProfile -Command & {1..50 | ForEach-Object {Get-Item -Path env:\}}'
    } # End Begin.
    
    Process {
        For ($i = 1; $i -le $ConsoleCount; $i++) {
            Start-Process -FilePath powershell.exe -ArgumentList ($Argument | Get-Random)
        } # End For.
    } # End Process.
    
    End {
    } # End End.
} # End Function: Show-MeBeingSuperBusy.

Show-MeBeingSuperBusy -ConsoleCount 4