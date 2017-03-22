job "hashicorp" {
    type = "service"
    datacenters = ["yow_a"]

    update {
        stagger = "30s"
        max_parallel = 1
    }
    group "ui" {
        count = 1

        task "frontend" {
            driver = "docker"

            env {
                CONSUL_ENABLE = "1"
                NOMAD_ENABLE = "1"
                LOG_LEVEL = "debug"
                LISTEN_ADDRESS = "0.0.0.0:${NOMAD_PORT_web}"
            }
            
            config {
                image = "jippi/hashi-ui"
                network_mode = "host"
            }

            service {
                port = "web"

                check {
                     type = "http"
                     path = "/"
                     interval = "10s"
                     timeout = "2s"
                }
            }

            resources {
                network {
                    port "web" {}
                }
                memory = 256
            }
        }
    }
}