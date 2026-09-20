# Day 02 Task: Install Terraform on Ubuntu

Follow the official Terraform installation guide:

[Install Terraform](https://developer.hashicorp.com/terraform/install)

## Install the Required Packages

```bash
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common
```

## Add the HashiCorp GPG Key

```bash
wget -O- https://apt.releases.hashicorp.com/gpg |
gpg --dearmor |
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

## Verify the GPG Key

```bash
gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint
```

## Add the HashiCorp Repository

```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com \
$(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" |
sudo tee /etc/apt/sources.list.d/hashicorp.list
```

## Install Terraform

```bash
sudo apt-get update
sudo apt-get install terraform
```

## Verify the Installation

```bash
terraform version
```

## Enable Terraform Autocomplete

```bash
terraform -install-autocomplete
```

Restart the terminal after enabling autocomplete.

## Create a Short Alias

```bash
alias tf=terraform
```

The alias above is available only for the current terminal session.

To keep the alias after restarting the terminal, add it to the `~/.bashrc` file:

```bash
echo 'alias tf=terraform' >> ~/.bashrc
source ~/.bashrc
```

## Verify the Alias

```bash
tf version
```
