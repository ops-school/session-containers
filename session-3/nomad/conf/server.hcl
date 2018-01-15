log_level = "INFO"

data_dir = "/opt/nomaf/data/server"

server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 1
}
