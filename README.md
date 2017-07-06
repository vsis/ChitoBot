# ChitoBot
![chito profile pic](./profile_pic.png)
The protector of Chepica, the killer of rabbits, the exterminator of mice and the lord of Meneses Rinconada.
Yes, this is my family cat talking through Telegram.

## How to execute

First you need to install Ruby dependencies

```
cd src
bundle
cd ..
```

Then you put the Telegram token in a file called `telegram_token`

```
echo "token given by telegram" > telegram_token
```

And play...
```
./start.sh
```


## List of implemented comands
 - `/start`: It prints a greeting message
 - `/greet`: Does the same as `/start`
 - `/echo`: Returns the given parameters

As you may see, there's a lot of work to be done.

## TODO list

 - [ ] A test environment. Because we don't like to tests with the "production" bot
 - [ ] Moar commands: memes, jokes, etc. You know: useful things.
 - [ ] Functional tests.
 - [ ] Tests coverage, maybe?
 - [ ] Dockerize: Because we don't like to deal with Ruby dependencies.
 - [ ] ...and more inportant: a counter of dead animals, killed by the Chepica's Terror.
