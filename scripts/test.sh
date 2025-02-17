  CUDA_VISIBLE_DEVICES=1 WANDB_MODE=offline python train.py \
      --dataset_name unfair_tos \
      --do_train \
      --do_eval \
      --max_seq_length 512 \
      --learning_rate 1e-5 \
      --cache_dir ./cache \
      --model_name_or_path nlpaueb/legal-bert-base-uncased \
      --seed 1111 \
      --num_train_epochs 5 \
      --per_device_train_batch_size 32 \
      --output_dir ./result/seed \
      --save_strategy epoch \
      --logging_strategy epoch \
      --evaluation_strategy epoch \
      --load_best_model_at_end True \
      --save_total_limit 1