Import-Module ActiveDirectory

$ADUsers = Import-Csv "C:\Users\krizo\Serverautomatisering\testemployees1.CSV" -Delimiter ";"
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
            PostalCode          = $Uder.zipcode
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
            Write-Host "A user with username $($User.username) already exists in Active Directory." -ForegroundColor Pink
        }
        else {
            New-ADUser @UserParams 
            Write-Host "The user $($User.username) is created." -ForegroundColor Green
        }
    }
    catch {
        Write-Host "Failed to create user $($User.username) - $_" -ForegroundColor Red
    }    
}
