log_level = "INFO"

data_dir = "/opt/nomad/data/server"

server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 1
}

consul {
    address = "127.0.0.1:8500"
}
