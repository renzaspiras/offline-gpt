import subprocess
import os

def start_ollama():
    command = "nohup ~/apps/ollama/ollama serve >/dev/null 2>&1 &"
    subprocess.Popen(command, shell=True)

def prompt(what):
    return f"You will answer the prompt as simple as possible. Do not overcomplicate your output. [PROMPT:{what}]"

start_ollama()

while True:
    ask = input("[You]:> ")
    if ask.lower() == "exit":
        break
    else:
        prompt_message = prompt(ask)
        os.system(f'~/apps/ollama/ollama run tinyllama "{prompt_message}"')

# Close the app
os.system("pkill -f ollama")