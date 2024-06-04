#!/bin/bash
seed=(111 222 333 444 555 666 777 888 999)

for round in 0 1 2 3 4;
do
    for ft_task in 'unfair_tos';
    do
        CUDA_VISIBLE_DEVICES=1 WANDB_MODE=offline python train.py \
      --dataset_name ${ft_task} \
      --do_train \
      --do_eval \
      --max_seq_length 512 \
      --learning_rate 1e-5 \
      --cache_dir ./cache \
      --model_name_or_path  nlpaueb/legal-bert-base-uncased \
      --seed ${seed[$round]} \
      --num_train_epochs 8 \
      --per_device_train_batch_size 32 \
      --output_dir ./result/$ft_task'_seed'$round \
      --save_strategy epoch \
      --logging_strategy epoch \
      --evaluation_strategy epoch \
      --load_best_model_at_end True \
      --save_total_limit 1
    done
done


