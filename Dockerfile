FROM "ubuntu"
RUN apt-get update && yes | apt-get upgrade
RUN mkdir -p /tensorflow/models
RUN apt-get -yqq update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get install -yqq python3.6
RUN apt-get -yqq install python3-pip	
#RUN pip3 install --no-cache-dir tensorflow==2.2.0
RUN pip3 install Cython
RUN apt-get install -y git
RUN pip3 install contextlib2
RUN apt-get install -y protobuf-compiler python-pil python-lxml
RUN pip3 install jupyter
RUN pip3 install matplotlib
#RUN git clone https://github.com/tensorflow/models.git /tensorflow/models
WORKDIR /tensorflow/models/research
RUN protoc object_detection/protos/*.proto --python_out=.
RUN export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim