param storageAccountName string = '__StorageName__'
param containerName string = '__ContainerName__'
param location string = resourceGroup().location

resource sa 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: '__SkuName__'
    tier: '__SkuTire__'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: '__AccessTier__'
    supportsHttpsTrafficOnly: false
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${sa.name}/default/${containerName}'
}
