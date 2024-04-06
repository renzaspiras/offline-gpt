import subprocess
import os

command = "nohup ~/apps/ollama/ollama serve >/dev/null 2>&1 &"
subprocess.Popen(command, shell=True)

def prompt(what):
  return f"You will answer the prompt as simple as possible. Do not overcomplicate your output. [PROMPT:{what}]";

#os.system();
ask = input("[You]:> ")

os.system("~/apps/ollama/ollama run tinyllama")