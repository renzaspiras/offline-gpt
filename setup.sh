if [ "$1" = "TERMUX" ]; then
  yes | pkg upgrade
  yes | pkg install git cmake golang python

  git clone --depth 1 https://github.com/ollama/ollama.git ~/apps/ollama
  cd ~/apps/ollama
  go generate ./...
  go build .

  chmod -R 700 ~/go
  rm -r ~/go
fi
