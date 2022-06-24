# ansible_Terraform_azure

Sela week 6 Terraform ansible

load balance public ip:
prod public ip: 20.124.177.159
frontend subnets : 10.0.20.4 | 10.0.20.5 | 10.0.20.6

Staging public ip: 20.124.5.101
http://20.124.5.101:8080/
frontend subnets : 10.0.20.4 | 10.0.20.5

this week assignment is to create a terraform project and deploy a simple web app to a public ip address
during the week we will be using the following resources:

in order to work with this project we will need you to install the following:
production.tfvars + staging.tfvars file with the following:

<pre>
TF_VAR_admin_username = ""
TF_VAR_admin_password = ""
TF_VAR_db_username = ""
TF_VAR_db_password = ""
TF_VAR_size=""
TF_VAR_machines=
</pre>

production staging
TF_VAR_machines=3 | TF_VAR_machines= 2

once begun do az login and then do the following:
transfer the following files to the terraform providers.tf

<pre>
terraform {
backend "azurerm" {
resource_group_name = ""
storage_account_name = ""
container_name = ""
key = ""
access_key = ""
}
}


provider "azurerm" {
features {}
subscription_id = ""
client_id = ""
client_secret = ""
tenant_id = ""
}

</pre>

then to run the terraform plan command to each it's own enviroment:

tfgo \  
-var-file="production.tfvars"

tfgo \  
-var-file="staging.tfvars"

## Requirements

No requirements.

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | 3.10.0  |

## Modules

| Name                                                        | Source             | Version |
| ----------------------------------------------------------- | ------------------ | ------- |
| <a name="module_postgres"></a> [postgres](#module_postgres) | ./modules/postgres | n/a     |
| <a name="module_vm_front"></a> [vm_front](#module_vm_front) | ./modules/frontend | n/a     |

## Resources

| Name                                                                                                                                                                                                                | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_lb.azurerm_lb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb)                                                                                                         | resource |
| [azurerm_lb_backend_address_pool.lb_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool)                                                                  | resource |
| [azurerm_lb_nat_rule.nat_rule_ssh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_rule)                                                                                     | resource |
| [azurerm_lb_outbound_rule.outbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_outbound_rule)                                                                               | resource |
| [azurerm_lb_probe.lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe)                                                                                               | resource |
| [azurerm_lb_rule.web](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule)                                                                                                      | resource |
| [azurerm_linux_virtual_machine.sysadmin_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine)                                                                  | resource |
| [azurerm_network_interface.nics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)                                                                                 | resource |
| [azurerm_network_interface.sys_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)                                                                              | resource |
| [azurerm_network_interface.sysadmin_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)                                                                         | resource |
| [azurerm_network_interface_backend_address_pool_association.fe_nics_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface_security_group_association.nics_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association)                       | resource |
| [azurerm_network_security_group.frontend_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group)                                                               | resource |
| [azurerm_public_ip.ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)                                                                                                   | resource |
| [azurerm_public_ip.sysadmin_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)                                                                                          | resource |
| [azurerm_resource_group.weight-app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)                                                                                 | resource |
| [azurerm_subnet.backend_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)                                                                                             | resource |
| [azurerm_subnet.frontend_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)                                                                                            | resource |
| [azurerm_subnet.sysadmin_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)                                                                                            | resource |
| [azurerm_subnet_network_security_group_association.frontend_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association)                      | resource |
| [azurerm_virtual_network.weight_app_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)                                                                       | resource |

## Inputs

| Name                                                                                                                                 | Description                                                                                             | Type     | Default                                       | Required |
| ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------- | -------- | --------------------------------------------- | :------: |
| <a name="input_TF_VAR_admin_password"></a> [TF_VAR_admin_password](#input_TF_VAR_admin_password)                                     | n/a                                                                                                     | `string` | `""`                                          |    no    |
| <a name="input_TF_VAR_admin_username"></a> [TF_VAR_admin_username](#input_TF_VAR_admin_username)                                     | hidden data managed by last pass: azure sela week6                                                      | `string` | `""`                                          |    no    |
| <a name="input_TF_VAR_db_password"></a> [TF_VAR_db_password](#input_TF_VAR_db_password)                                              | n/a                                                                                                     | `string` | `""`                                          |    no    |
| <a name="input_TF_VAR_db_username"></a> [TF_VAR_db_username](#input_TF_VAR_db_username)                                              | n/a                                                                                                     | `string` | `""`                                          |    no    |
| <a name="input_TF_VAR_machines"></a> [TF_VAR_machines](#input_TF_VAR_machines)                                                       | n/a                                                                                                     | `string` | `""`                                          |    no    |
| <a name="input_TF_VAR_size"></a> [TF_VAR_size](#input_TF_VAR_size)                                                                   | n/a                                                                                                     | `string` | `""`                                          |    no    |
| <a name="input_command_nic_ip_configuration_name"></a> [command_nic_ip_configuration_name](#input_command_nic_ip_configuration_name) | connection to vm sysadmin                                                                               | `string` | `"sysadmin_ip_con"`                           |    no    |
| <a name="input_group"></a> [group](#input_group)                                                                                     | n/a                                                                                                     | `string` | `"weight-app"`                                |    no    |
| <a name="input_location"></a> [location](#input_location)                                                                            | n/a                                                                                                     | `string` | `"East Us"`                                   |    no    |
| <a name="input_name"></a> [name](#input_name)                                                                                        | n/a                                                                                                     | `string` | `"weight_app"`                                |    no    |
| <a name="input_pool_name"></a> [pool_name](#input_pool_name)                                                                         | load balance flexible data                                                                              | `string` | `"webapp_nic"`                                |    no    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                                                                                  | n/a                                                                                                     | `string` | `"weight_app"`                                |    no    |
| <a name="input_rg_name"></a> [rg_name](#input_rg_name)                                                                               | n/a                                                                                                     | `string` | `"azurerm_resource_group.weight-app.name"`    |    no    |
| <a name="input_rgn"></a> [rgn](#input_rgn)                                                                                           | n/a                                                                                                     | `string` | `"azurerm_resource_group.weight-app.name"`    |    no    |
| <a name="input_size"></a> [size](#input_size)                                                                                        | magic numbers for staging and production: variable machines { type = number default = 2 # staging = 2 } | `string` | `"Standard_b1s"`                              |    no    |
| <a name="input_sysadmin_ip"></a> [sysadmin_ip](#input_sysadmin_ip)                                                                   | n/a                                                                                                     | `string` | `"sysadmin_ip"`                               |    no    |
| <a name="input_sysadmin_machine"></a> [sysadmin_machine](#input_sysadmin_machine)                                                    | n/a                                                                                                     | `string` | `"vm"`                                        |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                                        | n/a                                                                                                     | `map`    | <pre>{<br> "project": "weight-app"<br>}</pre> |    no    |

## Outputs

| Name                                                                          | Description |
| ----------------------------------------------------------------------------- | ----------- |
| <a name="output_admin_password"></a> [admin_password](#output_admin_password) | n/a         |
| <a name="output_app_public_ip"></a> [app_public_ip](#output_app_public_ip)    | n/a         |
