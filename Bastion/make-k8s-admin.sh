# MAKE BASTION LOCAL CLUSTER ADMIN
mkdir ~/.kube
scp master.openshift.local:~/.kube/config ~/.kube/config
echo "made bastion a local cluster admin"
