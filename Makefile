.DEFAULT_GOAL := help

_dv_regex = grep '\d\d\d\d-\d\d-\d\d \[v\d\+\.\d\+\.\d\+\]' CHANGELOG.md | head -1
_dv_sed = sed 's|^\#* \(.*\) \[\(.*\)\]|\1 \2|'

DATE = $$($(_dv_regex) | $(_dv_sed) | cut -d' ' -f1)
VERSION = $$($(_dv_regex) | $(_dv_sed) | cut -d' ' -f2)

DOCKER_CMD = docker run --rm --volume "${PWD}:/data" "development-guidelines" --from=markdown --listings

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":[^#]*?## "}; {printf "\033[36m%-50s\033[0m %s\n", $$1, $$2}'

init:
	mkdir build 2>/dev/null || true

.PHONY: pre-build
pre-build: init
	rm -rf build/
	cp -rv src build
	docker build -t "development-guidelines" .

.PHONY: build
build: build-pdf build-html ## Build all version of document

.PHONY: build-pdf
build-pdf: ## Build PDF version of document
	$(MAKE) document=DG _build-pdf

.PHONY: build-html
build-html: ## Build HTML version of document
	$(MAKE) document=DG _build-html

.PHONY: _build-pdf
_build-pdf: pre-build
	sed "s|YYYY-MM-DD|${DATE}|g;s|vX.Y.Z|${VERSION}|g" src/_title-$(document).md > build/title.md
	$(DOCKER_CMD) --output releases/SOK-$(document)${VERSION}.pdf \
		--to=latex \
		--template=lib/eisvogel.tex \
		--standalone build/title.md src/DEVELOPMENT-GUIDELINES.md
	ln -sf SOK-$(document)${VERSION}.pdf releases/latest-$(document).pdf

_build-html: pre-build 
	sed "s|YYYY-MM-DD|${DATE}<br />${VERSION}|g" src/_title-$(document).md > build/title.md
	$(DOCKER_CMD) --output releases/SOK-$(document)${VERSION}.html \
		--standalone build/title.md build/logo.md src/DEVELOPMENT-GUIDELINES.md \
		--number-sections
	ln -sf SOK-$(document)${VERSION}.html releases/latest-$(document).html

.PHONY: release
release: build ## Commit release and tag it
	git add CHANGELOG.md
	git add src/DEVELOPMENT-GUIDELINES.md
	git add releases/latest.html
	git add releases/latest.pdf
	git add releases/SOK-DG${VERSION}.html
	git add releases/SOK-DG${VERSION}.pdf
	git commit -m "Release $$(echo ${VERSION} | sed 's|^v||')"
	@git tag $$(echo ${VERSION} | sed 's|^v||')
	@git tag -n | tail -1

.PHONY: release-notes
release-notes: ## Extract latest release notes for argument v=X.Y.Z
	./scripts/release-notes.sh $(v)
