$ResourceGroup = @{
    Name = "resource-group-name";
    Location = "westus";
}

New-AzResourceGroup -Name $ResourceGroup.Name -Location $ResourceGroup.Location -Force

$Template = @{
    FileName = '.\armdeploy.json';
    Parameters = @{
        servername = 'server-name';
        dbcount = 2;
        startip = 'start ip address';
        endip = 'end ip address';
    }
}

New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroup.Name -TemplateFile $Template.FileName -TemplateParameterObject $Template.Parameters