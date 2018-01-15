log_level = "INFO"

# Setup data dir
data_dir = "/opt/nomad/data/client"

# Enable the client
client {
    enabled = true

    servers = ["127.0.0.1:4647"]
}

ports {
    http = 5656
}
