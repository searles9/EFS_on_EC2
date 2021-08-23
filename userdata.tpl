#cloud-config
package_upgrade: true
packages:
- nfs-utils
- httpd
runcmd:
- sleep 1m
- echo "$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).${file-system-id}.efs.${aws-region}.amazonaws.com:/    /var/www/html/efs-mount-point   nfs4    defaults" >> /etc/fstab
- mkdir /var/www/html/efs-mount-point
- mount -a
- touch /var/www/html/efs-mount-point/test.html
- service httpd start
- chkconfig httpd on