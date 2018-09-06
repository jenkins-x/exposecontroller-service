CHART_REPO := http://jenkins-x-chartmuseum:8080
NAME := exposecontroller-service
OS := $(shell uname)
RELEASE_VERSION := 1.0.5

setup:
	minikube addons enable ingress
	brew install kubernetes-helm
	helm init

build: clean
	helm dependency build
	helm lint

install: clean build
	helm install . --name ${NAME}
	watch kubectl get pods

upgrade: clean build
	helm upgrade ${NAME} .
	watch kubectl get pods

delete:
	helm delete --purge ${NAME}

clean:
	rm -rf charts
	rm -rf ${NAME}*.tgz
	rm -rf requirements.lock

release: clean
	helm dependency build
	helm lint
ifeq ($(OS),Darwin)
	sed -i "" -e "s/version:.*/version: $(RELEASE_VERSION)/" Chart.yaml
else ifeq ($(OS),Linux)
	echo "linux"
else
	exit -1
endif
	# git add Chart.yaml
	# git commit -a -m "release $(RELEASE_VERSION)"
	# git tag -fa v$(RELEASE_VERSION) -m "Release version $(RELEASE_VERSION)"
	# git push origin v$(RELEASE_VERSION)
	helm package .
	curl --fail -u $(CHARTMUSEUM_CREDS_USR):$(CHARTMUSEUM_CREDS_PSW) --data-binary "@$(NAME)-$(RELEASE_VERSION).tgz" $(CHART_REPO)/api/charts
	rm -rf ${NAME}*.tgz%