#!/usr/bin/env bash
GS_DATA_DIR=gs://clue_storage/clue_pretrain_corpus/raw_txt_corpus/train/


for((i=$1;i<=$2;i++));
do
  printf -v l "%07d" $i
  echo $l                                 # original: bert_base_128_vocab8k
  # 下载到本地
  gsutil -m cp -r gs://clue_storage/corpus2020/clue_pretrain_train_0000.zip .
  unzip clue_pretrain_train_000$l.zip -d clue_pretrain_train_000$l/
  gsutil -m cp clue_pretrain_train_000$l/* $GS_DATA_DIR/

done
wait
echo "Finish"
　