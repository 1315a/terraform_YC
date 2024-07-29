terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.124.0"
    }
  }
}
provider "yandex" {
  token              = "token"
  cloud_id           = "b1g9vusveogt695qogeo"
  folder_id          = "b1g7e2calur4muojnnmv"
  zone               = "ru-central1-d"
}

resource "yandex_compute_instance" "vm" {
  name        = "test2"
  platform_id = "standard-v3"

  resources {
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vmcue7aajpmeo39kk" //ubuntu-2004-lts
      size     = 33
    }
  }

  network_interface {
    subnet_id = "fl87t36qv5u0h81cntot"
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/user/test/cloud-config.txt")}" 
  }
}
