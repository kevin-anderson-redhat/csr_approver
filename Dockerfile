FROM openshift3/apb-base:v3.11
   RUN yum install -y python2 python2-openshift python2-kubernetes

CMD python /csr_approver/csr_approver
