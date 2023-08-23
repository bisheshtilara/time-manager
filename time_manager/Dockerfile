# ./Dockerfile

# Extend from the official Elixir image.
FROM elixir:latest

RUN apt update
RUN apt-get install -y postgresql-client

# Create app directory and copy the Elixir projects into it.
RUN mkdir /time_manager
COPY . /time_manager
WORKDIR /time_manager

ENV IS_DOCKER db

# Install Hex package manager.
# By using `--force`, we don’t need to type “Y” to confirm the installation.
RUN mix local.hex --force
RUN mix local.rebar --force

CMD ["/time_manager/entrypoint.sh"]