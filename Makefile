.PHONY: all

all: .venv/.requirements.txt.d

.venv/.requirements.txt.d: requirements.txt
	@if [ ! -d ".venv" ]; then \
		echo "Virtual environment missing. Creating..."; \
		virtualenv .venv; \
		echo "Virtual environment created. Please activate with \"source .venv/bin/activate\" and re-run make."; \
		exit 1; \
	fi
	@if [ "$(realpath $(VIRTUAL_ENV))" != "$(realpath .venv)" ]; then \
		echo "Not in local Python virtual environment."; \
		exit 1; \
	fi
	virtualenv --clear .venv
	pip install -r requirements.txt
	touch .venv/.requirements.txt.d
