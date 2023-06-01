ifeq (, $(shell which docker))
 $(error "No docker? why bother?")
endif

FILENAME = dock.sh
CMD_NAME = dh

test: $(FILENAME)
	@echo "Test started...."
	docker run hello-world
	bash $(FILENAME) -li | wc -l || [ $$? -eq 1 ]

	@echo "Trying to delete the container"
	bash $(FILENAME) -dc
	docker ps -a | wc -l || [ $$? -eq 1 ]
	@echo "Container deleted....!"
	
	@echo "Trying to delete the docker image"
	bash $(FILENAME) -di
	docker images | wc -l || [ $$? -eq 1 ]
	@echo "Image deleted....!"
	
	@echo "Tests passed!"

install: $(FILENAME)
	cp ./$(FILENAME) /usr/bin/$(CMD_NAME)