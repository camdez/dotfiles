all: install

packages = ack bash git nethack rspec sh tmux wget X11 zsh

install:
	stow -t ${HOME} $(packages)

clean:
	stow -t ${HOME} -D $(packages)

.PHONY: all install clean
