all: install

install:
	stow --verbose --target=${HOME} */

uninstall:
	stow --verbose --target=${HOME} --delete */

dryrun:
	stow --verbose --target=${HOME} --simulate */

.PHONY: all install uninstall dryrun
