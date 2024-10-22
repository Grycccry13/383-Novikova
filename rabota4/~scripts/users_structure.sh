#!/bin/bash

# Проверка, задан ли параметр ввода
if [ -z "$1" ]; then
  echo "Ошибка: Необходимо указать имя пользователя в качестве аргумента."
  exit 1
fi

# Сохранение имени пользователя
USERNAME=$1

# Создание директории пользователя
mkdir -p ~/users/$USERNAME

# Инициализация git репозитория
cd ~/users/$USERNAME
git init

# Создание папки photos и файлов
mkdir photos
for year in {2020..2024}; do
  mkdir photos/$year
  touch photos/$year/default.png
done
git add photos
git commit -m "Создана папка photos с файлами"

# Создание папки videos и файлов
mkdir videos
for year in {2020..2024}; do
  mkdir videos/$year
  touch videos/$year/default.mp4
done
git add videos
git commit -m "Создана папка videos с файлами"

# Создание папки documents и файлов
mkdir documents
for year in {2020..2024}; do
  mkdir documents/$year
  touch documents/$year/default.doc
done
git add documents
git commit -m "Создана папка documents с файлами"

# Возвращение в исходную директорию
cd ~/scripts

echo "Структура для пользователя $USERNAME успешно создана."
