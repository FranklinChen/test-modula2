all:	hello

hello:	hello.mod
	gm2 $^ -o $@

.PHONY:	hello
