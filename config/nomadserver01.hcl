region = "yow"
datacenter = "yow_a"

data_dir = "/nomad"
bind_addr = "172.17.8.101"
leave_on_interrupt = true
leave_on_terminate = true

server {
	enabled = true
	bootstrap_expect = 3
}

advertise {
	http = "172.17.8.101:4646"
	rpc = "172.17.8.101:4647"
	serf = "172.17.8.101:4648"
}

addresses {
    http = "0.0.0.0"
    rpc = "0.0.0.0"
    serf = "0.0.0.0"
}