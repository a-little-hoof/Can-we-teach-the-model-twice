# Can-We-Teach-the-Model-Twice

> BDMI project
> 
> Detail descriptions can be found in the report.

## Data

- Use the following code in a device can connect to huggingface:
  
  ```python
  from datasets import load_dataset
  
  dataset = load_dataset("lex_glue", "case_hold", cache_dir="your/path")
  ```

- Then use the scp command to move your data to a server.

## Training

- Example shell script canbe found in run.sh, test.sh and unfair.sh

- All the parameters explanations can be found on huggingface.
