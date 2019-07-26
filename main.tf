terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "popa-org"

    workspaces {
      name = "firewall-name"
    }
  }
}

data "terraform_remote_state" "server-name" {
  backend = "atlas"

  config = {
    name = "popa-org/server-name"
  }
}

output "firewall_server_name" {
  value       = "${data.terraform_remote_state.server-name.server_name}"
  description = "Consume server name from different repo"
}
