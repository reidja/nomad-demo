job "hellohostname" {
	type = "service"
	datacenters = ["dc1"]

	update {
		stagger = "30s"
		max_parallel = 1
	}

	group "web" {
		count = 1

		task "frontend" {
			driver = "docker"
			
			config {
				image = "oliverkra/hello-hostname"
			}

			service {
				port = "http"

				check {
					 type = "http"
					 path = "/"
					 interval = "10s"
					 timeout = "2s"
				}
			}

			resources {
				cpu = 500
				memory = 128

				network {
					port "http" {}
				}
			}
		}
	}
}