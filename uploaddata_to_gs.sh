#!/usr/bin/env bash
for((i=$1;i<=$2;i++));
do
  printf -v l "%07d" $i
  echo $l                                 # original: bert_base_128_vocab8k
  wget https://storage.cloud.google.com/clue_storage/corpus2020/clue_pretrain_train_000$l.zip
  unzip clue_pretrain_train_000$l.zip

done
wait
echo "Finish"
