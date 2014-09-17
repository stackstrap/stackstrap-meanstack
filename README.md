stackstrap-meanstack
====================

[MEAN Stack](https://github.com/linnovate/mean) is a great way
to get yourself running with a good mix of node.js tools

## StackStrap
Literally StackStrap is command line tool that parses development
stack Templates with Jinja and a bit of file management. Keep your
Templates in version control and constantly add in new best practices.

Moreover, StackStrap is a philosophy geared towards helping teams
with many different points of view and skills sets work together 
efficiently in short time frames. System management is all rolled 
in because of the power of Salt.  This means that development environments
are always tailored to the current branch. It is also very keen on 
automation, with the idea that someone just helping integrate some
cool CSS transforms can be ready to run as well.


## Get Going

First install [Vagrant](http://vagrantup.com), if you have not (that also means VirtualBox, eventually).

```bash
sudo easy_install stackstrap

stackstrap template add meanstack https://github.com/stackstrap/stackstrap-meanstack

stackstrap create mynewproject meanstack

cd mynewproject

vagrant up
```

A mental break worth of waiting occurs, but it's worth it, go for a tea.
