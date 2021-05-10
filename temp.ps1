
$bicepFile              =   "./temp.bicep" 


$rg                     =   "BicepDeployment01"
$location               =   "NorthEurope"
$deploymentName         =   "BicepDeployment01"



$dateSufix = get-date -Format "ddMMyy"
$timeSufix = get-date -Format "HHmm"
$deploymentName = $deploymentName+"-"+$dateSufix+"-"+$timeSufix
az group create `
        --name          $rg `
        --location      $location

az deployment group create `
                    --name                  $deploymentName `
                    --resource-group        $rg `
                    --template-file         $bicepFile
