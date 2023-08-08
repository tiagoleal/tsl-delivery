
<p align="center">Delivery API </p>

<p align="center">
  <a href="#">
    <img alt="Current Version" src="https://img.shields.io/badge/version-1.0.0 -blue.svg">
  </a>
  <a href="https://elixir-lang.org/">
    <img alt="Elixir" src="https://img.shields.io/badge/Elixir-1.15.2 -blue.svg" target="_blank">
  </a>
  <a href="https://hexdocs.pm/phoenix/up_and_running.html">
    <img alt="" src="https://img.shields.io/badge/Phoenix-~> 1.7.7-red.svg" target="_blank">
  </a>
  
</p>

## Stack the Project

- **elixir**
- **phoenix**
- **credo**
- **ex_machina**
- **postgrex**
- **excoveralls**
- **TDD**
- **guardian**
- **genServers**
- **mox**

## Features

- **Create user account:** Create user account and profile.
- **Create purchase orders:** Permit that create a purchase orders.
- **Generate reports user/purchase orders:** Report generation of the users with the most purchase orders(GenServer).


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You must have installed on your machine:

- Docker
- Docker Compose

### Installing

First step is to install the docker service:

```bash
#Linux: ubuntu,Mint
$ sudo apt-get update
$ sudo apt-get install docker-ce
$ sudo apt install docker-compose

# Fedora
$ sudo dnf update -y
$ sudo dnf install docker-ce
$ sudo dnf -y install docker-compose
```

For test if the service was installed with succeed, you can run the command for to check de version of docker:

```bash
$ docker --version
#Must be have the docker version: Docker version 18.06.0-ce
$ docker-compose --version
#Must be have the docker-compose version: docker-compose version 1.22.0
```

## First steps

Follow the instructions to have a project present and able to run it locally.
After copying the repository to your machine, go to the project's root site and:

1.  Construct the container

```
$ docker-compose build
```

2.  Create of Database

```
$ mix ecto.setup
$ mix ecto.create
$ mix ecto.migrate
```

3.  Run the project

```
# install phoenix
$ mix archive.install hex phx_new 1.7.6 

# install erlang 
asdf install erlang 26.0.2

# elixir install version
$ asdf install elixir 1.15.2

# install dependencies
$ mix deps.get

#start project
mix phx.server

```

## Running the tests

To run the tests, you must run the docker container through the command:

```
# show coverage
$ mix test --cover

# show coveralls external library 
$ mix coveralls
```

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


## Authors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
[<img src="https://avatars1.githubusercontent.com/u/5727529?s=460&v=4" width="100px;"/><br /><sub><b>Tiago Leal</b></sub>](https://github.com/tiagoleal)<br />
