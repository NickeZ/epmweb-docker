FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade \
    pip

RUN pip3 install \
    flask \
    flask-api \
    flask-markdown \
    sqlalchemy \
    toml \
    siphash

RUN git clone https://github.com/nickez/epmweb \
    && cd epmweb \
    && git checkout dd6a84d

EXPOSE 5000

CMD ["./epmweb/epmweb.py", "--host", "0.0.0.0"]
