FROM registry.redhat.io/rhel7:7.8
USER root
RUN yum install -y python2 python2-openshift python2-kubernetes && yum clean all -y
RUN mkdir /csr_approver
COPY csr_approverA /csr_approver
CMD /usr/bin/python /csr_approver/csr_approver
