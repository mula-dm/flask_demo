usage:
	@echo "Available commands: "
	@echo
	@echo ===================
	@echo "\t\033[92mhelp\033[0m - Show help."
	@echo "\t\033[92minit\033[0m - General init."
	@echo "\t\033[92mbuild\033[0m - Build docker image for app."
	@echo "\t\033[92mrun\033[0m - Run app locally."
	@echo "\t\033[92mrun\033[0m - Deploy app to AWS Beanstalk."
	@echo ===================
	@echo

# ---------------------------------------------------------------------------------------------------------------------
# Variables
# ---------------------------------------------------------------------------------------------------------------------

EB_CLI ?= @docker run --rm  -i -v ~/.aws:/root/.aws --mount type=bind,source="$$(pwd)",target=/src -w /src eb_cli:latest

# ---------------------------------------------------------------------------------------------------------------------
# Targets
# ---------------------------------------------------------------------------------------------------------------------

.PHONY: usage
.PHONY: help
help: usage

.PHONY: init
init:
	@docker build -t eb_cli dockerfiles/ebscli/

.PHONY: build
build:
	@docker build . -t demo

.PHONY: run
run:
	@docker run -it --rm  -p 80:80 demo:latest

.PHONY: deploy
deploy:
	${EB_CLI} init -r us-east-1 demo --quiet
	${EB_CLI} deploy
	${EB_CLI} status
