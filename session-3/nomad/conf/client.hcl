log_level = "INFO"

# Setup data dir
data_dir = "/opt/nomad/data/client"

# Enable the client
client {
    enabled = true

    servers = ["server:4647"]
}

ports {
    http = 5656
}

consul {
    address = "127.0.0.1:8500"
}

