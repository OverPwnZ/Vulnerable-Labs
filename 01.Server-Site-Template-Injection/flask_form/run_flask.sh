#!/bin/bash

# Nombre de la imagen y del contenedor
IMAGE_NAME="flask-form"
CONTAINER_NAME="flask-form-container"
PORT=5000

echo "======================================="
echo "  Flask + Docker launcher"
echo "======================================="

echo "[*] Construyendo la imagen Docker: ${IMAGE_NAME}"
sudo docker build -t "${IMAGE_NAME}" .

echo "[*] Verificando si ya existe el contenedor: ${CONTAINER_NAME}"
if sudo docker ps -a --format '{{.Names}}' | grep -Eq "^${CONTAINER_NAME}$"; then
    echo "[*] Contenedor existente encontrado. Eliminándolo..."
    sudo docker rm -f "${CONTAINER_NAME}"
fi

echo "[*] Levantando contenedor en http://localhost:${PORT}"
sudo docker run -p ${PORT}:${PORT} --name "${CONTAINER_NAME}" "${IMAGE_NAME}"
