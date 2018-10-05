#include "datamodel.h"

DataModel *dmodel = new DataModel();

DataModel::DataModel()
{
    database = "data";
    isConnected = false;
    db = QSqlDatabase::addDatabase("QPSQL");
}

bool DataModel::connect(QString login, QString password, QString host, int port)
{
    db.setHostName(host);
    db.setPort(port);
    db.setDatabaseName(database);
    db.setUserName(login);
    db.setPassword(password);
    this->isConnected = db.open();
    if(!isConnected)
    {
        return false;
    }
    else
    {
        query = new QSqlQuery(this->db);

        discipline = new QSqlRelationalTableModel(0,this->db);
        discipline->setTable("discipline");
        discipline->select();

        cycle = new QSqlRelationalTableModel(0,this->db);
        cycle->setTable("cycle");
        cycle->select();

        discincycle = new QSqlRelationalTableModel(0,this->db);
        discincycle->setEditStrategy(QSqlTableModel::OnManualSubmit);
        discincycle->setTable("discInCycle");
        discincycle->setHeaderData(0,Qt::Horizontal,"Дисциплина");
        discincycle->setHeaderData(1,Qt::Horizontal,"Цикл дисциплин");
        discincycle->setHeaderData(2,Qt::Horizontal,"Заключение");
        discincycle->setRelation(0,QSqlRelation("discipline","iddisc","ndisc"));
        discincycle->setRelation(1,QSqlRelation("cycle","idcycle","ncycle"));
        discincycle->select();

        book = new QSqlRelationalTableModel(0,this->db);
        book->setEditStrategy(QSqlTableModel::OnManualSubmit);
        book->setTable("book");
        book->setHeaderData(1, Qt::Horizontal, "Название книги");
        book->setHeaderData(2, Qt::Horizontal, "Автор");
        book->setHeaderData(3, Qt::Horizontal, "Место издания");
        book->setHeaderData(4, Qt::Horizontal, "Год");
        book->select();

        special = new QSqlRelationalTableModel(0,this->db);
        special->setEditStrategy(QSqlTableModel::OnManualSubmit);
        special->setTable("special");
        special->setHeaderData(1,Qt::Horizontal,"Специальность");
        special->select();

        fond = new QSqlRelationalTableModel(0,this->db);
        fond->setEditStrategy(QSqlTableModel::OnManualSubmit);
        fond->setTable("bookAmount");
        fond->setHeaderData(1,Qt::Horizontal,"Книга");
        fond->setHeaderData(2,Qt::Horizontal,"Количество");
        fond->setRelation(1,QSqlRelation("book","idbook","nbook"));
        fond->select();

        library = new QSqlRelationalTableModel(0,this->db);
        library->setEditStrategy(QSqlTableModel::OnManualSubmit);
        library->setTable("library");
        library->setHeaderData(0,Qt::Horizontal,"Специальность");
        library->setHeaderData(2,Qt::Horizontal,"Книга");
        library->setRelation(0,QSqlRelation("special","idspec","nspec"));
        library->setRelation(2,QSqlRelation("book","idbook","nbook"));
        library->select();

        query_book = new QSqlQueryModel();
        query_book->setQuery("SELECT nbook,author FROM book;",this->db);
        query_book->record();

        return true;
    }
}

void DataModel::update()
{
    this->discipline->select();
    this->cycle->select();
    this->discincycle->select();
    this->book->select();
    this->special->select();
    this->fond->select();
    this->library->select();
//    this->query_book->record();
//    this->query_book->record();
//    this->query_place->record();
}

void DataModel::disconnect()
{
    db.close();
    if(isConnected)
    {
        delete discipline;
        delete book;
        delete special;
        delete fond;
        delete library;
    }
    this->isConnected = false;
}

