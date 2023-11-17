FROM python:3.10-bullseye
RUN apt update -y
RUN apt install -y build-essential make gcc git wget
RUN apt install -y libclblast-dev libopenblas-dev
WORKDIR /tmp/
RUN git clone https://github.com/LostRuins/koboldcpp.git
WORKDIR /tmp/koboldcpp
# For AMD GPU uncomment next line
# RUN LLAMA_CLBLAST=1 make -j4 
# For CPU only uncomment next line
# RUN make -j4 
# For NVIDIA GPU uncomment next line
RUN LLAMA_CUBLAS=1 make -j4 

