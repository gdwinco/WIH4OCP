#WIH4OCP
This repo contains the code to create a container from the very cool jBPM Work Item Repostiory Code for deployment in a Red Hat Process Automation Manager (RHPAM) OCP environment
---
##Prerequisites
Check out the repo code here:
<https://github.com/kiegroup/jbpm-work-items>

If you don't have extra memory already allocation for maven, increase the default
export MAVEN_OPT="-Xmx1024m"

mvn clean install -DskipTests

The build will create two repos:
./jbpm-work-items/respository-springboot
./jbpm-work-times/repository-wildfly

The README.md in either repo directory shows how to bring up the server. That's fine if you are running jBPM or RHPAM as a standalone server App.

---
For OpenShift Container Platform the easist solution is to run the Springboot or Wildfly server on OCP so yoou can access it to use it within your demos.

You need to access to an OCP env and the oc command line tools installed.

If you don't already have RHPAM installed on OCP you can follow the instructions here:
<https://github.com/jbossdemocentral/rhpam7-install-demo>

Log in to OCP

// c
oc project {your rhpam project}






