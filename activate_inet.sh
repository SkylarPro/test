for user in `ls /home` ; do
if [ $user != "lost+found" ]; then
user_name=$user
fi
backup_dir=/home/$user_name/.backup

cp  $backup_dir/network /etc/sysconfig/network
cp $backup_dir/resolv.conf /etc/

for config in `ls /etc/sysconfig/network-scripts/ifcfg-*` ; do
if [ $config != "/etc/sysconfig/network-scripts/ifcfg-lo" ]; then
ifcfg_file=$config
fi
done
cp  $backup_dir/$ifcfg_file /etc/sysconfig/network-scripts

sed -i "s/NETWORKING=.*/NETWORKING=yes/" /etc/sysconfig/network

