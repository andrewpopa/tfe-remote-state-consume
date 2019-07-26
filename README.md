# tfe-remote-state-consume
Consume resources from remote state from different repository

# use case
You consume resources which were created in different repository (for example by different team)

This would be your second repo which - consume random pet name for you infrastructure create in first [repo](https://github.com/andrewpopa/tfe-remote-state).

# Pre-requisites

- install [git](https://git-scm.com/downloads)
- install [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [TFE](https://www.terraform.io/docs/enterprise/index.html)

## clone repository to use it
```
git clone git@github.com:andrewpopa/tfe-remote-state-consume.git
cd tfe-remote-state-consume
```

## usage

- you need to configure access token in TFE which has to be in your `.terraformrc`
- keep in mind you have same TF version localy/TFE
- [create](https://www.terraform.io/docs/enterprise/workspaces/index.html) separate workspace for you repo in TFE
- [link](https://www.terraform.io/docs/enterprise/vcs/index.html) your repo in github with tfe workspace 

```
terraform init
terraform plan
terraform apply
```

## result example
```bash
$ terraform apply
data.terraform_remote_state.server-name: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

firewall_server_name = moving-urchin
```

## where
`moving-urchin` is name of the resource created in [first](https://github.com/andrewpopa/tfe-remote-state) repo

## destroy created infrastructure
```
terraform destroy
```