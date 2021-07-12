.DEFAULT_GOAL := help

_dv_regex = grep '\d\d\d\d-\d\d-\d\d \[v\d\+\.\d\+\.\d\+\]' CHANGELOG.md
_dv_sed = sed 's|^\#* \(.*\) \[\(.*\)\]|\1 \2|'
DATE = $$($(_dv_regex) | $(_dv_sed) | cut -d' ' -f1)
VERSION = $$($(_dv_regex) | $(_dv_sed) | cut -d' ' -f2)

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":[^#]*?## "}; {printf "\033[36m%-50s\033[0m %s\n", $$1, $$2}'

init:
	mkdir build 2>/dev/null || true

.PHONY: build
build: init
	rm -rf build/
	cp -rv src build
	docker build -t "development-guidelines" .
	sed 's|YYYY-MM-DD|2021-07-12|g;s|vX.Y.Z|v1.2.3|g' src/_title.md > build/title.md
	docker run --rm --volume "${PWD}:/data"  "development-guidelines" \
		--output releases/SOK-DG${VERSION}.pdf \
		--from=markdown \
		--to=latex \
		--template=lib/eisvogel.tex \
		--standalone build/title.md src/DEVELOPMENT-GUIDELINES.md \
		--listings
	ln -sf SOK-DG${VERSION}.pdf latest.pdf