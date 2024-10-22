#!/bin/bash

# Получаем данные от пользователя
read -p "Введите сообщение: " SOME_TEXT
read -p "Введите идентификатор чата: " CHAT_ID
read -p "Введите токен бота: " BOT_TOKEN

# Формируем URL-запрос
URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage?chat_id=$CHAT_ID&text=$SOME_TEXT"

# Выполняем запрос
curl -s "$URL"

# Выводим сообщение об успешном выполнении
echo "Сообщение отправлено успешно!"
