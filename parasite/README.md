# NiFi Parasite (AKA Worker Node)

Used to deploy a StatefulSet of worker nodes. I used a StatefulSet to be able to predict what
the hostname of each pod would be. This hostname is used in the directory tree laid out in the
persistent volume so we can easily restart pods without having to figure out where they put
their data. See the run.sh script to see what this pod does at launch time.

PLEASE NOTE:

These pods will not run properly if you do not have a nifi distrbution available in the 
/share/template/ directory as run.sh expects. It's not polished or perfect. Again, just a proof of
concept/example of how we can spin up new worker pods while keeping image sizes small.