#! /bin/bash
# sudo pvcreate /dev/sdb
# sudo vgcreate cinder-volumes /dev/sdb
sudo apt update -y
sudo apt-get install net-tools -y
sudo apt install python3-dev libffi-dev gcc libssl-dev -y
sudo apt install python3-pip -y
sudo pip3 install -U pip
#sudo apt install ansible -y
sudo pip install -U 'ansible>=4,<6'
#sudo cp /vagrant/scripts/hosts /etc/hosts
sudo pip3 install git+https://opendev.org/openstack/kolla-ansible@master
sudo mkdir -p /etc/kolla
sudo chown $USER:$USER /etc/kolla
cp -r /usr/local/share/kolla-ansible/etc_examples/kolla/* /etc/kolla
cp /usr/local/share/kolla-ansible/ansible/inventory/* .
git clone --branch master https://opendev.org/openstack/kolla-ansible
sudo pip3 install ./kolla-ansible
sudo mkdir -p /etc/kolla
sudo chown $USER:$USER /etc/kolla
cp -r kolla-ansible/etc/kolla/* /etc/kolla
cp kolla-ansible/ansible/inventory/* .
kolla-ansible install-deps
sudo mkdir /etc/ansible
sudo cp ./scripts/ansible.cfg /etc/ansible/ansible.cfg
kolla-genpwd
sudo cp ./scripts/globals.yml /etc/kolla/globals.yml
