# Personal Cloud Infrastructure - Makefile
# Author: Sai Charan

install:
	bash scripts/install_dependencies.sh
	bash scripts/setup_database.sh
	bash scripts/install_nextcloud.sh

backup:
	bash scripts/backup.sh

deps:
	bash scripts/install_dependencies.sh

database:
	bash scripts/setup_database.sh

nextcloud:
	bash scripts/install_nextcloud.sh

help:
	@echo "Available Commands:"
	@echo "  install     - Install all dependencies and services"
	@echo "  backup      - Create a backup of the current setup"
	@echo "  deps        - Install dependencies"
	@echo "  database    - Set up the database"
	@echo "  nextcloud   - Install Nextcloud"
	@echo "  help        - Show this help message"

	