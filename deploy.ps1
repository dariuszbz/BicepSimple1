
$bicepFile              =   "__BicepFile__" 


$rg                     =   "__ResourceGroupName__"
$location               =   "__Location__"
$deploymentName         =   "__DeploymentName__"



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