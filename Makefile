all: install

install:
	stow --verbose --target=${HOME} */

clean:
	stow --verbose --target=${HOME} --delete */

dryrun:
	stow --verbose --target=${HOME} --simulate */

.PHONY: all install clean dryrun
