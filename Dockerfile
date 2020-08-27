FROM registry.redhat.io/rhel7@sha256:7df4a674e96ed2d6eee72aaf387a2d08c4dcd6c2d3232b0c72fce512afc82729
USER root
RUN cp -R /run/secrets/rhsm/* /etc/rhsm/
RUN cp /run/secrets/etc-pki-entitlement/* /etc/pki/entitlement/
RUN cp /run/secrets/rhel7.repo /etc/yum.repos.d/rhel7.repo
RUN yum clean all -y --disableplugin=search-disabled-repos --disableplugin=subscription-manager
RUN yum-config-manager --enable rhel-7-server-extras-rpms --disableplugin=search-disabled-repos --disableplugin=subscription-manager
RUN yum install --disableplugin=search-disabled-repos --disableplugin=subscription-manager -y python2 python2-openshift python2-kubernetes
RUN rpm -q python python2-openshift python2-kubernetes
RUN mkdir /csr_approver
COPY ./csr_approver /csr_approver
CMD /usr/bin/python /csr_approver/csr_approver

