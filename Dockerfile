FROM registry.redhat.io/rhel7@sha256:7df4a674e96ed2d6eee72aaf387a2d08c4dcd6c2d3232b0c72fce512afc82729
USER root
#
# The following repolist is a dummy operation that magically causes the hosts entitlement information to be injected
#
RUN yum repolist --disablerepo=*

RUN yum-config-manager --enable rhel-7-server-extras-rpms --enable rhel-7-server-ose-3.11-rpms 
RUN yum install --disableplugin=search-disabled-repos -y python python2-openshift python2-kubernetes
#
# The following rpm q ensures that the build fails if the rpms above were not installed
#
RUN rpm -q python python2-openshift python2-kubernetes
RUN mkdir /csr_approver
COPY ./csr_approver /csr_approver
CMD ["/usr/bin/python", "/csr_approver/csr_approver"]

