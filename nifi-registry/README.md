# NiFi Registry
Basic YAML to stand up a NiFi Registry within your K8S cluster in the default namespace.
Ingress and PersistentVolumeClaims are managed within the ingress.yaml and volume.yaml files one level up.

To launch: `kubectl create -f nifi-registry.yaml`