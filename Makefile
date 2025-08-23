all: install

packages = ack bash git jj nethack rspec sh tig tmux wget X11 zsh

install:
	stow --verbose --target=${HOME} $(packages)

clean:
	stow --verbose --target=${HOME} --delete $(packages)

.PHONY: all install clean
