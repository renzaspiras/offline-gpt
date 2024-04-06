if [ "$1" = "TERMUX" ]; then
  yes | pkg upgrade
  yes | pkg install git cmake golang python

  git clone --depth 1 https://github.com/ollama/ollama.git ~/apps/ollama
  cd ~/apps/ollama
  go generate ./...
  go build .

  chmod -R 700 ~/go
  rm -r ~/go

  gcc ~/temp/gpt.c -o ~/apps/ollama/gpt  
  mv ~/temp/gpt.py ~/bin/gpt.py

  nohup ~/apps/ollama/ollama serve &
  ~/apps/ollama/ollama pull tinyllama
fi
