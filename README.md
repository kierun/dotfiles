# GO AWAY

There is literally nothing to see here…

## Install

+ `git submodule update --init --recursive --remote`
+ `git submodule foreach git pull origin master`
+ [Managing Your Dotfiles AKA Dotfiles Are Not Meant to Be Forked](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
+ [dotbot](https://github.com/anishathalye/dotbot)

## Git submodule fuckery

Run in order:

+ On one host: `git submodule update --init --recursive --remote`
+ On the same host `git commit -am "chore(git): Updated sub modules" && git push'
+ Then on all other hosts: `git up && git submodule update`
