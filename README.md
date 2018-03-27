# Create an environment variable for the correct distribution
```export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"```

# Add the Cloud SDK distribution URI as a package source
```echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list```

# Import the Google Cloud Platform public key
```curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -```

# Update the package list and install the Cloud SDK
```sudo apt-get update && sudo apt-get install google-cloud-sdk```

# Install Terraform
```wget https://releases.hashicorp.com/terraform/0.11.4/terraform_0.11.4_linux_amd64.zip```
### unzip to /usr/bin

# gcloud init
```
gcloud init
```

# Download creddentials.json/account.json from SeviceAccount from gcloud and
```
export GOOGLE_CREDENTIALS=$(cat account.json)
```

### Install packer and terraform for your OS
### Change settings for packer and terraform
### Create test image by packer
### Create `pfsense` image like [Whis](https://blog.kylemanna.com/cloud/pfsense-on-google-cloud/)

