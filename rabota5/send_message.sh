#!/bin/bash

# Получаем данные от пользователя
read -p "Введите сообщение: " Привет
read -p "Введите идентификатор чата: " 123456789
read -p "Введите токен бота: " 8071793757:AAFOgcf6UjcmtzOPK9PnOfjGdBUj6SQeGzQ

# Формируем URL-запрос
URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage?chat_id=$CHAT_ID&text=$SOME_TEXT"

# Выполняем запрос
curl -s "$URL"

# Выводим сообщение об успешном выполнении
echo "Сообщение отправлено успешно!"
