# Packages

There are a variety of frameworks out there that can facilitate running an API fairly quickly. One that I am familiar with and which is fairly common and well established in the industry is called `Flask`.

With this exercise we will install `Flask` onto your computer and hopefully run it later to be able to stand up an API from scratch.

## What is here

This folder contains a file called `requirements.txt` and that is really it. We will use the requirements file to know what needs to be installed and then we will move onto the next part of the tutorial once we have installed it.

## Doing this tutorial

So like I mentioned, we will use `Flask` and `Flask` is a "package" available for you to download and run. Packages are bundles of software that somebody else wrote which you thankfully do not need to rewrite from scratch. You can more or less borrow someone elses code and run it to do your own thing, whatever that may be. `Flask` will be the package we install and later we will make an API with it.

## Goal of part 01

We want to get you set up with a virtual environment that enables you to run a Python `Flask` application on your computer.

### Wait... wtf is a virtual environment

Ahh right... more new terminology. So... Python has a set of "core" or "standard" packages that are basically _always_ going to be installed and usable for you. Then there are things like `Flask`, which do neat and useful stuff but need to be installed from the outside world. Usually a package like `Flask` has certain "dependencies" (i.e. other packages/libraries that do something else useful) and as with all packages, they come out in various versions over time. Sometimes they get a new version because there is new better stuff it can do, sometimes they fix security vulnerabilities, sometimes they just redo everything from scratch because the old version is trash. Anything can happen between certain version changes. So when we look at those 2 things:

1. Packages are useful and often come with other packages as dependencies
2. Packages can change versions over time and change the way they work

That can mean, if you just install all the packages that you want to use and have them lying around on your computer willy-nilly, eventually after either a long enough time or a large enough number of packages you will encounter a "dependency conflict" where something like this may occur.

> "I installed `package-A` a while back for this one project and now I want to install `package-B` for this other project, but Python won't let me! Apparently both of them have `package-C` as a dependency but `package-A` uses version `1.0` of `package-C` and `package-B` uses version `2.0`. Those 2 versions are fundamentally incompatible so now I am hosed! I will have to uninstall one or the other :( "

This actually happens a lot and is a problem you have to work with often in Python and many other languages as well. The solution in Python? Virtual Environments. Essentially you have your "base installation" of Python which is just whatever you installed on your laptop, then you can have as many virtual environments as you have projects. Each project has its own isolated set of dependencies and despite the existence of conflicts between them, as long as they're in a virtual environment, you can always run them just fine within their own environment and not have to worry about silly dependencies.

## Virtual Env Setup

So there are a lot of way to use virtual environments in python. One way I like doing it is through the `virtualenv-wrapper` which gives you a way to easily do it from the command line without worrying about a bunch of files clogging up your projects.

### Installing More Software (yay)

Do me a solid and install that via the [following instructions](https://virtualenvwrapper.readthedocs.io/en/latest/install.html)

#### Actually doing this

Then once that is done you should be able to see your virtual environments via 

```bash
lsvirtualenv
``` 

on the command line. Create a new one called `api` via the following command

```bash
mkvirtualenv api
```

then you can install all of the packages you need!

How do I do that? Easy! Use `pip` which is python's package management tool. You can install things using pip via either `pip install <package-name-here>` or `pip install -r requirements.txt` where `requirements.txt` is a file containing a specific set of packages and their required versions. If at any point you are wondering "what packages do I have installed right now?" then you can run `pip freeze` and it will print that list out for you. Using a `requirements.txt` file is a great way to "pin" down the packages and their versions that you are using for a project and to pass that information on to others who wish to run the same project.

Try installing the `requirements.txt` file that is in this folder right now into your virtual environment. If you finish that much, then we are done here!

#### Helpful other things:

- To "leave" your current virtualenv, use `deactivate`
- To re-enter that virtualenv or to enter another one, use `workon <virtualenv-name>`
