if [ "$1" = "PTERMUX" ]; then
  rm -rf ~/apps/ollama
  rm ~/bin/gpt.py
  rm ~/bin/gpt

  yes | pkg upgrade
  yes | pkg install git cmake golang python

  git clone --depth 1 https://github.com/ollama/ollama.git ~/apps/ollama
  cd ~/apps/ollama
  go generate ./...
  go build .

  chmod -R 700 ~/go
  rm -r ~/go

  gcc ~/temp/gpt.c -o ~/bin/gpt  
  mv ~/temp/gpt.py ~/apps/ollama/gpt.py

  nohup ~/apps/ollama/ollama serve &
  ~/apps/ollama/ollama pull tinyllama

  rm -rf ~/temp

else
  echo "THE OPERRATING SYSTEM NAMED $1 is not supported on this installation wizzard"  
fi
