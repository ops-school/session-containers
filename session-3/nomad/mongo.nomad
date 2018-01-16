job "mongodb" {
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
      size = 300
    }
    task "mongo" {
      driver = "docker"
      config {
        image = "mongo"
        port_map {
          db = 27017
        }
      }
      resources {
        cpu    = 200
        memory = 128
        network {
          mbits = 10
          port "db" {
          static = "27017"
          }
        }
      }
      service {
        name = "global-mongo-check"
        tags = ["global", "databases"]
        port = "db"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
