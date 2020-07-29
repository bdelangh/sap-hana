
az login

cd config

$tfdir="../deploy/terraform"

terraform init $tfdir

terraform plan --var-file=singleHANARepo.json $tfdir

terraform apply --var-file=singleHANARepo.json  --auto-approve $tfdir

terraform destroy --var-file=singleHANARepo.json --auto-approve $tfdir

-------------------
ssh into rti to run ansible-playbook
ssh azureadm@{outputIP}

ansible-playbook -i hosts.yml ~/sap-hana/deploy/ansible/sap_playbook.yml

-------------------
After completion: ssh into HANA DB
ssh bdelangh@10.97.1.10 (check host for internal ip address)
sudo su - hn1adm
HDB info

-------------------
Compare HA
ConfigFile : haHANARepo.json
terraform plan --var-file=haHANARepo.json $tfdir

(Note: terrafrom state file is needed from singleHANA)


