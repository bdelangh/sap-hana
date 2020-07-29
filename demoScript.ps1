
az login

cd config

$tfdir="../deploy/terraform"

terraform init $tfdir

terraform plan --var-file=singleHANA.json $tfdir

terraform apply --var-file=singleHANARepo.json  --auto-approve $tfdir

terraform destroy --var-file=singleHANARepo.json --auto-approve $tfdir

ansible-playbook -i hosts.yml ~/sap-hana/deploy/ansible/sap_playbook.yml