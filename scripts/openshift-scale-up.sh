#!/bin/bash
# based on 
# https://alword.wordpress.com/2016/11/18/shutdown-all-pods-in-openshift-and-kubernetes/

inproject=$1
project_name=${inproject:-dev3}
project_file_name="data/backup_dc_scale_data"
project_file_ext=".csv"
 
function quit {
    exit
}
function scale_up {
	project=$1
	for i in $( < ${project_file_name}"-"${project}${project_file_ext}); do
		desiredReplicas=$( echo $i|cut -d',' -f3)
		if [ "$desiredReplicas" -ne "0" ]; then
			oc scale -n $( echo $i|cut -d',' -f1) \
			    dc/$( echo $i|cut -d',' -f2) \
			  --replicas=${desiredReplicas}
		fi
	done
}

scale_up ${project_name}
quit