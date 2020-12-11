import os
import pymysql.cursors
from dotenv import load_dotenv

# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. это фунция которую используют на серьезных коммерческих проектах.
# Так как нельзя писать в коде захардкоженные данные для доступа к бд, токены и так далее, их локально записывают
# в отдельный файл, а на продакшене, загружают в переменные среды( тоесть грубо говоря делают переменными сервера
# на котором это все работает). Так вот эта функция при запуске, берет значения из файла .env и записывает их в
# переменные среды, откуда их мы уже берем с помощью функции os.environ['название переменной']
load_dotenv(override=True)

# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. класс для работы с базой данных
class MySqlDb:

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. инициализация класса
    def __init__(self):

        # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Заполнение словаря с  данными для соединения с базой
        self.connect_dict = {"host": os.environ['DATABASE_HOST'],
                             "user": os.environ['DATABASE_USER'],
                             "password": os.environ['DATABASE_PASSWORD'],
                             "db": os.environ['DATABASE_NAME'],
                             "charset": "utf8mb4",
                             "cursorclass": pymysql.cursors.DictCursor}

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Это функци мененджера контекста. Тоесть когда ты используешь with MySqlDb он выпоняет
    # этот код, а когда выходишь из этого "блока кода" он выполнит __exit__.
    # В нашем случае, он создает коннек с базой когда ты пишешь with MySqlDb() as cur: и в cur будут доступны
    # функции которыя я определил для работы с базой ниже.
    def __enter__(self):
        self.connection = pymysql.connect(**self.connect_dict)
        return self

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Закрытие коннекта с базой после выхода из блока with
    def __exit__(self, exc_type, exc_val, exc_tb):
        self.connection.close()

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Отправить sql код в базу.
    # sql - непосредственно сам код, что должен быть направлен в базу
    # commit - параметр отвечающий за то, будут ли сохранены изменения в базе, при селекте в нем нет смысла
    # fetch_all - флаг отвечающий за то, нужно ли нам получить данные, что вернула база. При добавлении таблиц
    # и вставке записей не имеет смысла
    def execute(self, sql, commit=True, fetch_all=False):
        # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Создание курсора для работы с базой
        cur = self.connection.cursor()
        # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Направляем запрос.
        cur_res = cur.execute(sql)

        # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Если флаг коммит, то фиксируем изменения в базе
        if commit:
            self.connection.commit()

        # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Если флаг fetch_all, то возвращаем все записи (только для селекта в нашем случае)
        if fetch_all:
            return cur.fetchall()
        return cur_res

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Шоркат для селекта с флагом возращения данных и без коммита, да и чтобы
    # нагляднее было где именно селект вызывается
    def select(self, sql):
        return self.execute(sql, commit=False, fetch_all=True)

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Шоркат для получения всех записей только по имени таблицы. Перед испльзованием стоит
    # убедиться в существовании таблицы
    def select_all(self, table_name):
        return self.select(f"SELECT * FROM {table_name}")

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Функция вставки. по сути просто для наглядности, просто выполняет sql код с дефолтными
    # для execute функции параметрами commit=True, fetch_all=False
    def insert(self, sql):
        return self.execute(sql)

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Функция удаления таблицы. Если таблица не будет найдена, просто скажет об этом, без ошибки
    def drop_table(self, table_name):
        if self.check_table_exist(table_name):
            self.execute(f"DROP TABLES {table_name};")
            return f"dropped {table_name}"
        return f"cant find {table_name}"

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Удаление базы данных, может пригодится )))
    def drop_db(self, db_name):
        db_exist = self.execute(f"SHOW DATABASES LIKE '{db_name}';")
        if db_exist:
            self.execute(f"DROP DATABASES {db_name};")
            return f"dropped {db_name}"
        return f"cant find {db_name}"

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. проверка на существование таблицы в бд
    def check_table_exist(self, table_name):
        if self.execute(f"SHOW TABLES LIKE '{table_name}';"):
            return True
        return False
