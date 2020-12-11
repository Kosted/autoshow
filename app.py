from flask import Flask, render_template
from flask import request
from utils import convert_select_response_to_table, get_table_or_none
from mysqldb_helper import MySqlDb as db
# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Создание приложения фласк, сайта крч
app = Flask(__name__)

# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. первое это путь который нужно будет написать в строке браузера для получения доступа к этому
# методу. Второе это то, какие методы запросов принимает данный адрес
@app.route('/', methods=['POST', 'GET'])
def index():
    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Если метод ГЕТ,то просто возвращаем страницу index
    if request.method == "GET":
        return render_template('index.html')
    # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Если метод POST, то получем из поля input формы значение - имя таблицы
    if request.method == "POST":
        # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. В теле запроса request, смотрим форму, в которой пытаемся взять поле table_name
        table_name = request.form.get("table_name")
        # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. если инпут был заполнен, то пытаемся получить все данные из таблицы, если она существует
        if table_name:
            res = get_table_or_none(table_name)
            # УДАЛИТЬ ПЕРЕД СДАЧЕЙ. data и table_name, а также все другие именнованные атрибуты, что ты передашь
            # в функцию render_template будут доступны в шаблонах для вставки по именам (смотри templates)
            return render_template('select_tables.html', data=res,  table_name=table_name)
        return render_template('index.html')


@app.route('/filials')
def filials():
    with db() as cur:
        res = cur.select("select * from Filial")
        res = convert_select_response_to_table(res)

    return render_template('select_tables.html', data=res, table_name="Filial")


@app.route('/select_table/<table_name>')
def select_table(table_name=None):

    res = get_table_or_none(table_name)

    return render_template('select_tables.html', data=res, table_name=table_name)

# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Запуск сервера с сайтом. debug=True только при разработке
if __name__ == '__main__':
    app.run(debug=True)
