all: test start

test:
	clm -h 100M Test -o test

start:
	clm -h 100M Start -o start

.PHONY: all
