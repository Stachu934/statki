# Wybieramy obraz bazowy
FROM python:3.9

# Ustawiamy katalog roboczy w kontenerze
WORKDIR /app

# Instalujemy wymagane zależności
RUN apt-get update && apt-get install -y git

# Instalujemy Pillow (potrzebne do uruchomienia apki)
RUN pip install Pillow

# Sklonuj repozytorium z GitHub
RUN git clone https://github.com/z33kz33k/statki.git

# Przechodzimy do katalogu z repozytorium
WORKDIR /app/statki

# Uruchamiam kod
CMD ["python", "uruchom_testy.py"]
