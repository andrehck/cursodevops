

#Provider 
provider "google" {
  credentials = "${file("devopsgc.json")}" //arquivo da chave exportada do gcp, esta no mesmo diretorio que o main.tf
  project = "devops-274120"
  region  = "us-central1"
  zone    = "us-central1-a"
}


resource "google_compute_instance" "ansible" {
  name         = "ansible"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
    provisioner "file" {
    source      = "authorized_keys"
    destination = "/.ssh/"
  }

  network_interface {
    # interface de rede padrão
    network       = "rededevops" // A rededevops já tinha sido criado na GCP 172.17.177.0/24
    network_ip = "172.17.177.49"
    subnetwork = "rededevops"
    access_config {
    }
  }
}
resource "google_compute_instance" "master" {
  name         = "master"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
   provisioner "file" {
    source      = "authorized_keys"
    destination = "/.ssh/"
  }

  network_interface {
    # interface de rede padrão
    network       = "rededevops"
    network_ip = "172.17.177.50"
    subnetwork = "rededevops"
    access_config {
    }
  }
}

resource "google_compute_instance" "node1" {
  name         = "node1"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  provisioner "file" {
    source      = "authorized_keys"
    destination = "/.ssh/"
  }
  network_interface {
    # interface de rede padrão
    network       = "rededevops"
    network_ip = "172.17.177.51"
    subnetwork = "rededevops"
    access_config {
    }
  }
}

resource "google_compute_instance" "node2" {
  name         = "node2"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  provisioner "file" {
    source      = "authorized_keys"
    destination = "/.ssh/"
  }
  network_interface {
    # interface de rede padrão
    network       = "rededevops"
    network_ip = "172.17.177.52"
    subnetwork = "rededevops"
    access_config {
    }
  }
}
