## Introduction

This is a collection of codes and snippets, that i use for demo at
Cebu Code Camp.

## Refactoring catalog

Most of the refactoring examples here, i found from Martin Fowler's
refactoring book/site. You can find the catalog on this link:

  http://refactoring.com/catalog/

## Setup

If you haven't installed any Ruby interpreter yet, you should install
one using rvm.

Why? It's so much easier to manage multiple ruby versions with rvm,
than having a single system-wide ruby installation. It will also allow
you to install gems without needing a sudo.

But before RVM, make sure you have the necessary environment to
compile stuffs. This one varies depending on your environment.

### For Mac

Install Homebrew.

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

This one actually need a system-wide installed Ruby. The latest OS X
already have Ruby built-in.

### For Ubuntu

Install via Aptitude.

```
$ sudo apt-get update
$ sudo apt-get -y install ruby ruby-dev irb rake
$ sudo apt-get -y install git-core
$ sudo apt-get -y install software-properties-common apt-transport-https curl wget
$ sudo apt-get -y install build-essential libssl-dev libtool
$ sudo apt-get -y install htop openssl ssl-cert
$ sudo apt-get -y install libcurl4-openssl-dev libmysqlclient-dev libxml2-dev libxslt-dev
```

### Install RVM

From [rvm.io](http://rvm.io/).

```
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
```

### Install and use ruby 2.2

```
$ rvm install ruby-2.2.4
$ rvm ruby-2.2.4 --default
```

Then install bundler, to allow use of bundle

```
$ gem install bundler
```
