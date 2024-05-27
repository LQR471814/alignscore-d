FROM python:3.10-alpine

RUN apk add git

WORKDIR /alignscore-d

RUN git clone https://github.com/yuh-zha/AlignScore.git --depth 1 .

# install external deps
RUN apk add clang
RUN apk add openmp openmp-dev
RUN apk add g++

RUN pip install "torch<2,>=1.12.1" -f https://download.pytorch.org/whl/torch_stable.html

RUN apk add cmake make

RUN pip install .
RUN python3 -m spacy download en_core_web_sm

CMD sh

