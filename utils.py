import read_from_xlsx as rfx
from mysqldb_helper import MySqlDb as db
from db_structures import get_structure

# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Заполнение бд из файла, каждый раз запускать нет смысла
# create_db - необходимо ли создавать таблицы перед заполненим
# recreate_db - даже если таблицы существуют они будут удалены и созданы заного
def fill_db_from_file(file_name, create_db=False, recreate_db=False):
    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Получаем словарь данных из файла
    db_data = rfx.read_from_xlsx(file_name)

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. смотрим названия таблиц из файла
    tables = db_data.keys()

    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. подключаемся к бд
    with db() as cur:

        # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Для каждой таблицы из файла
        for table in tables:
            # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. если есть флаги на создание или пересоздание
            if create_db or recreate_db:
                # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Если пересоздание, то удаляем перед созданием
                if recreate_db:
                    cur.drop_table(table_name=table)
                # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. создаем таблицы
                cur.execute(get_structure(table))
            # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Заполняем таблицу данными
            for row in db_data[table]:

                values = tuple(f"'{value}'" for value in row)
                sql = f"insert into {table} values (NULL, {','.join(values)});"
                cur.insert(sql)

# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Это функция для конвертирования ответа базы в словарь, который будет вставлен в html страницу
def convert_select_response_to_table(response):
    return {"headlines": ["#"] + list(response[0].keys()), "rows": tuple([index] + list(row.values()) for index, row in enumerate(response))}

# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. По имени таблицы, проверка на существование таблицы, и если она существует получение
#                       всех данных и конвертирование в подходящие для вставки на сайт
def get_table_or_none(table_name):
    with db() as cur:
        if cur.check_table_exist(table_name):
            return convert_select_response_to_table(cur.select_all(table_name))
    return None


if __name__ == '__main__':
    # fill_db_from_file('db_data.xlsx', recreate_db=True)
    table ='FILIAL'
    with db() as cur:
        sql = '''
        DEFAULT CHARACTER SET utf8 ;


'''
        # cur.execute(sql)
        cur.execute(get_structure(table))