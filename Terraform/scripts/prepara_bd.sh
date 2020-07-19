export HOME=/root
cd /tmp
apt-get update && apt-get install -y python ansible unzip
wget https://ansible-config-joaquim.s3.amazonaws.com/ansible/provisioning.zip
unzip provisioning.zip -d provisioning
cd /tmp/provisioning
ansible-playbook -i hosts_db provisioning.yml --extra-vars "wp_app_ip=%"
