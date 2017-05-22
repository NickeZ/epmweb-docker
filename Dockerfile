FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade \
    pip

# Development requirements

RUN pip3 install \
    alembic

# Runtime requirements

RUN pip3 install \
    flask \
    flask-api \
    flask-markdown \
    sqlalchemy \
    toml \
    siphash

WORKDIR app

RUN git clone https://github.com/nickez/epmweb \
    && cd epmweb \
    && git checkout dbfadbd

RUN mkdir db

EXPOSE 5000

WORKDIR epmweb

RUN ./migrate

CMD ["./epmweb.py", "--debug", "--host", "0.0.0.0"]
