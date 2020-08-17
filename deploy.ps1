[CmdletBinding()]
param (
    [Parameter()]
    [String]
    $ESTemplateUrl = 'https://raw.githubusercontent.com/navgov-dev/arm-es-adventureworks/master/es-hubspoke.json',
    $location = "westeurope",
    $paramFileUrl = ".\es-hubspoke.parameters.json"
)
#autentiserer med MSI
import-module az.accounts
connect-azaccount -identity

#genererer unikt deployname
$deploymentname = "tenantDeployment" +(Get-Random)
#deployer fra github
New-AzTenantDeployment -Name $deploymentname -Location $location -TemplateUri $ESTemplateUrl -TemplateParameterFile $paramFileUrl

