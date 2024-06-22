<p align="center">
<a href="https://github.com/amirrezaraadi">
<img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status">
</a>
</p>

# Get to know me more 👇

[ Site Me ](https://amirrezaraadi.ir)
- 

# Clone your Laravel files in the src folder

# then copy this directory to a desired location on your development machine.

# Next, navigate in your terminal to that directory, and spin up the containers for the full web server stack by running

`docker-compose up -d --build nginx`.

# After that completes, run the following to install and compile the dependencies for the application:

- [docker-compose run --rm composer install]
- [docker-compose run --rm npm install]
- [docker-compose run --rm npm run dev]

# When the container network is up, the following services and their ports are available to the host machine:

- **nginx** - `:80`
- **mysql** - `:3306`
- **php** - `:9000`
- **redis** - `:6379`

# Three additional containers are included that are not brought up with the webserver stack, and are instead used as "command services". These allow you to run commands that interact with your application's code, without requiring their software to be installed and maintained on the host machine. These are:

- `docker-compose run --rm composer`
- `docker-compose run --rm artisan`
- `docker-compose run --rm npm`

# You would use them just like you would with their native counterparts, including your command after any of those lines above

(e.g. `docker-compose run --rm artisan db:seed`).

Using these updates, rebuilding your Docker network with
`docker-compose up -d --build`
should resolve any permissions issues during site loads, composer installations, or artisan commands.
