# EP10: Azure KeyVault Stole My Password!
In this episode, I talk about how Azure Key Vault handles SSL certificates and show you how to export your PFX certificate and set the password again.
This will definitely save you time, if you plan on automating certificate management!

**You can now show your appreciation and support the channel****: https://www.buymeacoffee.com/some1elsescloud

- **Watch the Full Episode on YouTube**: https://youtu.be/yuM0O5ejbiw
- **Download Someone Else's Cloud Wallpapers!** Add some vibrant colours and positive energy to your Work from Home environment to keep you amped! ✌️ https://www.someoneelsescloud.com/episodes/download-desktop-wallpapers
- **Check out the blog on the website**: https://www.someoneelsescloud.com/episodes/ep10-azure-keyvault-stole-my-password

## Scripts

See [ep4_azure_lab_terraform/scripts](https://github.com/someoneelsescloud/ep4_azure_lab_terraform/tree/master/scripts) for the following scripts to get started:

|Name|Description|
|---|---|
|.\scripts\Create-TFServicePrincipal|Create Service Principal for Terraform (refactored to use Az module and created providers.tf for AzureRM provider authentication)|
|.\scripts\Install-Terraform|Downloading and configure Terraform open source|
|.\scripts\ExportKVpfx|Export PFX certficate from Azure KeyVault and Set the Password with a retrieved secret |
|.\scripts\CreateKVAccess|This will create an Azure KeyVault Policy in Terraform. Uses PowerShell to get your logged in ObjectID|

## KeyVault Deployment
The code examples will allow you to use Terraform and deploy the resources for this episode.

```
# Create a Self-Signed SSL Certifcate (PFX format)
> openssl req -x509 -newkey rsa:4096 -sha256 -keyout someonesdemo.key -out someonesdemo.crt -subj "/CN=someonesdemo" -days 600
> openssl pkcs12 -export -name "someonesdemo" -out someonesdemo.pfx -inkey someonesdemo.key -in someonesdemo.crt
```

Source: [Create Self-Signed Certificates Using OpenSSL on Windows](https://improveandrepeat.com/2019/03/create-self-signed-certificates-using-openssl-on-windows/)

Document References:
- [Hashicorp - Terraform: Get Started - Azure](https://learn.hashicorp.com/collections/terraform/azure-get-started)
- [Export certificates from Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/certificates/how-to-export-certificate?tabs=azure-cli)

### Listen to the Audio Only version:
|Podcast|URL|
|---|---|
|Google Podcasts| https://cutt.ly/ogvwqTl|
|Apple Podcasts| https://cutt.ly/YgvweNk| 
|Spotify Podcasts| https://cutt.ly/igvwezs|
|Stitcher Radio| https://cutt.ly/ugvwewo|
|Tunein Radio| https://cutt.ly/Xgvwwpf|

YouTube Channel: https://youtube.com/c/someoneelsescloud
Visit the website for more information: www.someoneelsescloud.com
See all links to all platforms here: https://www.someoneelsescloud.com/links
