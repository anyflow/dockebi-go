ifndef PLATFORM
	PLATFORM := linux/amd64
endif


TAG=dockebi-go
VERSION := 0.1.0

all: build_image run_docker

build_image:
	Dockerfile=Dockerfile $(MAKE) __build_image

build_image_debug:
	Dockerfile=Dockerfile.debug $(MAKE) __build_image

__build_image:
	docker buildx build . --load --platform $(PLATFORM) --tag ${TAG}:$(VERSION) --file ${Dockerfile}

run_docker:
	docker run --rm -p 3000:3000 -p 4000:4000 --name ${TAG} ${TAG}:$(VERSION)
