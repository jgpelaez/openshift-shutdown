.PHONY: help
.DEFAULT_GOAL := help


export REDEPLOY_OPENSHIFT_TEMPLATE?=false

get-nodes-scale-devthree:  ## get-nodes-scale
	$(MAKE) get-nodes-scale PROJECT=dev3
	
scale-down-devthree:  ## scale-down-devthree
	$(MAKE) scale-down PROJECT=dev3

scale-up-devthree:  ## scale-up-devthree
	$(MAKE) scale-up PROJECT=dev3

###############################################################################
get-nodes-scale:  ## get-nodes-scale
	@sh ./scripts/openshift-get-nodes-scale.sh ${PROJECT}

scale-down:  ## get-nodes-scale
	@sh ./scripts/openshift-scale-down.sh ${PROJECT}

scale-up:  ## get-nodes-scale
	@sh ./scripts/openshift-scale-up.sh ${PROJECT}

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo -e "Arguments/env variables: \n \
				"