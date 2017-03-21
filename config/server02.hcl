data_dir = "/nomad"
bind_addr = "0.0.0.0"
leave_on_interrupt = true
leave_on_terminate = true

server {
	enabled = true
	bootstrap_expect = 3
}

advertise {
	http = "172.17.8.102:4646"
	rpc = "172.17.8.102:4647"
	serf = "172.17.8.102:4648"
}