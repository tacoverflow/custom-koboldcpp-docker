#!/bin/bash
set -eux

modela="./models/TheBloke/llama2_7b_chat_uncensored-GGUF/llama2_7b_chat_uncensored.Q4_K_M.gguf"
modelb="./models/TheBloke/Wizard-Vicuna-13B-Uncensored-GGML/Wizard-Vicuna-13B-Uncensored.ggmlv3.q2_K.bin"
modelc="./models/TheBloke/dolphin-2.0-mistral-7B-GGUF/dolphin-2.0-mistral-7b.Q4_K_M.gguf"
modeld="./models/eachadea/ggml-vicuna-7b-4bit/ggml-vicuna-7b-4bit-rev1.bin"
modele="./models/TheBloke/Mistral-7B-OpenOrca-GGUF/mistral-7b-openorca.Q8_0.gguf"
modelf="./models/TheBloke/dolphin-2.2.1-mistral-7B-GGUF/dolphin-2.2.1-mistral-7b.Q5_K_M.gguf"
modelg="./models/TheBloke/Dolphin-Llama-13B-GGUF/dolphin-llama-13b.Q4_K_M.gguf"

podman run --rm \
  --network host \
  -it \
  --device /dev/dri/renderD128:/dev/dri/renderD128 \
  -v `pwd`/../models/:/tmp/koboldcpp/models \
  koboldcpp:20231014 \
  python koboldcpp.py --threads 1 $modelf  --host 0.0.0.0 --port 5000 --smartcontext  

  # python koboldcpp.py --threads 1 $modelf  --host 0.0.0.0 --port 5000 --smartcontext --gpulayers 43 --useclblast 2 0 
