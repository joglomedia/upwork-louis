#!/bin/bash

function create_user_and_database() {
	local database=$(echo $1 | tr ':' ' ' | awk  '{print $1}')
	local role=$(echo $1 | tr ':' ' ' | awk  '{print $2}')

	echo "Creating user '${role}' and database '${database}'..."

	# CREATE ROLE ${role} LOGIN PASSWORD '${POSTGRES_PASSWORD}';
	psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER}" <<-PGSQL
		CREATE ROLE ${role} LOGIN PASSWORD '${POSTGRES_PASSWORD}';
		CREATE DATABASE ${database};
		GRANT ALL PRIVILEGES ON DATABASE '${database}' TO '${role}';
PGSQL
}

if [[ ! -z "${POSTGRES_MULTIPLE_DATABASES}" ]]; then
	echo "Multiple database creation requested: ${POSTGRES_MULTIPLE_DATABASES}"

	for db in $(echo "${POSTGRES_MULTIPLE_DATABASES}" | tr ';' ' '); do
		create_user_and_database "${db}"
	done

	echo "Multiple databases created"
fi