# list all rules
az network lb rule list --lb-name "lb-lb03" `
    --resource-group "rg-loadbalancer-lb03"

# delete green rule
az network lb rule delete --lb-name "lb-lb03" `
    --name "http-rule-green" `
    --resource-group "rg-loadbalancer-lb03"


# update rule to point to green pool
az network lb rule update --lb-name "lb-lb03" `
    --name "http-rule-blue" `
    --resource-group "rg-loadbalancer-lb03" `
    --backend-pool-name "green-pool"

# update rule to point to blue pool
az network lb rule update --lb-name "lb-lb03" `
    --name "http-rule-blue" `
    --resource-group "rg-loadbalancer-lb03" `
    --backend-pool-name "blue-pool"
