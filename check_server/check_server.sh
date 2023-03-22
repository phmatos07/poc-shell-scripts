#!/bin/bash

read -p "Digite o endereço do site: " url
status_code_ok=200
codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null $url)
date=$(date +%F\ %T)
status_code=$(echo "Status Code: ${codigo_http} - Date: ${date}")
logger_status=

if [ $codigo_http == $status_code_ok ]; then
  echo "Servidor está funcionando normalmente!"
  echo ${status_code}
else
  echo "Servidor está fora do ar!"
  echo ${status_code}
fi

read -p "Deseja gerar um arquivo de log? (Y: Yes ou N: Não): " generate_log
if [ $generate_log == "Y" ]; then
  echo ${status_code} >> logger.txt
  echo "Log gerado!"
else
  echo "OK!"
fi
