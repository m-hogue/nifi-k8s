# nifi-k8s
This is a really basic, quick and dirty nifi k8s deployment yaml and is very much a work in progress.

## Setup
This guide assumes the following:
    - There is a persistent volume provisioner that supports the storage class "local-path" installed in k8s
    - There is an ingress controller installed in k8s

### Known Issues:
    - Using a local-path persistent volume forces any nifi running to use the same directory for state. This means running > 1 NiFi will be a problem. The intent is to use Rook long term for persistence. To get it working for now, just using local path provisioning.

These are the steps I followed to set this up:

1. Install k3s since it bundles all of the necessary pieces to run Kubernetes, such as a container runtime (containerd) and ingress controller (traefik)
2. Install Rancher's local-path-provisioner and deploy in k3s
3. deploy the nifi.yaml in this repo

    a. kubectl create -f ./nifi-k8s/nifi.yaml  
    b. By default, traefik routes everything via port 80 and 443 for http and https, respectively. Nifi's ingress config specifies the host as `nifi`, so the URL to access the NiFi UI will be `http://nifi:80/nifi`


### Extras:
1. By default, the traefik's dashboard isn't enabled in k3s. You can enable it be adding `dashboard.enabled: "true"` to the file `/var/lib/rancher/k3s/server/manifests/traefik.yaml`. 

    a. k3s will automatically redeploy traefik with the updated configuration. You can watch this happen via `watch kubectl get pods --all-namespaces`  
    b. You can find where the dashboard is running via `kubectl get endpoints -n kube-system`