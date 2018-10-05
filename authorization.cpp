#include "authorization.h"
#include "ui_authorization.h"
#include "datamodel.h"

Authorization::Authorization(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Authorization)
{
    ui->setupUi(this);
}

Authorization::~Authorization()
{
    delete ui;
}

void Authorization::on_butAcc_clicked()
{
   if(!dmodel->connect(ui->Login->text(),ui->Password->text(),ui->Adds->text(),ui->Port->value()))
   {
       QMessageBox::critical(this,tr("Ошибка подключения"),tr("Не удалось подключиться"));
   }
   else
   {
       this->hide();
       this->mainwindow = new MainWindow(this);
       this->mainwindow->show();
   }
}

void Authorization::on_butCan_clicked()
{
    exit(9);
}
