##AKS Cluster setup
resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name = "aks-cluster"
    location = azurerm_resource_group.rg-aks.location
    resource_group_name = azurerm_resource_group.rg-aks.name
    dns_prefix = "aks-dns"

    default_node_pool {
      name = "default"
      node_count = 1
      vm_size = "Standard_DS2_v2"
      vnet_subnet_id = azurerm_subnet.aks_subnet.id

    }
    ##identity block
    identity {
        type = "SystemAssigned"
    }
    tags = {
        environment = "dev"
    }
}   

output kubeconfig {
    value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
    sensitive = true
}

