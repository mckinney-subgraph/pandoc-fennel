.PHONY: phony help open open-html spellcheck 

DOCUMENT := document

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
        | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

filter-test: ## Test filter
	pandoc --defaults configs/test.yaml $(DOCUMENT).md 

pdf: ## Make a PDF
	pandoc --defaults configs/latex.yaml $(DOCUMENT).md -o build/$(DOCUMENT).pdf

pdf-no-filter: ## Make a PDF with no filters
	pandoc --defaults configs/latex-no-filter.yaml $(DOCUMENT).md -o build/$(DOCUMENT).pdf

html: ## Make an HTML version of the document
	pandoc --defaults configs/html.yaml $(DOCUMENT).md -o build/$(DOCUMENT).html

docx: ## Make a DOCX version of the document
	pandoc --defaults configs/docx.yaml $(DOCUMENT).md -o build/$(DOCUMENT).docx

open: build/$(DOCUMENT).pdf ## Open PDF in default reader
	xdg-open build/$(DOCUMENT).pdf

open-html: build/$(DOCUMENT).html ## Open HTML in default browswer
	xdg-open build/$(DOCUMENT).html

spellcheck: ## Run a spellchecker (aspell)
	if [ -e /usr/bin/aspell ]; then /usr/bin/aspell -c $(DOCUMENT).md; else echo "/usr/bin/aspell missing -- no spellcheck possible";fi

clean: ## Clean built artifacts
	rm build/*
