#! /bin/bash

source openstack-env/bin/activate

kolla-genpwd

#below commands will take time based on the resources allocated to the VM in Vagrantfile
kolla-ansible -i all-in-one bootstrap-servers -vvvv
echo "Bootstrap Completed!!!"
sleep 10

kolla-ansible -i all-in-one prechecks -vvvv
echo "Pre-Checks Completed!!!"
sleep 10

kolla-ansible -i all-in-one deploy -vvvv
echo "Deployment Completed!!!"
sleep 10

kolla-ansible -i all-in-one post-deploy -vvvv
echo "Post-Deployment Completed!!!"
sleep 10

sudo chown vagrant:vagrant /etc/kolla/admin-openrc.sh 
. /etc/kolla/admin-openrc.sh
. openstack-env/share/kolla-ansible/init-runonce
echo "OpenStack ready to use!!!"