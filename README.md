Personal Dotfile Collection
===========================

My config files for Mac OS X and Linux.

Installation
------------

```bash
$ git clone git://github.com/camdez/dotfiles.git
$ cd dotfiles
$ git submodule init
$ git submodule update
```

Included is a simple script that will symlink the config files into
place. It'll also gently move aside any existing files instead of
overwriting them.

If you don't want to install everything you can comment out lines in
`bin/movein.sh`. When you're ready to install simply run:

```bash
$ cd dotfiles
$ bin/movein.sh
```

Configuration
-------------

Make sure to edit `dot-gitconfig` to contain your own name and email
address instead of mine.

Gibberish
---------

I don't guarantee that nothing bad will happen if you use these
files. That said, I've certainly done nothing intentionally malicious.

Jack whatever code you want of course; give credit if I've done
something clever (I try to do the same)--props never hurt anyone.

On a personal note, *be kind to your command-line*; learn to love it.
It's your best link to the past and the closest you'll ever get to
wielding magic.  Harness the incantations and scare the common folk.

**Author:** Cameron Desautels \<<camdez@gmail.com>\>  
**Source:** <http://github.com/camdez/dotfiles>
