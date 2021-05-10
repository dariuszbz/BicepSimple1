###
### run.ps1 is a devops emulator
###

### UNCOMMENT two lines below before first time run, and once sucesfull comment backagain. 
#az login
#az account set --subscription "xxxxx"

$variables = @{}
# # # Variables goes to azure devops
$variables.Add("ResourceGroupName"      ,   "BicepDeployment01")
$variables.Add("Location"               ,   "NorthEurope")
$variables.Add("DeploymentName"         ,   "BicepDeployment01")
$variables.Add("ContainerName"          ,   "myblobs33")
$variables.Add("SkuName"                ,   "Standard_LRS")
$variables.Add("SkuTire"                ,   "Standard")
$variables.Add("AccessTier"             ,   "Hot")
$variables.Add("StorageName"            ,   "bicepstoragezeroone")

$variables.Add("BicepFile"              ,   "./temp.bicep")               ### for devops it is: ./main.bicep


$file = Get-Content -Path "./deploy.ps1"

foreach ($d in $variables.GetEnumerator()) {
   # Write-Host "$($d.Name): $($d.Value)"

   $file = $file.Replace("__"+$d.Name+"__", $d.Value)
}

Remove-Item -Path "./temp.ps1"
Set-Content -Path "./temp.ps1" -Value $file -Force 

$file = Get-Content -Path "./main.bicep"
foreach ($d in $variables.GetEnumerator()) {
   # Write-Host "$($d.Name): $($d.Value)"

   $file = $file.Replace("__"+$d.Name+"__", $d.Value)
}

Remove-Item -Path "./temp.bicep"
Set-Content -Path "./temp.bicep" -Value $file -Force 

$script = $PSScriptRoot+"\temp.ps1"
& $script
