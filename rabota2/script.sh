echo "Введите название проекта:"
read project_name

echo "Введите директорию, в которой создать проект:"
read project_dir

# Проверка, существует ли директория
if [ ! -d "$project_dir" ]; then
  echo "Директория '$project_dir' не существует."
  exit 1
fi

# Создание структуры проекта
mkdir -p "$project_dir/$project_name/src"
mkdir -p "$project_dir/$project_name/src/scripts"
mkdir -p "$project_dir/$project_name/src/styles"
mkdir -p "$project_dir/$project_name/src/images"
touch "$project_dir/$project_name/README.md"
touch "$project_dir/$project_name/.gitignore"

# Создание файла .gitignore с базовыми правилами
echo "node_modules" > "$project_dir/$project_name/.gitignore"
echo ".env" >> "$project_dir/$project_name/.gitignore"
echo "dist" >> "$project_dir/$project_name/.gitignore"

# Вывод сообщения об успешном завершении
echo "Структура проекта '$project_name' успешно создана в директории '$project_dir'."
