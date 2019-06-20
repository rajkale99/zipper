NAME ?= Dark-Ages


DATE := $(shell date "+%d%m%Y-%I%M")

CODE := El-Octavo

ZIP := $(NAME)-$(CODE)-$(DATE).zip
EZIP := $(NAME)-$(CODE)-EAS-$(DATE).zip
CZIP := $(NAME)-$(CODE)-Clang-$(DATE).zip


EXCLUDE := Makefile *.git* *.jar* Dark-Ages* *placeholder*

normal: $(ZIP)
eas: $(EZIP)
clang: $(CZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

$(EZIP):
	@echo "Creating ZIP: $(EIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

$(CZIP):
	@echo "Creating ZIP: $(CZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf "$(NAME)-"*.zip*
	@rm -vf boot/zImage
	@echo "Done."

