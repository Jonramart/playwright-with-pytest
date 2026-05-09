# Usa una imagen base ligera de Debian [cite: 2, 23]
FROM python:3.11-slim

# Variables de entorno para Python [cite: 2]
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Dependencias del sistema para evitar fallos de compilación [cite: 2]
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Instalación de dependencias (cacheado eficiente) [cite: 14]
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia del código fuente
COPY . .

CMD ["python", "test_saucedemo.py"]