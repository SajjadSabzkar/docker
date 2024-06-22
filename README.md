
### Get to know me more 👇

[ Site Me ](https://amirrezaraadi.ir)
- 

> Clone your PHP files in the src folder

>then copy this directory to a desired location on your development machine.

> Next, navigate in your terminal to that directory, and spin up the containers for the full web server stack by running

`docker-compose up -d --build nginx`.


> When the container network is up, the following services and their ports are available to the host machine:

- **nginx** - `:80`
- **mysql** - `:3306`
- **php** - `:9000`


> You would use them just like you would with their native counterparts, including your command after any of those lines above


Using these updates, rebuilding your Docker network with
`docker-compose up -d --build`
should resolve any permissions issues during site loads, etc.
