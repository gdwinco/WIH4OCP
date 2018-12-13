#!/bin/bash
#
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "PRE-REQS -- need to have binary in a directory /ocp/deploy"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#
BUILD_NAME=jbpm-repo-build
IMAGE_NAME=openjdk18-openshift
IMAGE_NAME=redhat-openjdk18-openshift:1.4
APP_NAME=jbpm-repo-app
TGT_PORT=8080
#
#
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " Step1: oc new-build - creating buildconfig and is :" ${BUILD_NAME}
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
oc new-build  --binary=true \
  --name=${BUILD_NAME} \
  --image-stream=${IMAGE_NAME}
oc get all
#
#
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " Step2: oc start-build - inject code from local directory"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
oc start-build ${BUILD_NAME} --from-dir=./ocp --follow
oc get all
#
#
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " Step3: oc new-app - create an app from the build"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
oc new-app ${BUILD_NAME} --name=${APP_NAME} --env=server.port=${TGT_PORT} 
#
#
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " Step4: oc expose service - make the app available "
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
oc expose service ${APP_NAME} --port=${TGT_PORT} --path=/repository
oc get all
