output "machine_hostname" {
  value = module.vm_and_disk_creation.machine_hostname
}

output "fqdn" {
  value = module.nic_and_pip_setup.fqdn
}

output "hdb_ip" {
  value = module.nic_and_pip_setup.pip_ip
}

