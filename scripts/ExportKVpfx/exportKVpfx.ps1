param (
    
    [parameter(Mandatory = $true)]
    [string]$vaultName,
    [parameter(Mandatory = $true)]
    [string]$certificateName,
    [parameter(Mandatory = $true)]
    [string]$certSecret
)

$path = (Get-Location).Path
$securePassword = Get-AzKeyVaultSecret -VaultName $vaultName -Name $certSecret -AsPlainText
$secret = Get-AzKeyVaultSecret -VaultName $vaultName -Name $certificateName -AsPlainText
$secretByte = [Convert]::FromBase64String($secret)
$x509Cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($secretByte, "", "Exportable,PersistKeySet")
$type = [System.Security.Cryptography.X509Certificates.X509ContentType]::Pfx
$pfxFileByte = $x509Cert.Export($type, $securePassword)
[System.IO.File]::WriteAllBytes("$path\$certificateName.pfx", $pfxFileByte)

Write-Output "$securePassword"
