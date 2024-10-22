# Функция для создания папок курса
create_course() {
  echo "Укажите название курса:"
  read course_name

  # Проверка, существует ли папка курса
  if [ ! -d "$course_name" ]; then
    mkdir "$course_name"
    echo "Папка '$course_name' создана."
  else
    echo "Папка '$course_name' уже существует."
  fi

  # Создание подпапки "Студенты"
  mkdir "$course_name/Студенты"
  echo "Подпапка 'Студенты' создана в папке '$course_name'."

  # Создание файла "Оценки.txt"
  touch "$course_name/Оценки.txt"
  echo "Файл 'Оценки.txt' создан в папке '$course_name'."
}

# Функция для добавления студентов в курс
add_students() {
  echo "Укажите название курса:"
  read course_name

  # Проверка, существует ли папка курса
  if [ ! -d "$course_name" ]; then
    echo "Папка '$course_name' не существует. Создайте её с помощью функции 'Создать курс'."
    return 1
  fi

  echo "Сколько студентов в группе?"
  read student_count

  for i in $(seq 1 $student_count); do
    echo "Студент $i:"
    read student_name
    mkdir -p "$course_name/Студенты/$student_name"
  done

  echo "Студенты добавлены в папку '$course_name'."
}

# Функция для добавления оценок
add_grades() {
  echo "Укажите название курса:"
  read course_name

  # Проверка, существует ли папка курса
  if [ ! -d "$course_name" ]; then
    echo "Папка '$course_name' не существует. Создайте её с помощью функции 'Создать курс'."
    return 1
  fi

  echo "Добавьте оценки (в формате 'Студент: Оценка'):"
  while true; do
    read -r grade
    if [[ "$grade" == "" ]]; then
      break
    fi

    # Разделяем имя студента и оценку
    IFS=':' read -r student_name grade <<< "$grade"

    # Проверка, существует ли папка студента
    if [ ! -d "$course_name/Студенты/$student_name" ]; then
      echo "Студент '$student_name' не найден."
      continue
    fi

    echo "$grade" >> "$course_name/Оценки.txt"
  done

  echo "Оценки добавлены в файл 'Оценки.txt' для курса '$course_name'."
}

# Функция для редактирования оценок
edit_grades() {
  echo "Укажите название курса:"
  read course_name

  # Проверка, существует ли папка курса
  if [ ! -d "$course_name" ]; then
    echo "Папка '$course_name' не существует. Создайте её с помощью функции 'Создать курс'."
    return 1
  fi

  echo "Введите имя студента, чью оценку нужно редактировать:"
  read student_name

  # Проверка, существует ли папка студента
  if [ ! -d "$course_name/Студенты/$student_name" ]; then
    echo "Студент '$student_name' не найден."
    return 1
  fi

  echo "Введите новую оценку:"
  read new_grade

  # Редактирование файла "Оценки.txt"
  sed -i "s/^\($student_name.*\)$/\1: $new_grade/" "$course_name/Оценки.txt"

  echo "Оценка для студента '$student_name' обновлена."
}

# Главное меню
while true; do
  echo "Выберите действие:"
  echo "1. Создать курс"
  echo "2. Добавить студентов"
  echo "3. Добавить оценки"
  echo "4. Редактировать оценки"
  echo "5. Выход"
  read choice

  case $choice in
    1) create_course;;
    2) add_students;;
    3) add_grades;;
    4) edit_grades;;
    5)
      echo "Выход из программы."
      exit 0;;
    *)
      echo "Неверный выбор";;
  esac
done
