# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. словарь в тором хранится sql код для создания таблиц,
#                               где ключ словаря - точное название таблицы
_db_structures = {}

_db_structures["Filial"] = """
create table if not exists Filial (
    FILIAL_ID int NOT NULL AUTO_INCREMENT,
    FILIAL_NAME varchar(30) not null,
    FILIAL_FNAME varchar(25) not null,
    FILIAL_LNAME varchar(30) not null,
    FILIAL_LOGIN varchar(15) not null,
    PRIMARY KEY (FILIAL_ID)
);
"""

_db_structures["FILIAL"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`FILIAL` (
  `FILIAL_ID` INT(1) NOT NULL,
  `FILIAL_NAME` VARCHAR(40) NOT NULL,
  `FILIAL_ADNAME` VARCHAR(25) NOT NULL,
  `FILIAL_LADNAME` VARCHAR(45) NOT NULL,
  `FILIAL_LOGIN` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`FILIAL_ID`))
ENGINE = InnoDB;
"""

_db_structures["CUSTOMER"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`CUSTOMER` (
  `CUST_ID` INT(5) NOT NULL,
  `CUST_FNAME` VARCHAR(25) NOT NULL,
  `CUST_LNAME` VARCHAR(30) NOT NULL,
  `PASSWORD_DATA` CHAR(10) NOT NULL,
  `CUST_VIDAN` VARCHAR(50) NOT NULL,
  `CUST_DATE` DECIMAL NOT NULL,
  `CUST_PHONE` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`CUST_ID`))
ENGINE = InnoDB;
"""

_db_structures["MANAG"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`MANAG` (
  `MANAG_ID` INT(2) NOT NULL,
  `MANAG_FMALE` VARCHAR(25) NOT NULL,
  `MANAG_LNAME` VARCHAR(30) NOT NULL,
  `MANAG_PASP` CHAR(10) NOT NULL,
  `MANAG_VIDAN` VARCHAR(50) NOT NULL,
  `MANAG_DATE` DECIMAL NOT NULL,
  `MANAG_BORN` DECIMAL NOT NULL,
  `MANAG_SEX` CHAR(1) NOT NULL,
  `MANAG_FILIAL` INT(1) NOT NULL,
  `MANAG_PHONE` VARCHAR(30) NOT NULL,
  `MANAG_LOGIN` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`MANAG_ID`),
  INDEX `Номер филиала_idx` (`MANAG_FILIAL` ASC) VISIBLE,
  CONSTRAINT `Номер филиала`
    FOREIGN KEY (`MANAG_FILIAL`)
    REFERENCES `DataBase(end)`.`FILIAL` (`FILIAL_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
"""

_db_structures["ORDER"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`ORDER` (
  `ORDER_ID` INT(5) NOT NULL,
  `ORDER_AUTO` INT(5) NOT NULL,
  `ORDER_MANAG` VARCHAR(2) NOT NULL,
  `ORDER_CUST` INT(5) NOT NULL,
  `ORDER_SUMMA` VARCHAR(7) NOT NULL,
  `DATA_NACHALO` DECIMAL NOT NULL,
  `DATA_SROK` DECIMAL NOT NULL,
  `DATA_KONEC` DECIMAL NULL,
  `ORDER_DOSTAVKA` CHAR(1) NOT NULL,
  PRIMARY KEY (`ORDER_ID`),
  INDEX `Кузновной номер_idx` (`ORDER_AUTO` ASC) VISIBLE,
  INDEX `Покупатель_idx` (`ORDER_CUST` ASC) VISIBLE,
  CONSTRAINT `Менеджер`
    FOREIGN KEY (`ORDER_ID`)
    REFERENCES `DataBase(end)`.`MANAG` (`MANAG_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Покупатель`
    FOREIGN KEY (`ORDER_CUST`)
    REFERENCES `DataBase(end)`.`CUSTOMER` (`CUST_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Кузновной номер`
    FOREIGN KEY (`ORDER_AUTO`)
    REFERENCES `DataBase(end)`.`Auto` (`AUTO_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
"""

_db_structures["MARKI"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`MARKI` (
  `MARK` VARCHAR(10) NOT NULL,
  `MARK_ID` INT NOT NULL,
  PRIMARY KEY (`MARK_ID`))
ENGINE = InnoDB;
"""

_db_structures["Auto"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`Auto` (
  `AUTO_ID` INT(6) NOT NULL,
  `AUTO_ORDER` INT(5) NOT NULL,
  `AUTO_V` INT NOT NULL,
  `AUTO_P` INT NOT NULL,
  `AUTO_FILIAL` INT(1) NOT NULL,
  `AUTO_COLOR` VARCHAR(20) NOT NULL,
  `GOD_VIPYSKA` DECIMAL NOT NULL,
  `AUTO_model` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`AUTO_ID`),
  INDEX `Номер заказа_idx` (`AUTO_ORDER` ASC) VISIBLE,
  INDEX `Номер филиала_idx` (`AUTO_FILIAL` ASC) VISIBLE,
  CONSTRAINT `Номер заказа`
    FOREIGN KEY (`AUTO_ORDER`)
    REFERENCES `DataBase(end)`.`ORDER` (`ORDER_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Номер филиала`
    FOREIGN KEY (`AUTO_FILIAL`)
    REFERENCES `DataBase(end)`.`FILIAL` (`FILIAL_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Модель`
    FOREIGN KEY (`AUTO_ID`)
    REFERENCES `DataBase(end)`.`MARKI` (`MARK_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
"""

_db_structures["ZP"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`ZP` (
  `ID_MANAG` INT(2) NOT NULL,
  `OKLAD` VARCHAR(5) NOT NULL,
  `DATA_ZP` DECIMAL(1) NOT NULL,
  `PREMIYA` INT(2) NOT NULL,
  PRIMARY KEY (`ID_MANAG`),
  CONSTRAINT `Менеджер`
    FOREIGN KEY (`ID_MANAG`)
    REFERENCES `DataBase(end)`.`MANAG` (`MANAG_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
"""

_db_structures["Models"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`Models` (
  `MARK_ID` INT(2) NOT NULL,
  `MODEL` VARCHAR(20) NOT NULL,
  `SIDENIA` VARCHAR(2) NOT NULL,
  `MODE` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`MARK_ID`),
  CONSTRAINT `id марки`
    FOREIGN KEY (`MARK_ID`)
    REFERENCES `DataBase(end)`.`MARKI` (`MARK_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
"""

_db_structures["KOMPL"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`KOMPL` (
  `KOMPL` VARCHAR(20) NOT NULL,
  `COMMENT` VARCHAR(50) NULL,
  `ID_USLUGA` INT(2) NOT NULL,
  `PRICE` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`ID_USLUGA`))
ENGINE = InnoDB;
"""

_db_structures["ADDR_number"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`ADDR_number` (
  `ADDR_ID` INT NOT NULL,
  `A_ADDR` VARCHAR(45) NULL,
  `A_NUMBER` VARCHAR(45) NULL,
  PRIMARY KEY (`ADDR_ID`),
  CONSTRAINT `Номер филиала`
    FOREIGN KEY (`ID_FILIAL`)
    REFERENCES `DataBase(end)`.`FILIAL` (`FILIAL_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
"""

_db_structures["SPISOK"] = """
CREATE TABLE IF NOT EXISTS `DataBase(end)`.`SPISOK` (
  `ID_AUTO` INT(5) NOT NULL,
  `ID_USLUGA` INT(2) NOT NULL,
  INDEX `Куз.номер_idx` (`ID_AUTO` ASC) VISIBLE,
  CONSTRAINT `Куз.номер`
    FOREIGN KEY (`ID_AUTO`)
    REFERENCES `DataBase(end)`.`Auto` (`AUTO_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
"""

# _db_structures[""] = """
#
# """

# УДАЛИТЬ ПЕРЕД СДАЧЕЙ. Функция получения структуры таблицы по ключу,
#                       при несуществование данной структуры бросает исключение
def get_structure(structure_name):
    db_structure = _db_structures.get(structure_name)
    if db_structure is None:
        raise Exception(f"Структура для создания базы \"{structure_name}\" не существует, проверьте файл db_structures")
    return db_structure

