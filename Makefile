.PHONY: format validate plan apply

format:
    terraform fmt

validate:
    terraform validate

plan:
    terraform plan

apply:
    terraform apply
TF_DIR := .

.PHONY: format
format:
    terraform fmt -recursive $(TF_DIR)

.PHONY: validate
validate:
    terraform validate $(TF_DIR)

.PHONY: plan
plan:
    terraform plan $(TF_DIR)

.PHONY: apply
apply:
    terraform apply $(TF_DIR)

.PHONY: all
all: format validate plan apply
