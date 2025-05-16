# Opgave 1
New-Item -Path C:\Users\krizo\ -Name "Serverautomatisering" -ItemType Directory

# Opgave 2
Get-Process

# Opgave 3
New-LocalUser -Name "Test" -AccountExpires 14-05-2025 

#Opgave 4
New-Item -Path C:\Users\krizo\Serverautomatisering\ -Name "Test" -ItemType Directory
New-Item -Path C:\Users\krizo\Serverautomatisering\ -Name "Backups" -ItemType Directory

$date = Get-Date -Format "ddMMyy_HHmm"
Copy-Item -Path C:\Users\krizo\Serverautomatisering\Test\ -Destination C:\Users\krizo\Serverautomatisering\Backups\Test_Backup$date -Recurse 

#Opgave 5
Get-NetAdapter

#Opgave 6
Set-ExecutionPolicy Unrestricted

#Opgave 7
Invoke-Command -ComputerName db.cbz.dk -ScriptBlock {Get-Process} # Kør en command på en anden pc
Enter-PSSession -ComputerName db.cbz.dk  # Login på en remote host

#Opgave 8
Get-AppPackage

#Opgave 9
Get-Error

#Opgave 10
Find-Module -Name powershell* #finder alle modules med parametret. 
Update-Module -WhatIf #hvad sker der hvis kommandoen bliver kørt uden "Whatif"

#Opgave 11
Get-Disk

#Opgave 12
Get-ADUser 

#Opgave 13
Get-WmiObject win32_computersystem
Get-WmiObject win32_PhysicalMemory

#Opgave 14
Se opgave 4?