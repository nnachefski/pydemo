#### # this described how to build my pydemo test application (python3.6+django+jquery-ui) to build and run on Openshift 4.x using the native Tekton Pipelines.

##### # first, create a project to run the application and setup the appropriate serviceaccount and SCC policies
```
export PROJECT_NAME=tekton-test
oc new-project $PROJECT_NAME
oc create serviceaccount pipeline
oc adm policy add-scc-to-user privileged -z pipeline
oc adm policy add-role-to-user edit -z pipeline 
```

##### # now, add the Task object to the project (located in this directory)
```
oc create -f pydemo-pipeline.yaml
```




