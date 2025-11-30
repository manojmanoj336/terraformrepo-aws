# Simple helper Makefile for local Terraform dev
TERRAFORM_DIR ?= terraform/envs/dev

init:
	terraform -chdir=$(TERRAFORM_DIR) init

fmt:
	terraform -chdir=$(TERRAFORM_DIR) fmt -recursive

validate:
	terraform -chdir=$(TERRAFORM_DIR) validate

plan:
	terraform -chdir=$(TERRAFORM_DIR) plan -out=plan.out

apply:
	terraform -chdir=$(TERRAFORM_DIR) apply plan.out

clean:
	rm -f $(TERRAFORM_DIR)/plan.out

.PHONY: init fmt validate plan apply clean
