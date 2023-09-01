param(
    [String] $prefix
)

Write-Host "Swapping to green"

az network lb rule update --lb-name "lb-$prefix" `
    --name "http-rule" `
    --resource-group "rg-loadbalancer-$prefix" `
    --backend-pool-name "green-pool"
