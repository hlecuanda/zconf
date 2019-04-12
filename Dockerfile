FROM continuumio/miniconda2

# install gcc and common build dependencies
RUN apt-get update \
 && apt-get install -y \
      build-essential \
      pylint

WORKDIR /zconf

COPY . .

# install dependencies and fix tkinter error
# https://stackoverflow.com/questions/37604289/tkinter-tclerror-no-display-name-and-no-display-environment-variable
RUN pip install -r requirements.txt \
 && conda install -y -c conda-forge pynfft \
 && echo "backend: Agg" >> /opt/conda/lib/python
