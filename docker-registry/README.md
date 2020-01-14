# Private Insecure Docker Registry
As the title suggests, this yaml will deploy a basic insecure docker registry for local use.
Convenient for quickly hosting and deploying custom docker images. Again, nothing that follows
is secure. It's all proof of concept/quick experimentation stuff. Also please note in order to
get k3s to use this docker registry you'll have to do a few things including configuring k3s to use
docker as its container library at install time. See https://rancher.com/docs/k3s/latest/en/installation/install-options/.
You may also need to use the --private-registry flag at install time. I should have taken better notes
at the time I figured this out but whomever goes through this after me please update this README
accordingly if I haven't done so by then.

To deploy: `kubectl create -f docker-registry.yaml`

In order for kubernetes to be able to pull images from this repository, you'll have to do the
following:

Update `/var/lib/rancher/k3s/agent/etc/containerd/config.toml` to include the following:

    [plugins.cri.registry.mirrors]
     
    [plugins.cri.registry.mirrors."nifi:5000"]
      endpoint = ["http://nifi:5000"]
      
    [plugins.cri.registry.configs."private.registry.com".auth]
      username = "*"
      password = "*"
      
If you want to use docker via the command line with this private registry:

Once the docker registry is running in order to be able to use it you will have to install
and start docker locally, then log into said registry.

Run the docker service locally: `sudo dockerd &> /dev/null &`

Log into your private docker repo: `docker login nifi:5000`

Both username and password on an unsecure docker repo is `*`