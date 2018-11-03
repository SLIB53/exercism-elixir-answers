FROM elixir:alpine

WORKDIR /home/exercism-elixir-answers/

COPY . ./

RUN sh _scripts/test_all.sh

CMD [ "/bin/sh" ]
