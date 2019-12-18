# nifi-k8s
This is a really basic, quick and dirty nifi k8s deployment yaml and is very much a work in progress.

This assumes the following:
    - There is a persistent volume provisioner installed in k8s
    - There is an ingress controller installed in k8s

Known Issues:
    - Using a local-path persistent volume forces any nifi running to use the same directory for state. This means running > 1 NiFi will be a problem. The intent is to use Rook long term for persistence.

These are the steps I followed to set this up:

    1. Install k3s since it bundles all of the necessary pieces to run Kubernetes, such as a container runtime (containerd) and ingress controller (traefik)
        1a. 
    2. 