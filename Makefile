PREFIX  ?= /usr/local
VERSION := $(shell cat pkgIndex.tcl | grep -F 'package ifneeded https' | awk '{print $$4}')
INSTALL_DIR = $(PREFIX)/lib/tclhttps$(VERSION)
WORKING_DIR_ABSOLUTE = $(shell pwd)

.PHONY: all
all:
	@echo "Nothing needs to be done."

.PHONY: install
install:
	mkdir -vp "$(INSTALL_DIR)"
	cp -vf license.terms *.tcl "$(INSTALL_DIR)"

.PHONY: test
test:
	@echo "Nothing needs to be done."
