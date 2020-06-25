NAMESPACE = nutcorp
ICMK_VERSION ?= master
ENV_DIR = $(PWD)

include .infra/icmk/*.mk

# Infrastructure
test: terraform.checkov terraform.tflint
