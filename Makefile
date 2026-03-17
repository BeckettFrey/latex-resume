IMAGE := $(shell cat docker-image)

.PHONY: all clean

# Default target
all: clean resume.pdf

# Compile resume.tex to PDF using Docker with latexmk
resume.pdf: resume.tex
	docker run --rm --platform linux/amd64 -v "$(PWD):/workspace" -w /workspace $(IMAGE) \
		latexmk -pdf -interaction=nonstopmode resume.tex

# Remove all generated LaTeX build artifacts (even resume.pdf)
clean:
	latexmk -C
