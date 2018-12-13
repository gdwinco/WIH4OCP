# WIH4OCP
This repo contains the code to create a container from the very cool jBPM Work Item Repostiory Code for deployment in a Red Hat Process Automation Manager (RHPAM) OCP environment

---
## Prerequisites
Check out the repo code here:
<https://github.com/kiegroup/jbpm-work-items>

Note: The community is several versions ahead of the RHPAM codebase. You can check the component details for the version of RHPAM you install to align with the proper tag. For RHPAM 7.1, the correct tag is 7.11.0.Final

If you don't have extra memory already allocation for maven, increase the default

*export MAVEN_OPTS=-Xmx1024m*

*mvn clean install -DskipTests*

The build will create two web server repos:

- ./jbpm-work-items/respository-springboot
- ./jbpm-work-times/repository-wildfly

The README.md in either repo directory shows how to bring up the server. That's fine if you are running jBPM or RHPAM as a standalone server App.


For OpenShift Container Platform one solution is to run the Springboot or Wildfly server on OCP so you can showcase it as part of your demos.

In order to run the install script, you need access to an OCP env and the oc command line tools installed. If you want to run locally on your workstation you can use Red Hat Container Development Kit here: <https://developers.redhat.com/products/cdk/download/>

If you don't already have RHPAM installed on OCP you can follow the instructions here:
<https://github.com/jbossdemocentral/rhpam7-install-demo>

---
### Optional
my home network isn't the fastest so I find it helpful to preload the files before running the rhpam installer above

- _minishift ssh 'docker pull registry.access.redhat.com/rhpam-7/rhpam71-smartrouter-openshift:1.1'_

- _minishift ssh 'docker pull registry.access.redhat.com/rhpam-7/rhpam71-kieserver-openshift:1.1'_

- _oc import-image my-rhpam-7/rhpam71-kieserver-openshift --from=registry.access.redhat.com/rhpam-7/rhpam71-kieserver-openshift -n openshift --confirm_

- _oc import-image my-rhpam-7/rhpam71-businesscentral-openshift --from=registry.access.redhat.com/rhpam-7/rhpam71-businesscentral-openshift -n openshift --confirm_

## Installing the repo sever on OCP

#### Log in to OCP
_oc login -u {your user} -p {your passwd}_

_oc project {your rhpam project}_

#### Move to the directory where you cloned this repo

_mkdir -p ocp/deployments_

_cp {path to your repository-springboot-7.11.0.Final.jar} ocp/deployments_

#### Execute the script to create your repo container:

_./create_jbpm_repo.sh_

#### You should see the Springboot server deployed on OCP and can access the WorkItemHandlers from the exposed route





