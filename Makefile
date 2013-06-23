all: test

test:
	clm -h 100M Test -o test

.PHONY: all test
