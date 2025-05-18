Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

 
$scriptRoot=\\entdom.local\EOP\TEMP\KRILU\Printerprojekt

 
$inputFilePath="$scriptRoot\Liste.csv"
$outputFilePath="scriptRoot\names-output.csv"
$names=Import-Csv -Path $inputFilePath

 

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Tilføj printere til IP install'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

 

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

 

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

 

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Hvad skal printeren hedde?:'
$form.Controls.Add($label)

 

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,65)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Hvad er IP Adressen på printeren?:'
$form.Controls.Add($label)

 

$tbName = New-Object System.Windows.Forms.TextBox
$tbName.Location = New-Object System.Drawing.Point(10,40)
$tbName.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($tbName)

 

$tbIP = New-Object System.Windows.Forms.TextBox
$tbIP.Location = New-Object System.Drawing.Point(10,80)
$tbIP.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($tbIP)

 

$form.Topmost = $true

$form.Add_Shown({$tbName.Select(),$tbIP.Select()})
$result = $form.ShowDialog()

 

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{ 

        $newRow = New-Object PsObject -Property @{ Name = $tbName.text ; IP = $tbIP.text }

        Export-Csv $inputFilePath -InputObject $newRow -Append -Force

}