# Use a imagem oficial do Python
FROM python:3.9-slim

# Define o diretório de trabalho no contêiner
WORKDIR /desafio-devops

# Copia o código da aplicação para o contêiner
COPY . /desafio-devops

# Instala as dependências da aplicação
#COPY /home/ubuntu/desafiodevops/desafio-devops/app/requirements.txt .
RUN pip install --no-cache-dir -r ./requirements.txt

# Exponha a porta 8000
EXPOSE 8000

# Comando para iniciar a aplicação com Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--log-level", "debug", "api:app"]