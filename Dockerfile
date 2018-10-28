FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update --fix-missing
RUN DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install texlive-latex-extra latexmk texlive-fonts-extra
RUN mkdir output
COPY ./ my-resume/
RUN cd my-resume && pdflatex -shell-escape -synctex=1 -interaction=nonstopmode resume.tex