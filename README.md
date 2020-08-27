# controller-csr-approver-python
ssh -At node1.9b61.internal
    subscription-manager register 
    subscription-manager attach --pool=8a85f99a6f0fa8df016f8592d92d2ecd
    subscription-manager repos --enable=rhel-7-server-ose-3.11-rpms \
                               --enable=rhel-7-server-extras-rpms

oc adm new-project csr-approver --node-selector=kubernetes.io/hostname=node1.$GUID.internal

oc adm policy add-cluster-role-to-user system:controller:certificate-controller system:serviceaccount:csr-approver:default


oc new-build . --strategy=docker
