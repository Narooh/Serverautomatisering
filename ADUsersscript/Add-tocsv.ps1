Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$inputFilePath="\\TTADDS\TTHotels\temp\testemployees1.CSV"


#Variabler

$FormObject=[System.Windows.Forms.Form]
$LabelObject=[System.Windows.Forms.Label]
$ComboBoxObject=[System.Windows.Forms.ComboBox]
$ButtonObject=[System.Windows.Forms.Button]
$TextBox=[System.Windows.Forms.TextBox]


$AppForm=New-Object $FormObject
$AppForm.ClientSize='1000,600'
$AppForm.Text='Opret ny medarbejder'
$AppForm.BackColor='White'
$AppForm.Font='Verdana,10'


$cancelButton = New-Object $ButtonObject
$cancelButton.Location = New-Object System.Drawing.Point(500,550)
$cancelButton.Size = New-Object System.Drawing.Size(90,23)
$cancelButton.Text = 'Annuller'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$AppForm.CancelButton = $cancelButton
$AppForm.Controls.Add($cancelButton)

$okButton = New-Object $ButtonObject
$okButton.Location = New-Object System.Drawing.Point(400,550)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$AppForm.AcceptButton = $okButton
$AppForm.Controls.Add($okButton)



$label = New-Object $LabelObject
$label.Location = New-Object System.Drawing.Point(10,530)
$label.AutoSize=$true
$label.Text = ''


$lblusername=New-Object $LabelObject
$lblusername.Text='Brugernavn'
$lblusername.AutoSize=$true
$lblusername.Location=New-Object System.Drawing.Point(20,20)

$tbusername = New-Object $TextBox
$tbusername.Location = New-Object System.Drawing.Point(250,20)
$tbusername.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbusername)


$lblFullName=New-Object $LabelObject
$lblFullName.Text='Fulde Navn'
$lblFullName.AutoSize=$true
$lblFullName.Location=New-Object System.Drawing.Point(20,45)

$tbFullName = New-Object $TextBox
$tbFullName.Location = New-Object System.Drawing.Point(250,45)
$tbFullName.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbFullName)


$lblFirstName=New-Object $LabelObject
$lblFirstName.Text='Fornavn'
$lblFirstName.AutoSize=$true
$lblFirstName.Location=New-Object System.Drawing.Point(20,70)

$tbFirstName = New-Object $TextBox
$tbFirstName.Location = New-Object System.Drawing.Point(250,70)
$tbFirstName.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbFirstName)


$lblLastName=New-Object $LabelObject
$lblLastName.Text='Efternavn'
$lblLastName.AutoSize=$true
$lblLastName.Location=New-Object System.Drawing.Point(20,95)

$tbLastName = New-Object $TextBox
$tbLastName.Location = New-Object System.Drawing.Point(250,95)
$tbLastName.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbLastName)


$lblInitial=New-Object $LabelObject
$lblInitial.Text='Initialer'
$lblInitial.AutoSize=$true
$lblInitial.Location=New-Object System.Drawing.Point(20,120)

$tbInitial = New-Object $TextBox
$tbInitial.Location = New-Object System.Drawing.Point(250,120)
$tbInitial.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbInitial)


$lblEnabled=New-Object $LabelObject
$lblEnabled.Text='Aktiv'
$lblEnabled.AutoSize=$true
$lblEnabled.Location=New-Object System.Drawing.Point(20,145)

$tbEnabled = New-Object $TextBox
$tbEnabled.Location = New-Object System.Drawing.Point(250,145)
$tbEnabled.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbEnabled)


$lblDisplayName=New-Object $LabelObject
$lblDisplayName.Text='Vist Navn'
$lblDisplayName.AutoSize=$true
$lblDisplayName.Location=New-Object System.Drawing.Point(20,170)

$tbDisplayName = New-Object $TextBox
$tbDisplayName.Location = New-Object System.Drawing.Point(250,170)
$tbDisplayName.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbDisplayName)


$lblPath=New-Object $LabelObject
$lblPath.Text='Sti'
$lblPath.AutoSize=$true
$lblPath.Location=New-Object System.Drawing.Point(20,195)

$tbPath = New-Object $TextBox
$tbPath.Location = New-Object System.Drawing.Point(250,195)
$tbPath.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbPath)


$lblCity=New-Object $LabelObject
$lblCity.Text='By'
$lblCity.AutoSize=$true
$lblCity.Location=New-Object System.Drawing.Point(20,220)

$tbCity = New-Object $TextBox
$tbCity.Location = New-Object System.Drawing.Point(250,220)
$tbCity.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbCity)


$lblPostalCode=New-Object $LabelObject
$lblPostalCode.Text='Postnr.'
$lblPostalCode.AutoSize=$true
$lblPostalCode.Location=New-Object System.Drawing.Point(20,245)

$tbPostalCode = New-Object $TextBox
$tbPostalCode.Location = New-Object System.Drawing.Point(250,245)
$tbPostalCode.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbPostalCode)


$lblCountry=New-Object $LabelObject
$lblCountry.Text='Land'
$lblCountry.AutoSize=$true
$lblCountry.Location=New-Object System.Drawing.Point(20,270)

$tbCountry = New-Object $TextBox
$tbCountry.Location = New-Object System.Drawing.Point(250,270)
$tbCountry.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbCountry)


$lblCompany=New-Object $LabelObject
$lblCompany.Text='Firma'
$lblCompany.AutoSize=$true
$lblCompany.Location=New-Object System.Drawing.Point(20,295)

$tbCompany = New-Object $TextBox
$tbCompany.Location = New-Object System.Drawing.Point(250,295)
$tbCompany.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbCompany)


$lblState=New-Object $LabelObject
$lblState.Text='stat'
$lblState.AutoSize=$true
$lblState.Location=New-Object System.Drawing.Point(20,320)

$tbState = New-Object $TextBox
$tbState.Location = New-Object System.Drawing.Point(250,320)
$tbState.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbState)


$lblStreetAddress=New-Object $LabelObject
$lblStreetAddress.Text='Gadenavn + nr'
$lblStreetAddress.AutoSize=$true
$lblStreetAddress.Location=New-Object System.Drawing.Point(20,345)

$tbStreetAddress = New-Object $TextBox
$tbStreetAddress.Location = New-Object System.Drawing.Point(250,345)
$tbStreetAddress.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbStreetAddress)


$lblOffPhone=New-Object $LabelObject
$lblOffPhone.Text='Arbejdstelefon'
$lblOffPhone.AutoSize=$true
$lblOffPhone.Location=New-Object System.Drawing.Point(20,370)

$tbOffPhone = New-Object $TextBox
$tbOffPhone.Location = New-Object System.Drawing.Point(250,370)
$tbOffPhone.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbOffPhone)


$lblemail=New-Object $LabelObject
$lblemail.Text='Email'
$lblemail.AutoSize=$true
$lblemail.Location=New-Object System.Drawing.Point(20,395)

$tbemail = New-Object $TextBox
$tbemail.Location = New-Object System.Drawing.Point(250,395)
$tbemail.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbemail)


$lbltitle=New-Object $LabelObject
$lbltitle.Text='Titel'
$lbltitle.AutoSize=$true
$lbltitle.Location=New-Object System.Drawing.Point(20,420)

$tbTitle = New-Object $TextBox
$tbTitle.Location = New-Object System.Drawing.Point(250,420)
$tbTitle.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbTitle)


$lbldepartment=New-Object $LabelObject
$lbldepartment.Text='Afdeling'
$lbldepartment.AutoSize=$true
$lbldepartment.Location=New-Object System.Drawing.Point(20,445)

$tbdepartment = New-Object $TextBox
$tbdepartment.Location = New-Object System.Drawing.Point(250,445)
$tbdepartment.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbdepartment)


$lblPassword=New-Object $LabelObject
$lblPassword.Text='Adgangskode'
$lblPassword.AutoSize=$true
$lblPassword.Location=New-Object System.Drawing.Point(20,470)

$tbPassword = New-Object $TextBox
$tbPassword.Location = New-Object System.Drawing.Point(250,470)
$tbPassword.Size = New-Object System.Drawing.Size(260,20)
$AppForm.Controls.Add($tbPassword)


$AppForm.Topmost = $true
 
$AppForm.Add_Shown({$tbusername.Select(), $tbFullName.Select(), $tbFirstName.Select(), $tbLastName.Select(), $tbInitial.Select(), $tbEnabled.Select(), $tbDisplayName.Select(), $tbPath.Select(), $tbCity.Select(), $tbPostalCode.Select(), $tbPostalCode.Select(), $tbCountry.Select(), $tbCompany.Select(), $tbState.Select(), $tbStreetAddress.Select(), $tbOffPhone.Select(), $tbemail.Select(), $tbTitle.Select(), $tbdepartment.Select(), $tbPassword.Select()})

$AppForm.Controls.AddRange(@($lblusername, $lblFullName, $lblFirstName, $lblLastName, $lblInitial, $lblEnabled, $lblDisplayName, $lblPath, $lblCity, $lblPostalCode, $lblCountry, $lblCompany, $lblState, $lblStreetAddress, $lblOffPhone, $lblemail, $lbltitle, $lbldepartment, $lblPassword))


$result = $Appform.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{ 
    $headers = @(
        "FirstName", "Initials", "LastName", "Username", "Email",
        "StreetAddress", "City", "ZipCode", "State", "Country",
        "Department", "Password", "Telephone", "JobTitle", "Company", "Ou"
    )

    $values = @(
        $tbFirstName.Text,
        $tbInitial.Text,
        $tbLastName.Text,
        $tbusername.Text,
        $tbemail.Text,
        $tbStreetAddress.Text,
        $tbCity.Text,
        $tbPostalCode.Text,
        $tbState.Text,
        $tbCountry.Text,
        $tbdepartment.Text,
        $tbPassword.Text,
        $tbOffPhone.Text,
        $tbTitle.Text,
        $tbCompany.Text,
        $tbPath.Text
    )

    if (-not (Test-Path $inputFilePath)) {
        ($headers -join ';') | Out-File -FilePath $inputFilePath -Encoding UTF8
    }

    ($values -join ';') | Add-Content -Path $inputFilePath -Encoding UTF8
}
