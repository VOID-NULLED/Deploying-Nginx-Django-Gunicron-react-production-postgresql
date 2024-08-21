#!/bin/bash

# entrypoint.sh

set -e

# Function to check PostgreSQL readiness
function wait_for_postgres() {
    echo "Waiting for PostgreSQL to be ready..."

    until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$POSTGRES_USER"; do
        >&2 echo "Postgres is unavailable - sleeping"
        sleep 1
    done

    >&2 echo "Postgres is up - continuing..."
}

# Wait for PostgreSQL to be ready
wait_for_postgres

# Run Django migrations
echo "Running migrations..."
python manage.py migrate

# Collect static files (if applicable)
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Start Gunicorn
echo "Starting Gunicorn..."
exec gunicorn app.wsgi:application --bind 0.0.0.0:8000
