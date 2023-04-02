#!/bin/bash

function create_user_and_database() {
	local MDB_DB_NAME=$(echo $1 | tr ':' ' ' | awk  '{print $1}')
	local MDB_ROLE=$(echo $1 | tr ':' ' ' | awk  '{print $2}')
	#local MDB_ROLE="${POSTGRES_USER}"
	local MDB_PASSWORD=$(echo $1 | tr ':' ' ' | awk  '{print $3}')

	if [[ "${MDB_PASSWORD}x" == "x" ]]; then
		MDB_PASSWORD="${POSTGRES_PASSWORD}"
	fi

	echo "Creating user '${MDB_ROLE}' and database '${MDB_DB_NAME}' with pass '${MDB_PASSWORD}..."

	# CREATE ROLE ${MDB_ROLE} LOGIN PASSWORD '${MDB_PASSWORD}';
	psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER}" <<-PGSQL
		CREATE ROLE ${MDB_ROLE} LOGIN PASSWORD '${MDB_PASSWORD}';
		CREATE DATABASE ${MDB_DB_NAME};
		GRANT ALL PRIVILEGES ON DATABASE ${MDB_DB_NAME} TO ${MDB_ROLE};
PGSQL
}

if [[ ! -z "${POSTGRES_MULTIPLE_DATABASES}" ]]; then
	echo "Multiple database creation requested: ${POSTGRES_MULTIPLE_DATABASES}"

	for db in $(echo "${POSTGRES_MULTIPLE_DATABASES}" | tr ';' ' '); do
		create_user_and_database "${db}"
	done

	echo "Multiple databases created"
fi