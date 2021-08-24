#cloud-config
# package_upgrade: true
packages:
- nfs-utils
- httpd
runcmd:
# Add efs mount to fstab using the efs dns name - will remount on reboot
- echo "${file-system-id}.efs.${aws-region}.amazonaws.com:/    /var/www/html/efs-mount-point   nfs4    defaults" >> /etc/fstab
- mkdir /var/www/html/efs-mount-point
# Mounting with the efs mount ip as the dns name does not resolve fast enough: https://forums.aws.amazon.com/thread.jspa?messageID=903517
- mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${fs-ip}:/ /var/www/html/efs-mount-point
- touch /var/www/html/efs-mount-point/test.html
- service httpd start
- chkconfig httpd on
