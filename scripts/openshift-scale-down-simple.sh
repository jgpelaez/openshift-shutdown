#!/bin/bash
# based on 
# https://alword.wordpress.com/2016/11/18/shutdown-all-pods-in-openshift-and-kubernetes/

inproject=$1
project_name=${inproject:-dev3}

function quit {
    exit
}
function scale_down {
	project=$1
	project=$1
	for j in $( oc get dc -n $project -o name |cut -d '/' -f2 ); do
	  oc scale -n ${project} \
	    dc/${j} \
	    --replicas=0
	done

}
echo ${project_name}
#scale_down ${project_name}
quit