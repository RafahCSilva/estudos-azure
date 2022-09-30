az login

$rg = "MyWebAppLinuxRG"
$webapp = "mywebapplinux-1073213396"
az webapp deployment source config-zip --src mvc.zip -n $webapp -g $rg
