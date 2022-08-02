
data "template_file" "startup_script" {
  template = <<-EOF
  sudo apt-get update -y
  sudo apt-get install -y tinyproxy
  echo "Allow localhost"| tee -a /etc/tinyproxy/tinyproxy.conf
  systemctl restart tinyproxy
  EOF
}


resource "google_compute_instance" "bastion" {
  name         = "slave"
  machine_type = "e2-medium"
  zone         = "us-west2-a"
  tags         = ["slave"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network    = module.network.vpc_name
    subnetwork = module.network.public_subnet_name
    access_config {}
  }

  metadata_startup_script = data.template_file.startup_script.rendered
}