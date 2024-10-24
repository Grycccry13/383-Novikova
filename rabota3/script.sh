#!/bin/bash

# Список групп
groups=(
  "Группа1"
  "Группа2"
  "Группа3"
  "Группа4"
  "Группа5"
  "Группа6"
  "Группа7"
  "Группа8"
  "Группа9"
  "Группа10"
)

# Создание структуры для каждой группы
for group in "${groups[@]}"; do
  mkdir "$group"

  mkdir "$group/Управление задачами"
  mkdir "$group/Управление задачами/Документация"
  touch "$group/Управление задачами/Документация/Инструкция.txt"
  touch "$group/Управление задачами/Документация/Шаблоны задач/Шаблон1.txt"
  touch "$group/Управление задачами/Документация/Шаблоны задач/Шаблон2.txt"

  mkdir "$group/Управление задачами/Код"
  mkdir "$group/Управление задачами/Код/Исходники"
  touch "$group/Управление задачами/Код/Исходники/main.c"
  touch "$group/Управление задачами/Код/Исходники/utils.c"
  mkdir "$group/Управление задачами/Код/Скрипты"
  touch "$group/Управление задачами/Код/Скрипты/setup.sh"
  touch "$group/Управление задачами/Код/Скрипты/run.sh"

  mkdir "$group/Управление задачами/Отчеты"
  touch "$group/Управление задачами/Отчеты/Отчет1.doc"
  touch "$group/Управление задачами/Отчеты/Отчет2.doc"

  echo "Структура для группы '$group' создана."
done
