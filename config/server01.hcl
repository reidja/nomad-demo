data_dir = "/etc/nomad.d"

server {
	enabled = true
	bootstrap_expect = 3
}

advertise {
	http = "172.17.8.101:4646"
	rpc = "172.17.8.101:4647"
	serf = "172.17.8.101:4648"
}