KUB=kubectl
DEPLOY=deployments
SERVE=services
APP=videar
S2T=s2t
UAS=uas
DB=mongodb

all: configmap deploy_db deploy_main deploy_s2t deploy_uas
	$(KUB) create -f cronjob.yml

update:

redeploy: clean all

redeploy_main: clean_main deploy_main

redeploy_s2t: clean_s2t deploy_s2t

redeploy_uas: clean_uas deploy_uas

configmap:
	bash deploymap.sh

deploy_db:
	$(KUB) create -f deploy-$(DB).yml

deploy_main:
	$(KUB) create -f deploy-$(APP).yml

deploy_s2t:
	$(KUB) create -f deploy-$(S2T).yml

deploy_uas:
	$(KUB) create -f deploy-$(UAS).yml

clean: clean_configmap clean_db clean_main clean_s2t clean_uas
	$(KUB) delete cronjob fpcache-updater

clean_configmap:
	$(KUB) delete configmap videar-config

clean_db:
	$(KUB) delete deployments $(DB)
	$(KUB) delete services $(DB)

clean_main:
	$(KUB) delete deployments $(APP)
	$(KUB) delete services $(APP)

clean_s2t:
	$(KUB) delete deployments $(S2T)
	$(KUB) delete services $(S2T)

clean_uas:
	$(KUB) delete deployments $(UAS)
	$(KUB) delete services $(UAS)
