.DEFAULT_GOAL := help

_dv_regex = grep '\d\d\d\d-\d\d-\d\d \[v\d\+\.\d\+\.\d\+\]' CHANGELOG.md | head -1
_dv_sed = sed 's|^\#* \(.*\) \[\(.*\)\]|\1 \2|'

DATE = $$($(_dv_regex) | $(_dv_sed) | cut -d' ' -f1)
VERSION = $$($(_dv_regex) | $(_dv_sed) | cut -d' ' -f2)

DOCKER_CMD = podman run --rm --volume "${PWD}:/data" "development-guidelines" --from=markdown --listings

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":[^#]*?## "}; {printf "\033[36m%-50s\033[0m %s\n", $$1, $$2}'

init:
	mkdir build 2>/dev/null || true

.PHONY: pre-build
pre-build: init
	rm -rf build/
	cp -rv src build
	podman build -t "development-guidelines" .

.PHONY: build
build: build-dg build-ag ## Build all version of document

build-dg: ## Build Development Guidelines versions
	$(MAKE) build-pdf-dg
	$(MAKE) build-html-dg

build-ag : ## Build API Guidelines versions
	$(MAKE) build-pdf-ag
	$(MAKE) build-html-ag

.PHONY: build-pdf-dg
build-pdf-dg: ## Build PDF version of Development Guidelines
	$(MAKE) document=DG source=DEVELOPMENT version=${VERSION} _build-pdf

.PHONY: build-html-dg
build-html-dg: ## Build HTML version of Development Guidelines
	$(MAKE) document=DG source=DEVELOPMENT version=${VERSION} _build-html

.PHONY: build-pdf-ag
build-pdf-ag: ## Build PDF version of API Guidelines
	$(MAKE) document=AG source=API version=${VERSION} _build-pdf

.PHONY: build-html-ag
build-html-ag: ## Build HTML version of API Guidelines
	$(MAKE) document=AG source=API version=${VERSION} _build-html

.PHONY: _build-pdf
_build-pdf: pre-build
	sed "s|YYYY-MM-DD|${DATE}|g;s|vX.Y.Z|$(version)|g" src/_title-$(document).md > build/title.md
	$(DOCKER_CMD) --output releases/SOK-$(document)$(version).pdf \
		--to=latex \
		--template=lib/eisvogel.tex \
		--standalone build/title.md src/$(source)-GUIDELINES.md
	ln -sf SOK-$(document)$(version).pdf releases/latest-$(document).pdf

_build-html: pre-build 
	sed "s|YYYY-MM-DD|${DATE}<br />$(version)|g" src/_title-$(document).md > build/title.md
	$(DOCKER_CMD) --output releases/SOK-$(document)$(version).html \
		--standalone build/title.md build/logo-$(document).md src/$(source)-GUIDELINES.md \
		--number-sections
	ln -sf SOK-$(document)$(version).html releases/latest-$(document).html

.PHONY: release
release: build ## Commit release and tag it
	git add CHANGELOG.md
	git add src/DEVELOPMENT-GUIDELINES.md
	git add releases/latest-DG.html
	git add releases/latest-DG.pdf
	git add releases/latest-AG.html
	git add releases/latest-AG.pdf
	git add releases/SOK-DG${VERSION}.html
	git add releases/SOK-DG${VERSION}.pdf
	git add releases/SOK-AG${VERSION}.html
	git add releases/SOK-AG${VERSION}.pdf
	git commit -m "Release $$(echo ${VERSION} | sed 's|^v||')"
	@git tag $$(echo ${VERSION} | sed 's|^v||')
	@git tag -n | tail -1

.PHONY: release-notes
release-notes: ## Extract latest release notes for argument v=X.Y.Z
	./scripts/release-notes.sh $(v)
