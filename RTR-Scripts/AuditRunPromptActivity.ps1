Get-ChildItem "Registry::HKEY_USERS" | 
    ForEach-Object {
        $SID = $_.PSChildName
        $RunMRUPath = "Registry::HKEY_USERS\$SID\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
        
        if (Test-Path $RunMRUPath) {
            # Try to get username from SID
            try {
                $UserName = (New-Object System.Security.Principal.SecurityIdentifier($SID)).Translate([System.Security.Principal.NTAccount]).Value
            }
            catch {
                $UserName = $SID  # Keep SID if translation fails
            }
            
            $RunMRUValues = Get-ItemProperty -Path $RunMRUPath
            $RunMRUValues.PSObject.Properties | 
                Where-Object { $_.Name -match '^[a-z]$' } | 
                ForEach-Object { Write-Output "$UserName : $($_.Name): $($_.Value)" }
        }
    }
