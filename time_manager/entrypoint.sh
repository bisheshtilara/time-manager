#!/bin/bash

mix deps.get

while ! pg_isready -q -h db -p 5432 -U postgres
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
  mix deps.compile --force bcrypt_elixir
  mix ecto.reset

exec mix phx.server
