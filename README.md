# nomad-demo

## Requirements

* Vagrant

## Consul UI

Once you have run vagrant up you can access the consul UI:

```
http://localhost:8500/ui
```

## Useful commands

```
# list consul members
consul members
# list nomad servers
nomad server-members 
# list nomad clients
nomad node-status
```

## Running the hello world job

```
vagrant ssh server01
nomad run /vagrant/jobs/hellohostname.nomad
```


### Checking the status of the job

```
nomad status hellohostname
```

This will list the jobs

### Updating the job while its running

Make changes to `hellohostname.nomad`

```
nomad run /vagrant/jobs/hellohostname
```


### Checking the output from the logs

Find the allocation you are intested in using `nomad status hellohostname`.

Select the allocation you are interested in.

Run the following to view logging output:

```
nomad logs <alloc-id>
```


### Stopping the job

```
nomad stop hellohostname
```

## Running the hashi UI

![stuff](http://i.imgur.com/uTAfVJR.png)

You can run the hashi-ui (this is provided as a nomad job). This will provide a nice web gui interface into nomad and consul.

```
nomad run /vagrant/jobs/hashi-ui.nomad
```

You can locate the IP and port the service is running on:

```
nomad status hashicorp
nomad alloc-status <alloc-id>
```

The ip and port will be listed in the output, copy that into your browser and it should work even outside of the VM.
