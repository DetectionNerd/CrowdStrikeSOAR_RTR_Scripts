manage-bde -status

$ErrorActionPreference = "SilentlyContinue"

manage-bde -protectors -delete C:
$NewPassword = manage-bde -protectors -add C: -recoverypassword
$NewPassword | ForEach-Object { if ($_ -match "Password:\s+(.*)") { Write-Host "New BitLocker Recovery Password: $($matches[1])" } }


manage-bde -protectors -enable C:

manage-bde -forcerecovery C:

$ExcludedLocalAccounts = @(
    'DefaultAccount',
    'Guest',
    'WDAGUtilityAccount'
)


#startLOGOFF_USERS
#-------------------------------------------------------------------------------

# Log off all current user sessions

# Get logon sessions from the "quser.exe" command.
$Sessions = [System.Collections.Generic.List[PSCustomObject]]::new()
$QUser = quser 2>$null | Select-Object -Skip 1
$QUser | ForEach-Object { 
    $Result = $_ -match '.(.{22})(.{18})(.{5})(.{8})(.{11})(.{16,18})' 

    $Session = [pscustomobject] @{
        Username = $matches[1].trim()
        SessionName = $matches[2].trim()
        Id = [int]$matches[3].trim()
        State = $matches[4].trim()
        IdleTime = $matches[5].trim()
        LogonTime = [datetime]$matches[6].trim()
    }
	$Sessions.Add($Session)
    $Session = $null
}
$Result = $null
$QUser = $null

# Log off all sessions
ForEach ($Session in $Sessions) {
    logoff $Session.Id
}
$Sessions = $null

#-------------------------------------------------------------------------------
#endLOGOFF_USERS


#startDISABLE_CACHED_CREDENTIALS
#-------------------------------------------------------------------------------

# Disable cached credentials.
try {
    if ((Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name CachedLogonsCount | Select-Object -ExpandProperty CachedLogonsCount) -ne 0) {
        Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name CachedLogonsCount -Value 0
    }
    Write-Warning -Message 'This change requires a reboot to take effect! Please reboot the computer when it is appropriate to do so.'
}
catch {
    Write-Warning -Message 'Unable to disable cached credentials.'
}

#-------------------------------------------------------------------------------
#endDISABLE_CACHED_CREDENTIALS


#startCHANGE_LOCAL_PASSWORDS
#-------------------------------------------------------------------------------

# Change local account passwords.

function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=''
    return [String]$characters[$random]
}

function Scramble-String([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}

Get-LocalUser | Where-Object {$ExcludedLocalAccounts -notcontains $_.Name} | ForEach-Object {
    $Password = $null
    
    try {
        try{
            add-type -AssemblyName System.Web
            [system.web.security.membership]
            $Password = [system.web.security.membership]::generatepassword(20,4)
        }
        catch{
            Write-Error -Message 'Unable to load system.web assembly'
            # generate 4 numbers which add up to 16
            Do{
                $total = 0
                $numberofcharactersperitem  = Get-Random -minimum 4 -maximum 10 -count 4
                $numberofcharactersperitem | ForEach-Object {$total += $_}
            } Until ($total -ge 20)

           $password = Get-RandomCharacters -length $numberofcharactersperitem[0] -characters 'abcdefghijklmnopqrstuvwxyz'
           $password = $password + (Get-RandomCharacters -length $numberofcharactersperitem[1] -characters 'ABCDEFGHKLMNOPRSTUVWXYZ')
           $password = $password + (Get-RandomCharacters -length $numberofcharactersperitem[2] -characters '1234567890')
           $password = $password + (Get-RandomCharacters -length $numberofcharactersperitem[3] -characters "~!@#$%^&*_-+=`|\(){}[]:;`"'<>,.?/'")

           $password = Scramble-String($password)
        }
        Write-Host "Changed password for $($_.Name): $Password"
        $_ | Set-LocalUser -Password $Password -ErrorAction Stop
    }
    catch {
        Write-Warning -Message "Unable to change the password for $($_.Name)."
    }
}

#-------------------------------------------------------------------------------
#endCHANGE_LOCAL_PASSWORDS


#CLEAR_KERBEROS_TICKETS
#-------------------------------------------------------------------------------

# Make best effort to clear all Kerberos tickets. Runs as a separate job because this process occasionally hangs.
try {
    Start-Job -ScriptBlock {
            Get-CimInstance -ClassName 'Win32_LogonSession' -ErrorAction Stop | Where-Object {$_.AuthenticationPackage -ne 'NTLM'} | ForEach-Object {
                Start-Process klist.exe purge -li ([Convert]::ToString($_.LogonId, 16)) 
            }
        }
}
catch {
    Write-Warning -Message 'There was an exception when attempting to clear Kerberos tickets.'
}

[System.Console]::Out.Flush()
Start-Sleep -Seconds 120
Restart-Computer -Force
