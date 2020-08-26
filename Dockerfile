FROM registry.redhat.io/rhel7:7.8
USER root
COPY /etc/rhsm/rhsm.conf /etc/rhsm/rhsm.conf
COPY /etc/pki/entitlement/ /etc/pki/entitlement
RUN  subscription-manager repos --enable=rhel-7-server-ose-3.11-rpms
yum install -y python2 python2-openshift python2-kubernetes 
RUN yum clean all -y
RUN mkdir /csr_approver
COPY csr_approver /csr_approver
CMD /usr/bin/python /csr_approver/csr_approver
