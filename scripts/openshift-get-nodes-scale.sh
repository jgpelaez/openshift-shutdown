#!/bin/bash
# based on 
# https://alword.wordpress.com/2016/11/18/shutdown-all-pods-in-openshift-and-kubernetes/ 
function quit {
    exit
}
project_file_name="data/backup_dc_scale_data"
project_file_ext=".csv"
inproject=$1
project_name=${inproject:-dev3}
function get_scale_data {
	for i in $( oc get project -o name|cut -d '/' -f2 ); do
	  for j in $( oc get dc -n $i -o name |cut -d '/' -f2 ); do
	    echo "${i},${j},"$( oc get dc -n $i $j \
	       --template='{{ .spec.replicas }}') >> backup_dc_scale_data.txt
	  done
	done
}

function get_scale_project {
  project=$1
  rm ${project_file_name}-${project}${project_file_ext}
  for j in $( oc get dc -n $project -o name |cut -d '/' -f2 ); do
    echo "${project},${j},"$( oc get dc -n $project $j \
       --template='{{ .spec.replicas }}') >> ${project_file_name}-${project}${project_file_ext}
  done

}
 
#get_scale_data

get_scale_project ${project_name}
quit