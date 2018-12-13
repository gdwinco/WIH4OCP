# WIH4OCP
This repo contains the code to create a container from the very cool jBPM Work Item Repostiory Code for deployment in a Red Hat Process Automation Manager (RHPAM) OCP environment

--
## Prerequisites
Check out the repo code here:
<https://github.com/kiegroup/jbpm-work-items>

If you don't have extra memory already allocation for maven, increase the default
export MAVEN_OPT="-Xmx1024m"

mvn clean install -DskipTests

The build will create two web server repos:

- ./jbpm-work-items/respository-springboot
- ./jbpm-work-times/repository-wildfly

The README.md in either repo directory shows how to bring up the server. That's fine if you are running jBPM or RHPAM as a standalone server App.


For OpenShift Container Platform the easist solution is to run the Springboot or Wildfly server on OCP so you can access it to use it within your demos.

You need access to an OCP env and the oc command line tools installed. If you want to run locally on your workstation you can use Red Hat Container Development Kit here: <https://developers.redhat.com/products/cdk/download/>

If you don't already have RHPAM installed on OCP you can follow the instructions here:
<https://github.com/jbossdemocentral/rhpam7-install-demo>

---
## Optional
my home network isn't the fastest so I find it helpful to preload the files

- minishift ssh 'docker pull registry.access.redhat.com/rhpam-7/rhpam71-smartrouter-openshift:1.1'

- minishift ssh 'docker pull registry.access.redhat.com/rhpam-7/rhpam71-kieserver-openshift:1.1'

- oc import-image my-rhpam-7/rhpam71-kieserver-openshift --from=registry.access.redhat.com/rhpam-7/rhpam71-kieserver-openshift -n openshift --confirm

- oc import-image my-rhpam-7/rhpam71-businesscentral-openshift --from=registry.access.redhat.com/rhpam-7/rhpam71-businesscentral-openshift -n openshift --confirm


Log in to OCP
oc login -u {your user} -p {your passwd}

//
oc project {your rhpam project}

Move to the directory where you cloned this repo

mkdir -p ocp/deployments
cp {path to your repository-springboot-7.11.0.Final.jar} ocp/deployments

./create_jbpm_repo.sh

You should see the Springboot server deployed and can access the WorkItemHandlers from the exposed route





