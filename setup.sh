if [ "$1" = "TERMUX" ]; then
  yes | pkg upgrade
  yes | pkg install git cmake golang python

  git clone --depth 1 https://github.com/ollama/ollama.git ~/apps/ollama
  cd ~/apps/ollama
  go generate ./...
  go build .

  chmod -R 700 ~/go
  rm -r ~/go

  gcc ~/temp/ollama/gpt.c -o ~/apps/ollama/gpt  
  mv ~/temp/gpt.py ~/apps/ollama/gpt.py

  nohup ~/apps/ollama/ollama serve >/dev/null 2>&1 &
  ~/apps/ollama/ollama pull tinyllama
fi
