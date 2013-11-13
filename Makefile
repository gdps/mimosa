ERL ?= erl
APP := koth

.PHONY: deps

all: deps
	@./rebar compile

deps:
	@./rebar get-deps

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'

nothing:

test: nothing
	@./rebar eunit skip_deps=true

run: all
	@erl -pa ebin -pa deps/**/ebin -s mimosa_app -config config/example.config
