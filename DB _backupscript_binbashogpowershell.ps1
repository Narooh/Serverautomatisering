#Dette er et script der kører et "mysqldump" altså en backup af hele "hoteldb" databasen og gemmer det i en shared mappe på domænet. Crontab automatiserer scriptet til at køre en gang hver dag kl 12:00

#!/bin/bash
mysqldump -u krilu@TTHotels.com -pKode1234! hoteldb > /run/user/1016601127/gvfs/smb-share:server=192.168.10.2,share=it/DB_Backup/HoteldbBU-$(date -d "today" + "%d%m%Y-%H%M").sql

if [ $? -eq 0 ]
then
    echo "Backup saved successfully." > /run/user/1016601127/gvfs/smb-share:server=192.168.10.2,share=it/DB_Backup_log/Log.log
else 
    echo "Backup failed. $(tail /var/log/cron)" > /run/user/1016601127/gvfs/smb-share:server=192.168.10.2,share=it/DB_Backup_log/Log.log

fi

#gem ovenstående som fil på db serveren, lav crontab -e og indsæt følgende:
0 12 * * * /bin/sh /home/krilu@TTHotels.com/cron/bu.sh

#Her er mit første forsøg på et script - dette kan køres som et PowershellScript, men den skal autoriseres med et ssh-password hver eneste gang scriptet kører, så det kan ikke automatiseres pt. 
ssh -l krilu@tthotels.com 192.168.10.3 "mysqldump -u krilu@TTHotels.com -pKode1234! hoteldb > /run/user/1016601127/gvfs/smb-share:server=192.168.10.2,share=it/DB_Backup/HoteldbBU-$(date -d "today" + "%d%m%Y-%H%M").sql"
