# controller-csr-approver-python
ssh -At node1.9b61.internal
    subscription-manager register 
    subscription-manager attach --pool=8a85f99a6f0fa8df016f8592d92d2ecd
    subscription-manager repos --enable=rhel-7-server-ose-3.11-rpms


oc get secret -n openshift imagestreamsecret -oyaml --export | oc create -f -

oc secrets link builder imagestreamsecret
