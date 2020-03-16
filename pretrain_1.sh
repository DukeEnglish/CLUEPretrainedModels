
# --input_file=gs://clue_storage/clue_pretrain_corpus/raw_txt_corpus/train/clue_pretrain_$l.txt   \
# --output_file=gs://clue_storage/clue_pretrain_corpus/tfrecords/bert_base_128_c5_vocab8k/clue_pretrain128_$i.tfrecord \
# --vocab_file=./RoBERTa-tiny-clue/vocab.txt  \


INPUT_DIR=gs://clue_storage/clue_pretrain_corpus/tfrecords/tiny_train/*
OUT_PUT_DIR=gs://clue_storage/clue_pretrain_corpus/pretraining_output_310_300tiny_berttest_2
TPU_IP=10.240.1.2
# bert_base/vocab_clue.txt
MODEL_DIR=$1
nohup python3 run_pretraining.py \
  --input_file=$INPUT_DIR \
  --output_dir=$OUT_PUT_DIR \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=./$MODEL_DIR/bert_config.json \
  --train_batch_size=128 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=10000 \
  --num_warmup_steps=100 \
  --learning_rate=2e-5  \
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
