provider "azurerm" {
        features {}
}
resource "azurerm_resource_group" "rg" {
        name = "bdl_testTerraformResgroup"
        location = "westeurope"
}