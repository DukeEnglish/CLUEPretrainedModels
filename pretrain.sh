
# --input_file=gs://clue_storage/clue_pretrain_corpus/raw_txt_corpus/train/clue_pretrain_$l.txt   \
# --output_file=gs://clue_storage/clue_pretrain_corpus/tfrecords/bert_base_128_c5_vocab8k/clue_pretrain128_$i.tfrecord \
# --vocab_file=./RoBERTa-tiny-clue/vocab.txt  \


INPUT_DIR=gs://clue_storage/clue_pretrain_corpus/tfrecords/tiny_train/*
OUT_PUT_DIR=gs://clue_storage/clue_pretrain_corpus/pretraining_output_310_100test
TPU_IP=10.240.1.2
# bert_base/vocab_clue.txt

nohup python3 run_pretraining.py \
  --input_file=$INPUT_DIR \
  --output_dir=$OUT_PUT_DIR \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=./bert_base/bert_config.json \
  --train_batch_size=4096 \
  --max_seq_length=512 \
  --max_predictions_per_seq=51 \
  --num_train_steps=12500 \
  --num_warmup_steps=1000 \
  --learning_rate=0.00176  \
  --save_checkpoints_steps=2000 \
  --num_tpu_cores=8 --use_tpu=True --tpu_name=grpc://$TPU_IP:8470 &


# python3 run_pretraining.py \
#   --input_file=/tmp/tf_examples.tfrecord \
#   --output_dir=/tmp/pretraining_output \
#   --do_train=True \
#   --do_eval=True \
#   --bert_config_file=./RoBERTa-tiny-clue/bert_config.json \
#   --init_checkpoint=./RoBERTa-tiny-clue/bert_model.ckpt \
#   --train_batch_size=32 \
#   --max_seq_length=128 \
#   --max_predictions_per_seq=20 \
#   --num_train_steps=20 \
#   --num_warmup_steps=10 \
#   --learning_rate=2e-5
