# MAKE BASTION LOCAL CLUSTER ADMIN
mkdir ~/.kube
scp master1:~/.kube/config ~/.kube/config
echo "made bastion a local cluster admin"
