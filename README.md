# ChitoBot
![chito profile pic](./profile_pic.png)


The protector of Chepica, the killer of rabbits, the exterminator of mice and the lord of Meneses Rinconada.
Yes, this is my family cat talking through Telegram.

## How to execute

### On your machine
First, you need to install Ruby dependencies

```
cd src
bundle
cd ..
```

Then, you put the Telegram token in a file called `telegram_token`

```
echo "token given by telegram" > telegram_token
```

And play...
```
./start.sh
```

### With Docker
First, you need to build the image:
```
echo "token given by telegram" > telegram_token
./docker-build.sh
```

Then, you'll see an image called `chitobot`, with a tab based on version and build timestamp.

```
$ docker images
REPOSITORY             TAG                  IMAGE ID            CREATED             SIZE
chitobot               0.1-20170707095448   ded0dd0a83a5        7 minutes ago       489MB
```

Run that image, and you're done.
```
docker run -d --rm chitobot:0.1-20170707095448
```

## List of implemented comands
 - `/start`: It prints a greeting message
 - `/greet`: Does the same as `/start`
 - `/echo`: Returns the given parameters
 - `/9gag`: Print a random post from 9gag homepage
 - `/roll`: Roll a dice
 - `/viernes`: Sing the Viernes song

As you may see, there's a lot of work to be done.

## TODO list

 - [ ] A test environment. Because we don't like to tests with the "production" bot
 - [ ] Moar commands: memes, jokes, etc. You know: useful things.
 - [ ] Functional tests.
 - [ ] Tests coverage, maybe?
 - [*] Dockerize: Because we don't like to deal with Ruby dependencies.
 - [ ] ...and more important: a counter of dead animals, killed by the Chepica's Terror.
