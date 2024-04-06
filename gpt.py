import subprocess
import os

command = "nohup ~/apps/ollama/ollama serve >/dev/null 2>&1 &"
subprocess.Popen(command, shell=True)

def prompt(what):
    return f"You will answer the prompt as simple as possible. Do not overcomplicate your output. [PROMPT:{what}]"

ask = input("[You]:> ")
prompt_message = prompt(ask)
os.system(f'~/apps/ollama/ollama run tinyllama "{prompt_message}"')