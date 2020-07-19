export HOME=/root
cd /tmp
apt-get update && apt-get install -y python ansible unzip
wget https://github.com/joaquimpedrooliveira/node-js-getting-started
cd /tmp/provisioning
"wp_db_ip=${db_instance_ip}"