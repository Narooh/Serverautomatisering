Enter-PSSession -ComputerName TTADDS
Import-Module ActiveDirectory

$logFile="\\TTADDS\TTHotels\IT\ADUsers_log\runlog.log"
$ADUsers = Import-Csv "\\TTADDS\TTHotels\temp\testemployees1.CSV" -Delimiter ";"
$UPN = "TTHotels.com"

foreach ($User in $ADUsers) {
    try {
        
        $UserParams = @{
            SamAccountName      = $User.username
            UserprincipalName   = "$($User.username)@$UPN"
            Name                = "$($User.firstname) $($User.lastname)"
            GivenName           = $User.firstname
            Surname             = $User.lastname
            Initial             = $User.initials
            Enabled             = $true
            DisplayName         = "$($User.firstname) $($User.lastname)"
            Path                = $User.ou
            City                = $User.city 
            PostalCode          = $User.zipcode
            Country             = $User.country
            Company             = $User.company 
            State               = $User.state 
            StreetAddress       = $User.streetaddress 
            OfficePhone         = $User.telephone
            EmailAddress        = $User.email 
            Title               = $User.jobtitle
            Department          = $User.department 
            AccountPassword     = (ConvertTo-SecureString $User.password -AsPlainText -Force)
            ChangePasswordAtLogon = $true
        }

        if (Get-ADUser -Filter "SamAccountName -eq '$($User.username)'") {
            Write-Host "A user with username $($User.username) already exists in Active Directory." -ForegroundColor Yellow
            #Add-Content -Value "$(Get-Date) | A user with username $($User.username) already exists in Active Directory." -Path $logFile
        }
        else {
            New-ADUser @UserParams 
            Write-Host "The user $($User.username) is created." -ForegroundColor Green
            Add-Content -Value "$(Get-Date) | The user $($User.username) is created." -Path $logFile
        }
    }
    catch {
        Write-Host "Failed to create user $($User.username) - $_" -ForegroundColor Red
        Add-Content -Value "$(Get-Date) | Failed to create user $($User.username) - $_" -Path $logFile
    }    
}

Exit-PSSession
