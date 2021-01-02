#!/bin/sh
#
# backup script by Luc Raymond (https://lucraymond.net) 
#
# this script rely on using SSH authentication keys
#
# EDGEOS USER TO USE
EDGEUSER=ubnt
# LIST OF EDGEOS DEVICES TO CONNECT
EDGEOS=('192.168.2.1' '192.168.2.10')
# DESTINATION
PT=/mnt/raid_data/partage/backup/edgeos

DT=$(date -u +"%Y%m%d")
echo "- Fetching config"
for HOST in ${EDGEOS[@]}; do
        /usr/bin/scp ${EDGEUSER}@${HOST}:/config/config.boot ${PT}/config.boot-${HOST}
done
echo "- Compressing"
/usr/bin/zip -9 ${PT}/backup-router-${DT}.zip ${PT}/config.boot*
echo "- flushing temp files"
\rm ${PT}/config.boot* 
SIZE=$(ls -sh ${PT}/backup-router-${DT}.zip|awk '{print $1}')
echo "- Backup validation: size [${SIZE}]"
unzip -l ${PT}/backup-router-${DT}.zip
echo "- Keeping only the last 365 days of backups"
/usr/bin/find /mnt/raid_data/partage/backup/edgeos/ -mtime +365 -delete
