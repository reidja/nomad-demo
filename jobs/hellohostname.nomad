job "hellohostname" {
	type = "service"
	datacenters = ["yow_a"]

	update {
		stagger = "30s"
		max_parallel = 1
	}
	group "web" {
		count = 1

		task "frontend" {
			driver = "docker"
			
			config {
				image = "reidja/nomad-hellohostname"
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
				cpu = 100
				memory = 128

				network {
					port "web" {}
				}
			}
		}
	}
}