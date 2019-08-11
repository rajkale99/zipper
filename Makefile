NAME ?= Dark-Ages


DATE := $(shell date "+%d%m%Y-%I%M")

CODE := El-Noveno

VERSION := 4.9

SZIP := $(NAME)-$(CODE)-$(VERSION)-STABLE-$(DATE).zip
BZIP := $(NAME)-$(CODE)-$(VERSION)-BETA-$(DATE).zip


EXCLUDE := Makefile *.git* *.jar* Dark-Ages* *placeholder*

stable: $(SZIP)
beta: $(BZIP)

$(SZIP):
	@echo "Creating ZIP: $(SZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

$(BZIP):
	@echo "Creating ZIP: $(BZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf "$(NAME)-"*.zip*
	@rm -vf boot/zImage
	@echo "Done."

