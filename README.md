# php-boilerplate
A skeleton to start new high-quality PHP projects without worrying about bootstrapping everything from scratch.

## Features

The skeleton includes a PHP project properly configured with:

- 🛠 **Docker and docker-compose** - because nobody wants (or should) to install project dependencies directly into their 
machines.
- 🎉 **PHP 7.4** - typed properties, arrow functions, etc.
- 🕵 **Xdebug** - to stop wasting time printing values and start debugging PHP applications like a boss‍️.
    - currently we provide [install instructions](docs/xdebug.md) for [PHPStorm](https://www.jetbrains.com/phpstorm/) - 
but it also work with other editors/IDEs.
- 🚦**PHPUnit** - to write and run unit tests and also generate code coverage.
- 📋 **phpcs** - to ensure good coding standards.
    - currently check against [Doctrine standard](https://github.com/doctrine/coding-standard).
- 👻 **phpstan** - to find errors in the code before running it. 
- 🚀 **Continuous Integration** - to ensure the previous tools runs for every contribution to your repository.
    - currently works out-of-box with [GitHub Actions](https://github.com/features/actions).

Stop wasting time! 🏝🍹

## Requirements

- **Docker CE** - see the [install guide](https://docs.docker.com/install/).
- **Docker Compose** - it is already included in *Docker Desktop for Mac* and *Windows*). If necessary, see the 
[install guide](https://docs.docker.com/compose/install/).
- **nektos/act** - (optional dependency) used to run [GitHub Actions](https://github.com/features/actions) locally. See
 the [install guide](https://github.com/nektos/act#installation).

## Install

1. Make sure you have the requirements described above.
1. Clone this repository: `git clone git@github.com:xthiago/php-skeleton.git`
1. Run `docker-compose run php composer install` to install the PHP dependencies.
1. If you are using Linux, go to the next step. If you are using `Docker for Mac or Windows`, create a `.env` file 
(I suggest you copy from [distribution version](env.dist) with `cp env.dist env.dist`) and add 
`XDEBUG_REMOTE_HOST=host.docker.internal`). It is needed in order to allow Xdebug to connect back to the IDE in these OS.
1. *(optional)* You can configure the XDebug in your editor/IDE in order to debug this application using it.
[See the guide](docs/xdebug.md).
1. That's all 😜.

## Usage

### Web application

In order to start the web application, you must create and start the PHP service:
 
 ```
 docker-composer up -d
```

Then you can open [https://localhost:8000](https://localhost:8000) in your browser. It will open 
[web/index.php](web/index.php) file.

For troubleshooting, you can watch the logs to see what's going on:

```
docker-composer logs -f
```

See `docker-composer --help` to get more 
instructions.

### Command line

You can access the terminal of PHP container with:
 
 ```
docker-compose exec php ash
```

You can also execute any command in PHP container from outside it typing and running:

```
docker-compose run php [command-name]
# Example: docker-compose run php composer --help
```

#### Available commands

You can run any available commands inside the PHP container:

- `parallel-lint --exclude vendor .` to check the PHP syntax.
- `phpcs` - to check the codebase against code standards
    - *the configuration is automatically inherited from [phpcs.xml](phpcs.xml)*.
- `phpstan analyse` to run a static analyse in the codebase
    - *the configuration is automatically inherited from [phpstan.neon](phpstan.neon)*.
- `phpunit` to run the unit tests
    - *the configuration is automatically inherited from [phpunit.xml](phpunit.xml)*
- `composer test` to run all commands above.
- `phpunit --coverage-html reports/` to generate code coverage of tests
    - *the configuration is automatically inherited from [phpunit.xml](phpunit.xml)*
