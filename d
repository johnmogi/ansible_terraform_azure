│ 
╵
╷
│ Error: creating Network Interface: (Name "frontserver1" / Resource Group "staging_weight_app_rg"): network.InterfacesClient#CreateOrUpdate: Failure sending request: StatusCode=400 -- Original Error: Code="InvalidResourceName" Message="Resource name /subscriptions/f0de5eae-71b0-412c-9a68-49f436648228/resourceGroups/staging_weight_app_rg/providers/Microsoft.Network/publicIPAddresses/ip is invalid. The name can be up to 80 characters long. It must begin with a word character, and it must end with a word character or with '_'. The name may contain word characters or '.', '-', '_'." Details=[]
│ 
│   with azurerm_network_interface.nics[1],
│   on 2_network.tf line 40, in resource "azurerm_network_interface" "nics":
│   40: resource "azurerm_network_interface" "nics" {
│ 
╵
╷
│ Error: creating Network Interface: (Name "frontserver0" / Resource Group "staging_weight_app_rg"): network.InterfacesClient#CreateOrUpdate: Failure sending request: StatusCode=400 -- Original Error: Code="InvalidResourceName" Message="Resource name /subscriptions/f0de5eae-71b0-412c-9a68-49f436648228/resourceGroups/staging_weight_app_rg/providers/Microsoft.Network/publicIPAddresses/ip is invalid. The name can be up to 80 characters long. It must begin with a word character, and it must end with a word character or with '_'. The name may contain word characters or '.', '-', '_'." Details=[]
│ 
│   with azurerm_network_interface.nics[0],
│   on 2_network.tf line 40, in resource "azurerm_network_interface" "nics":
│   40: resource "azurerm_network_interface" "nics" {

│ Error: creating Network Interface: (Name "frontserver1" / Resource Group "staging_weight_app_rg"): network.InterfacesClient#CreateOrUpdate: Failure sending request: StatusCode=400 -- Original Error: Code="InvalidResourceName" Message="Resource name /subscriptions/f0de5eae-71b0-412c-9a68-49f436648228/resourceGroups/staging_weight_app_rg/providers/Microsoft.Network/publicIPAddresses/ip is invalid. The name can be up to 80 characters long. It must begin with a word character, and it must end with a word character or with '_'. The name may contain word characters or '.', '-', '_'." Details=[]

╷
│ Error: deleting Public Ip Address: (Name "public_ip" / Resource Group "staging_weight_app_rg"): network.PublicIPAddressesClient#Delete: Failure sending request: StatusCode=400 -- Original Error: Code="PublicIPAddressCannotBeDeleted" Message="Public IP address /subscriptions/f0de5eae-71b0-412c-9a68-49f436648228/resourceGroups/staging_weight_app_rg/providers/Microsoft.Network/publicIPAddresses/public_ip can not be deleted since it is still allocated to resource /subscriptions/f0de5eae-71b0-412c-9a68-49f436648228/resourceGroups/staging_weight_app_rg/providers/Microsoft.Network/loadBalancers/loadBalancer/frontendIPConfigurations/PublicIPAddress. In order to delete the public IP, disassociate/detach the Public IP address from the resource.  To learn how to do this, see aka.ms/deletepublicip." Details=[]
│ 
│ 