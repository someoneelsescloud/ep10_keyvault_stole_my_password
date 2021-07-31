param (
    
    [parameter(Mandatory = $true)]
    [string]$vaultName,
    [parameter(Mandatory = $true)]
    [string]$certificateName,
    [parameter(Mandatory = $true)]
    [string]$certSecret
)

# Set current folder path for new file export
$path = (Get-Location).Path

Write-Output "Retrieving the stored secret from Azure KeyVault.."
$securePassword = Get-AzKeyVaultSecret -VaultName $vaultName -Name $certSecret -AsPlainText

Write-Output "Retrieving the secret from Certficate in Azure KeyVault.."
$secret = Get-AzKeyVaultSecret -VaultName $vaultName -Name $certificateName -AsPlainText

Write-Output "Converting retrieved secret.."
$secretByte = [Convert]::FromBase64String($secret)

Write-Output "Creating PFX certifcate and setting new password with retrieved secret.."
$x509Cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2($secretByte, "", "Exportable,PersistKeySet")
$type = [System.Security.Cryptography.X509Certificates.X509ContentType]::Pfx
$pfxFileByte = $x509Cert.Export($type, $securePassword)
[System.IO.File]::WriteAllBytes("$path\export-$certificateName.pfx", $pfxFileByte)

