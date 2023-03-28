#!/bin/bash

function create_user_and_database() {
	local database=$(echo $1 | tr ':' ' ' | awk  '{print $1}')
	local role=$(echo $1 | tr ':' ' ' | awk  '{print $2}')
	echo "Creating user '${role}' and database '${database}'..."
	psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER}" <<-PGSQL
		DO $do$
		BEGIN
			IF EXISTS (
				SELECT FROM pg_catalog.pg_roles 
				WHERE rolname = '${role}'
			) THEN
				RAISE NOTICE 'Role "${role}" already exists. Skipping.';
			ELSE
				CREATE ROLE ${role} LOGIN PASSWORD '${POSTGRES_PASSWORD}';
			END IF;
			IF EXISTS (
				SELECT FROM pg_database 
				WHERE datname = '${database}'
			) THEN
				RAISE NOTICE 'Database "${database}" already exists. Skipping.';
			ELSE
				CREATE DATABASE ${database};
			END IF;
		END
		$do$;

		GRANT ALL PRIVILEGES ON DATABASE "${database}" TO "${role}";
PGSQL
}

if [[ ! -z "${POSTGRES_MULTIPLE_DATABASES}" ]]; then
	echo "Multiple database creation requested: ${POSTGRES_MULTIPLE_DATABASES}"
	for db in $(echo "${POSTGRES_MULTIPLE_DATABASES}" | tr ';' ' '); do
		create_user_and_database "${db}"
	done
	echo "Multiple databases created"
fi