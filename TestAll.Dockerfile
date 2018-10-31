FROM elixir:alpine

COPY . ./

RUN sh _scripts/test_all.sh
