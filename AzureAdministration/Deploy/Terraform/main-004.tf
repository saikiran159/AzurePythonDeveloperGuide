terraform { # terraform global settings
  required_providers { # configured azure provider here
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

provider "azurerm" { # sets authentication using azure cli
  features {}
}


resource "azurerm_container_registry" "acr-test" {
  name                     = "acr-test-registry-1"
  resource_group_name      = "tf-test-rg"
  location                 = "West US"
  sku                      = "Standard"
  admin_enabled            = false

    provisioner "local-exec" { # we are running this custom script where when ACR is being created
    when = destroy # this tell only run this command, when ACR is in being destroyed (terraform destroy)
    # here, self means resource type name. in this context this is ACR
    command = <<EOT
       az acr repository delete --name ${self.name} --image hello-world:latest --yes
    EOT
  }

}

#Import Container Image to Azure Container Registries
resource "null_resource" "image" { # resource type of null_resource is used when we dont want to deploy any resource instead just do some operation

  provisioner "local-exec" { # this is used to run a custom script. though this is not recommended
    command = <<-EOT
       az acr import --name ${azurerm_container_registry.acr-test.name} --source docker.io/library/hello-world:latest --image hello-world:latest
    EOT
  }
}