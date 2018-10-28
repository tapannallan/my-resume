FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing
RUN DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install texlive-latex-extra latexmk texlive-fonts-extra
COPY ./ my-resume/
