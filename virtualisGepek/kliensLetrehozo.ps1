$username = "rendszergazda"
$Password = Read-Host "Adja meg a kliensgep jelszavat: " -AsSecureString
$cred = New-Object System.Management.Automation.PSCredential($username, $Password)

$location = "switzerlandnorth"
$rg = "szerver_rg"
$VMName = "debianKliens"
$size = "Standard_B2s"
$publisher = "Debian"
$offer     = "debian-12"
$sku       = "12-gen2"  
$version   = "latest"

$VnetName = "halozat"
$NICName = "halozatiKartyaKliens"
$SubnetName = "alhalozat"
#$SubnetCidr = "10.0.0.0/24"
#$VnetCidr = "10.0.0.0/16"
$NSGName    = "halozatiBiztCsopKliens"
$PipName = "publikusIpCimKliens"



#new-azResourceGroup -Location $location -Name $rg

$pip = New-AzPublicIpAddress -Name $PipName -ResourceGroupName $rg -Location $location -AllocationMethod Static -Sku Standard

#$vnet = New-AzVirtualNetwork -Name $VnetName -ResourceGroupName $rg -Location $location `
#        -AddressPrefix $VnetCidr
#$vnet = Add-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $vnet -AddressPrefix $SubnetCidr
#$vnet = Set-AzVirtualNetwork -VirtualNetwork $vnet
$vnet   = Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $rg
$subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $SubnetName
$subnetId = $subnet.Id

$nsg = New-AzNetworkSecurityGroup -Name $NSGName -ResourceGroupName $rg -Location $location
$Param1 = @{
  Name                     = 'SSHengedelyezes'
  NetworkSecurityGroup     = $nsg
  Protocol                 = 'TCP'
  Direction                = 'Inbound'
  Priority                 = 200
  SourceAddressPrefix      = '*'
  SourcePortRange          = '*'
  DestinationAddressPrefix = '*'
  DestinationPortRange     = 22
  Access                   = 'Allow'
}
Add-AzNetworkSecurityRuleConfig @Param1 | Set-AzNetworkSecurityGroup | Out-Null
$Param2 = @{
  Name                     = 'RDPengedelyezese'
  NetworkSecurityGroup     = $nsg
  Protocol                 = 'TCP'
  Direction                = 'Inbound'
  Priority                 = 100
  SourceAddressPrefix      = '*'
  SourcePortRange          = '*'
  DestinationAddressPrefix = '*'
  DestinationPortRange     = 3389
  Access                   = 'Allow'
}
Add-AzNetworkSecurityRuleConfig @Param2 | Set-AzNetworkSecurityGroup | Out-Null

$nic = New-AzNetworkInterface -Name $NICName -ResourceGroupName $rg -Location $location  -SubnetId $subnetId -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id

$vm = New-AzVMConfig -VMName $vmName -VMSize $size |
  Set-AzVMOperatingSystem -Linux -ComputerName $vmName -Credential $cred |
  Set-AzVMSourceImage -PublisherName $publisher -Offer $offer -Skus $sku -Version $version |
  Set-AzVMOSDisk -CreateOption FromImage -Name "$vmName-osdisk" -StorageAccountType Standard_LRS |  Add-AzVMNetworkInterface -Id $nic.Id

New-AzVM -ResourceGroupName $rg -Location $location -VM $vm -Verbose















