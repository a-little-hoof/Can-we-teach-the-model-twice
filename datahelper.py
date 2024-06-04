from datasets import Dataset,load_dataset,concatenate_datasets,ClassLabel
import datasets
import json
import os
import argparse
import random
import numpy as np


def get_dataset(dataset_name,part=False):
	'''
	dataset_name: str, the name of the dataset
	sep_token: str, the sep_token used by tokenizer(e.g. '<sep>')
	'''
	dataset = None

	# your code for preparing the dataset...

	dataset = datasets.load_from_disk("./lex/"+dataset_name)
	if part==True and dataset_name=="ledgar":
		dataset = dataset["train"]
		dataset = dataset.filter(lambda example: example["label"]>15 and example["label"]<31)
		dataset = dataset.train_test_split(test_size=0.1, shuffle=True, seed=2002)
	if dataset_name=="unfair_tos":
		dataset = concatenate_datasets([dataset["train"], dataset["test"],dataset["validation"]])
		dataset = dataset.filter(lambda example: len(example["labels"])==1)
		dataset = dataset.train_test_split(test_size=0.1, shuffle=True, seed=2002)
	print(dataset["train"][0:100])
	print(dataset)
	

		
		

	return dataset

if __name__ == "__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument('-d', '--dataset', type=str, required=True, help='name of the dataset, choose between case_hold, ecthr_a, ecthr_b, eurlex, ledgar, scotus, unfair_tos')
	parser.add_argument('-p','--part',type=bool,required=False,default=False)
	args = parser.parse_args()
	dataset,part = args.dataset,args.part
	dataset = get_dataset(dataset,part)