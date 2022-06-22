## Sela week 6 starts with a bang, trying to recover and upgrade

#status :

backend connection to subnet


build modules, pretty names

missing bits: modules for vms
make another okta for staging
NSG


- 2 nics are orphaned on the frontend - solve - low priority
<!-- - connect to machines using ansible, provide a ping and a play. -->


- deploy the db
<!-- connect profit -->

https://learn.hashicorp.com/tutorials/terraform/sensitive-variables

check for connectivity
10.0.0.0/16 - network
10.0.20.5 - sysadmin 20.106.240.77
10.0.20.4 - mvm1
10.0.20.5 - mvm2
pub ip : 20.106.240.77

1, went into ~./ssh, got connected to sysadmin.

the load balancer - does it work
how it works -rules

postgresql - build

NSG- put in place and strenghten security
fix names, variables clean up tf code

ansible_terraform_azure

how to change variables on enviroment?
for instance var.machine 2 staging | 3 prod
or size = "Standard_b2s"

connect nsg to nic to vm

load balancer no health probes

# connect be nic to nsg

<!-- need to build a deploy-

production | staging -->

db to last oction
!! once db is built
connect be nic to nsg

output:
export password and user

take care that staging is smaller then production as in vm b1s + 2 vm's on stage

providers.tf {connect to azure}
main.tf { group + locals} // staging prod
network.tf { create vnet + subnets}
nsg { create security rules} -> need to connect to nic?
modules-vm
loadbalance -> ip + machines + nic mash it all up!



id_rsa.pub

