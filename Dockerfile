FROM registry.redhat.io/rhel7:7.8
USER root
COPY rhsmconf /etc/rhsm/rhsm.conf
COPY rhsmca /etc/rhsm/ca/redhat-uep.pem
COPY entitlements/private /etc/pki/entitlement
COPY entitlements/public /etc/pki/entitlement
RUN subscription-manager repos --enable=rhel-7-server-ose-3.11-rpms
RUN yum install -y python2 python2-openshift python2-kubernetes 
RUN yum clean all -y
RUN mkdir /csr_approver
COPY csr_approver /csr_approver
CMD /usr/bin/python /csr_approver/csr_approver
