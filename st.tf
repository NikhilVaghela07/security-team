provider "aws"{
  region = "us-east-1"
}

data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = "kenilith"

    workspace = {
      name = "network-team"
    }
  }
}


output "network_public_ips" {
  description = "Network team IPs list featched"
  value = data.terraform_remote_state.network.outputs.public
}
