$rg = "RG-CosmoDB"
$webapp = "polycosmosrcs2"
az webapp deployment source config-zip --src dist.zip -n $webapp -g $rg
