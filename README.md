This is a collection of scripts that enables us to shutdown and scale up to the previous state the deployment configs in a project.

# Usage

For being able to restore the previous state we need to create a file per project with the desired state when running.

That file "backup_dc_scale_data-${projectName}.csv have the format:

```
<projectName>,<dcName>,<replicas>
```

We can manually create the file in the ./data folder or call to the script (we need to install the make utility):

```
make get-nodes-scale PROJECT=<projectName>
```

That will create the file in ./data for the project. 

Once we have the file, we can scale down and up the pods for a project:

```
make scale-down PROJECT=<projectName>
```

And we can re-scale to the previous state with:

```
make scale-up  PROJECT=<projectName>
```
