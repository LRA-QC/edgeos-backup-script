# edgeos-backup-script
this that let you backup any number of EdgeOS devices (Ubiquiti)

# Configuration

You will want to make sure that you configure the user, the list of devices and the destination path of the backup before using this script.
- configure the EDGEUSER variable
- configure the EDGEOS variable, all your devices should be enclosed by '
- configure the PT variable, it's the destination of the backup
- configure the DAYS variable for the retention of your backup (in days)
# PRE-REQUISITES
- configure SSH authentication keys and test before using this script
- zip and unzip (or use other tools if you want)

# RESULTS
The configuration will be backed up to a zip file in the path of your choice. After 365 days, the backups will be purged. Backup files are very small.
In the zip file you will find a configuration file for each device : config.boot-<ip_or_name_of_device>
