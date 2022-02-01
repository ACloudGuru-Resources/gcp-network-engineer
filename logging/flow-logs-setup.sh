gcloud compute networks create custom-network --subnet-mode=custom

gcloud compute networks subnets create subnet-a --network=custom-network --region=us-central1 --range=10.0.1.0/24

gcloud compute instances create web-server --zone=us-central1-a --machine-type=f1-micro --subnet=subnet-a --metadata=startup-script=sudo\ apt-get\ update$'\n'sudo\ apt-get\ install\ apache2\ -y$'\n'echo\ \'\<\!doctype\ html\>\<html\>\<body\>\<h1\>Hello\ Linux\ Academy\!\</h1\>\</body\>\</html\>\'\ \|\ sudo\ tee\ /var/www/html/index.html --tags=http-server

gcloud compute firewall-rules create custom-network-allow-http --direction=INGRESS --priority=1000 --network=custom-network --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

export CLOUD_SHELL_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

clear

echo Setup complete. Your Cloud Shell external IP is 
echo --------------
echo $CLOUD_SHELL_IP
echo --------------
echo Write it down for later.