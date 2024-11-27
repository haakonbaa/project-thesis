PROJECT = main
SRC_DIR = ./src
BUILD_DIR = ../build
LATEX_ARGS = -output-directory=$(BUILD_DIR) -interaction=errorstopmode \
			 -shell-escape
BIBER_ARGS = --output-directory $(BUILD_DIR)

# Targets
.PHONY: all clean small

all: $(BUILD_DIR)/$(PROJECT).pdf

# we need to run pdflatex multiple times to get the references right :(
$(BUILD_DIR)/$(PROJECT).pdf: $(SRC_DIR)/$(PROJECT).tex
	mkdir -p $(BUILD_DIR)
	cd $(SRC_DIR) && pdflatex $(LATEX_ARGS) $(PROJECT).tex
	cd $(SRC_DIR) && biber $(BIBER_ARGS) $(PROJECT)
	cd $(SRC_DIR) && pdflatex $(LATEX_ARGS) $(PROJECT).tex
	cd $(SRC_DIR) && pdflatex $(LATEX_ARGS) $(PROJECT).tex

# fast compilation, but no bibliography
small: $(SRC_DIR)/$(PROJECT).tex
	mkdir -p $(BUILD_DIR)
	cd $(SRC_DIR) && pdflatex $(LATEX_ARGS) $(PROJECT).tex

clean:
	rm -rf $(BUILD_DIR)/*
