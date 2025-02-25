#!/bin/bash


export CUDA_VISIBLE_DEVICES=0
version="baseline"
dataroot2="dstc10_code/data"
num_gpus=1
ver="test_p2"

python3 baseline.py --generate runs/rg-hml128-kml128-post-train/checkpoint-4632 \
   --generation_params_file baseline/configs/generation/generation_params.json \
   --eval_dataset val \
   --dataroot ${dataroot2} \
   --output_file dstc10_code/gn_${ver}.json &&

python3 dstc10_code/scripts/scores.py --dataset val --dataroot dstc10_code/data/ --outfile dstc10_code/gn_${ver}.json \
   --scorefile dstc10_code/gn${ver}.score.json &&


cat dstc10_code/gn${ver}.score.json

