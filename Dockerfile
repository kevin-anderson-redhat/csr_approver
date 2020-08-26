FROM rhel-minimal:7.8
   RUN yum install -y python2 python2-openshift python2-kubernetes

CMD /usr/bin/python /csr_approver/csr_approver
