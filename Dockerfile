FROM python:3
RUN pip install imageio
# install ffmpeg from imageio.
RUN python -c "import imageio; imageio.plugins.ffmpeg.download()"

FROM bethgelab/deeplearning:cuda9.0-cudnn7

SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get -y install ffmpeg
RUN apt-get -y install openssh-server openssh-client

RUN pip install --upgrade pip

RUN pip install tensorflow-gpu==1.8

RUN pip3 install deeplabcut

RUN pip install ipywidgets
RUN pip3 install ipywidgets

RUN pip3 install seaborn

ENV DLClight=True
