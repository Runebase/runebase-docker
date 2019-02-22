.PHONY: image

img_tag = "hayeah/runebaseportal"
container_name = "runebaseportal"

image:
	docker build . -t $(img_tag)

run:
	cp -n env.list-example env.list || true
	docker run --rm -d \
	  --name $(container_name) \
	  --env-file env.list \
	  -v `pwd`:/dapp \
	  -p 9899:9899 \
	  -p 9888:9888 \
	  -p 9432:9432 \
	  -p 29432:29432 \
	  $(img_tag)

stop:
	docker stop $(container_name)

exec:
	docker exec -it $(container_name) sh
