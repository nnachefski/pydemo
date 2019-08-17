#### # this described how to build my pydemo test application (python3.6+django+jquery-ui) to build and run on Openshift 4.x using the native Tekton Pipelines.
##### # Tekton is a kubernetest-native building framework (like Jenkins) designed specifically for containers.

##### # first, install the "Openshift Pipelines" operator from the OCP 4.x OperatorHub tab

##### # create a project to run the application and setup the appropriate serviceaccount and SCC policies
```
export PROJECT_NAME=tekton-test
oc new-project $PROJECT_NAME
oc create serviceaccount pipeline
oc adm policy add-scc-to-user privileged -z pipeline
oc adm policy add-role-to-user edit -z pipeline 
```
##### # now, add the Task object to the project (located in this directory)
```
oc create -f https://raw.githubusercontent.com/nnachefski/pydemo/master/tekton/pydemo-task.yaml
```

##### # now add the task run
```
oc create -f https://raw.githubusercontent.com/nnachefski/pydemo/master/tekton/pydemo-taskrun.yaml
```

##### # and watch for the build completion
```
watch oc get taskrun 
```
###### # you can use 'oc logs' on the build pod to see the output, for example
```
oc logs pydemo-taskrun-pod-90e3a7 -c step-build
```
##### # after it completes successfully, create an instance of the pydemo app
```
oc new-app -i pydemo
```
##### # and create the route
```
oc expose svc/pydemo
```

##### # and that's it!  You just used native Openshift Pipelines to build and deploy 'pydemo'.  Now, take it a step further and build your own app.  Check out using RH CodeReady as your IDE (on Openshift).  It's an kubernetes-native IDE (Eclipse-che) that gives you all the benefits of a VDI-style solution without the massive headaches that VDI brings to the party.  You could say it's "VDI on kubernetes"




