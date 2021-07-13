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
build-pdf: pre-build ## Build PDF version of document
	sed "s|YYYY-MM-DD|${DATE}|g;s|vX.Y.Z|${VERSION}|g" src/_title.md > build/title.md
	$(DOCKER_CMD) --output releases/SOK-DG${VERSION}.pdf \
		--to=latex \
		--template=lib/eisvogel.tex \
		--standalone build/title.md src/DEVELOPMENT-GUIDELINES.md
	ln -sf SOK-DG${VERSION}.pdf releases/latest.pdf

.PHONY: build-html
build-html: pre-build ## Build HTML version of document
	sed "s|YYYY-MM-DD|${DATE}<br />${VERSION}|g" src/_title.md > build/title.md
	$(DOCKER_CMD) --output releases/SOK-DG${VERSION}.html \
		--standalone build/title.md build/logo.md src/DEVELOPMENT-GUIDELINES.md \
		--number-sections
	ln -sf SOK-DG${VERSION}.html releases/latest.html

release:
	@git tag $$(echo ${VERSION} | sed 's|^v||')
	@git tag -n | head -1
