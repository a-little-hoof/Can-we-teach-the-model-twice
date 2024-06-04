#! /bin/bash
seed=(111 222 333 444 555 666 777 888 999)
ft_task=('scotus' 'ledgar')

for round in 0 1 2 ;
do
    CUDA_VISIBLE_DEVICES=2 WANDB_MODE=offline python train.py \
    --dataset_name scotus \
    --do_train \
    --do_eval \
    --max_seq_length 512 \
    --learning_rate 1e-5 \
    --cache_dir ./cache \
    --model_name_or_path ./result/ledgar'_seed'$round \
    --seed ${seed[$round]} \
    --num_train_epochs 5 \
    --per_device_train_batch_size 32 \
    --output_dir ./result/second_scotus'_seed'$round \
    --save_strategy no \
    --logging_strategy epoch \
    --evaluation_strategy epoch 
done


