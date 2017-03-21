#!/bin/bash

reset_server() {
	vagrant ssh $1 -c "sudo coreos-cloudinit --from-file /var/lib/coreos-vagrant/vagrantfile-user-data"
	vagrant ssh $1 -c "sudo systemctl stop consulserver"
	vagrant ssh $1 -c "sudo systemctl stop nomadserver"
	vagrant ssh $1 -c "docker volume rm consulserver -f"
	vagrant ssh $1 -c "docker volume rm nomadserver -f"
	vagrant ssh $1 -c "sudo systemctl restart consulserver"
	vagrant ssh $1 -c "sudo systemctl restart nomadserver"
}

reset_client() {
	vagrant ssh $1 -c "sudo coreos-cloudinit --from-file /var/lib/coreos-vagrant/vagrantfile-user-data"
	vagrant ssh $1 -c "sudo systemctl stop consulclient"
	vagrant ssh $1 -c "sudo systemctl stop nomadclient"
	vagrant ssh $1 -c "docker volume rm nomadclient -f"
	vagrant ssh $1 -c "docker volume rm consulclient -f"
	vagrant ssh $1 -c "sudo systemctl restart consulclient"
	vagrant ssh $1 -c "sudo systemctl restart nomadclient"
}

vagrant provision
reset_server server01
reset_server server02
reset_server server03
reset_client client01
reset_client client02
reset_client client03