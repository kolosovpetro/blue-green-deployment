param(
    [String] $prefix
)

Write-Host "Swapping to blue"

az network lb rule update --lb-name "lb-$prefix" `
    --name "http-rule" `
    --resource-group "rg-loadbalancer-$prefix" `
    --backend-pool-name "blue-pool"
