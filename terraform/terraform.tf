variable "do_token" {}
variable "cloudflare_email" {}
variable "cloudflare_token" {}


provider "digitalocean" {
  token = var.do_token
}

provider "cloudflare" {
  version = "~> 1.0"
  email = var.cloudflare_email
  token = var.cloudflare_token
}


data "digitalocean_ssh_key" "ondrejsika" {
  name = "ondrejsika"
}


resource "digitalocean_droplet" "prod" {
  image  = "debian-10-x64"
  name   = "ansible-example-prod"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika.id
  ]

  connection {
    user = "root"
    type = "ssh"
    host = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install python3 python3-pip"
    ]
  }
}

resource "cloudflare_record" "prod" {
  domain = "sikademo.com"
  name   = "prod.ansible-example"
  value  = digitalocean_droplet.prod.ipv4_address
  type   = "A"
  proxied = false
}


resource "digitalocean_droplet" "dev" {
  image  = "debian-10-x64"
  name   = "ansible-example-dev"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.ondrejsika.id
  ]

  connection {
    user = "root"
    type = "ssh"
    host = self.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install python3 python3-pip"
    ]
  }
}

resource "cloudflare_record" "dev" {
  domain = "sikademo.com"
  name   = "dev.ansible-example"
  value  = digitalocean_droplet.dev.ipv4_address
  type   = "A"
  proxied = false
}
