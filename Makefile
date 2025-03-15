# Packer build and SOPS helper
# ------------------------------------------------------

# Shell settings
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
.DEFAULT_GOAL := help

# Environment and path variables
DISTRO ?= debian-12
VARIANT ?= bookworm
PACKER_DIR := ./packer
VARS_DIR := ./vars

# SOPS
SOPS_SECRETS := $(VARS_DIR)/secrets.enc.yaml
EDITOR ?= vim

# Colors for output
GREEN = \033[0;32m
YELLOW = \033[0;33m
RED = \033[0;31m
NC = \033[0m

# Help target
.PHONY: help
help: ## Show this help
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-20s$(NC) %s\n", $$1, $$2}'

# Packer targets
.PHONY: packer-validate
packer-validate: ## Validate Packer template
	@echo ""
	printf "$(YELLOW)Validating Packer template for $(DISTRO)-$(VARIANT)...$(NC)\n"
	cd $(PACKER_DIR)/$(DISTRO) && packer validate \
		--var-file=vars/$(DISTRO)-$(VARIANT).pkrvars.hcl \
		--var-file=vars/$(DISTRO)-$(VARIANT).secret.pkrvars.hcl \
		.

.PHONY: packer-build
packer-build: ## Build Packer template
	@echo ""
	printf "$(YELLOW)Building Packer template for $(DISTRO)-$(VARIANT)...$(NC)\n"
	cd $(PACKER_DIR)/$(DISTRO) && packer build \
		--var-file=vars/$(DISTRO)-$(VARIANT).pkrvars.hcl \
		--var-file=vars/$(DISTRO)-$(VARIANT).secret.pkrvars.hcl \
		.
