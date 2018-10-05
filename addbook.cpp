#include "addbook.h"
#include "ui_addbook.h"
#include "datamodel.h"

AddBook::AddBook(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::AddBook)
{
    ui->setupUi(this);
}

AddBook::~AddBook()
{
    delete ui;
}

void AddBook::on_butAdd_clicked()
{
    dmodel->query->exec("INSERT INTO book(nbook,author,publplace,year) "
                       "VALUES ('" + ui->lineName->text() + "', '"+ ui->lineAuthor->text() + "',"
                       "' "+ ui->linePlace->text() + "', "+ ui->spinBox->text() + ");");
    dmodel->update();
    this->close();
}


void AddBook::on_butCan_clicked()
{
    this->close();
}
