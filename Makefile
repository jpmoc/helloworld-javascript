DKR_IMAGE_FAMILY_NAME?= emayssatware/helloworld-nodejs
DKR_IMAGE_CNAME?= $(DKR_IMAGE_FAMILY_NAME)

build_image:
	docker build -t $(DKR_IMAGE_CNAME) .

push_image:
	docker push $(DKR_IMAGE_CNAME)

apply_kservice:
	# make sure to update the image in the kservice.yaml file
	kubectl apply -f kservice-v1.yaml
	# kubectl apply -f kservice-v2.yaml

curl_kservice:
	curl http://helloworld-nodejs.default.127.0.0.1.xip.io

unapply_kservice:
	kubectl delete -f kservice-v1.yaml
	# kubectl delete -f kservice-v2.yaml
