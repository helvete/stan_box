#!/usr/bin/make -f
main: vendor run

vendor:
	docker-compose up --build --force-recreate -d

run:
	docker-compose exec php sh -c "vendor/bin/phpstan analyse --level max /app"

.PHONY: composer-cli
composer-cli:
	docker-compose exec composer bash
.PHONY: php-cli
php-cli:
	docker-compose exec php sh
