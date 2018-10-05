#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <QObject>
#include <QString>
#include <QtSql>
#include <QMessageBox>
#include <QDebug>
#include <QSqlRelation>
#include <QSqlRelationalTableModel>

class DataModel;
extern DataModel *dmodel;

class DataModel
{
public:
    DataModel();

    QSqlDatabase db;

    QSqlRelationalTableModel *cycle, *discipline, *book, *special,  *fond, *library,  *discincycle;
    QSqlQueryModel *query_book;
    QSqlQuery *query;
    bool isConnected, conc;
    QString selectedDisc;

    bool connect(QString login, QString password, QString host, int port);
    void update();
    void disconnect();

private:
    QString database;
};

#endif // DATAMODEL_H
