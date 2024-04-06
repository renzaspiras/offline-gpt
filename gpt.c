#include <stdio.h>
#include <stdlib.h>

int main(){
  system("nohup ~/apps/ollama/ollama serve >/dev/null 2>&1 &");
}