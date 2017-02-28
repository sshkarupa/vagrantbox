## Introduction

Vagrantbox builds an environment on your machine ready for installing Ruby
application (Ruby on Rails, Sinatra, etc.) without any additional changes to
your machine.

### Host machine vs Guest machine

In this README "host machine" will be used to refer to the native machine on
which vagrant is installed. Once you ssh into the vagrant machine that machine
will be referred to as "guest machine"

## Using vagrantbox

1. [Installing Dependencies](#installing-dependencies)
2. [Setting up machine using vagrant](#setting-up-the-guest-machine-using-vagrant)
3. [Using vagrant](#using-guest-machine)

### Installing Dependencies

Please install following tools

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://www.vagrantup.com/downloads.html)
* [Ansible](http://docs.ansible.com/intro_installation.html)

  Note: In ubuntu I'm using `nfs: true` option in Vagrantfile to increase
  performance of synced folders. Before using synced folders backed by NFS, the
  host machine must have `nfsd` installed, the NFS server daemon. This comes
  pre-installed on Mac OS X, and is typically a simple package install on Linux.
  If you have a problem with this, take a look here: [Problems with nfs shares
  on
  Debian](http://jb-blog.readthedocs.io/en/latest/posts/0021-vagrant-nfs-problems.html)

#### Setting up the guest machine using vagrant

Before cloning `vagrantbox` cd into the project directory.
Let's say that project directory is `myproject`.

```
$ cd myproject
$ git clone https://github.com/sshkarupa/vagrantbox.git
$ rsync -avh vagrantbox/* .
$ rm -rf vagrantbox
$ echo .vagrant >> .gitignore
```

* Open `ansible/provision.yml` and change the ruby version to the one you want.
Also you can switch `install` options as `true` or `false` for some tasks.

* After making the above mentioned changes execute the following command. Please
note that it could take up to 15 minutes for the guest machine to be built,
depending on your download speed. During the installation process you will see
lots of outputs because the script has been set to super verbose mode to show
all the data it can.

```
vagrant up
```

#### Using guest machine

Execute following commands to get into the guest machine.

```
vagrant ssh
```
Once you are inside the guest machine the command prompt will change to look like this:

```
vagrant ~
```

Notice that the prompt starts with `vagrant`. It means that you are in the guest machine.

In the host machine the directory that had `Vagrantfile` is mapped to
`/vagrant` on the guest machine.

```
cd /vagrant
```

### Installations on the guest machine

* [rbenv](http://rbenv.org/)
* [PostgreSQL](http://www.postgresql.org)
* [ImageMagick](http://www.imagemagick.org)
* [PhantomJS](http://phantomjs.org)
* [Node.js](http://nodejs.org)
* [curl](http://curl.haxx.se)
* [git](http://git-scm.com)
* [redis](http://redis.io/)
* [Heroku toolbelt](https://toolbelt.heroku.com)


### Verify that PostgreSQL is working

To test if postgresql is properly working, execute following commands on the guest machine.

Note that password is blank for the user 'postgres'.

```
psql -h localhost -U postgres --password
enter password:
SELECT table_name FROM information_schema.tables WHERE table_schema='public';
```

You should see the result with zero row. It means postgres is wroking fine. Now to exit out of `psql` type `\q` and hit enter.

```
postgres=# \q
```

### Mapping port from guest machine

```
sudo echo '172.168.35.15 vagrant.dev' >> /etc/hosts
```
