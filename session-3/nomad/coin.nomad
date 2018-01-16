job "coin" {
  datacenters = ["dc1"]
  type = "service"
  update {
    max_parallel = 1
    min_healthy_time = "10s"
    healthy_deadline = "3m"
    auto_revert = false
    canary = 0
  }
  group "greatapp" {
    count = 1
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }
    ephemeral_disk {
      size = 120
    }
    task "coin" {
      driver = "docker"
      config {
        image = "relmos/coin"
      }
      resources {
        cpu    = 150
        memory = 100
        network {
          mbits = 10
      }
      }
    }
  }
}
