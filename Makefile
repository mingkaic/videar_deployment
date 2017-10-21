KUB=kubectl
DEPLOY=deployments
SERVE=services
APP=videar

deploy:
	$(KUB) create -f $(DEPLOY)/$(APP).yml
	$(KUB) create -f $(SERVE)/$(APP).yml

clean:
	$(KUB) delete deployments $(APP)
	$(KUB) delete services $(APP)
