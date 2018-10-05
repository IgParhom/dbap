#include "addfond.h"
#include "ui_addfond.h"
#include "datamodel.h"

AddFond::AddFond(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::AddFond)
{
    ui->setupUi(this);
    ui->comboBook->setModel(dmodel->query_book);
    ui->comboBook->show();

    ui->comboSpec->setModel(dmodel->special);
    ui->comboSpec->setModelColumn(1);
    ui->comboSpec->show();
}

AddFond::~AddFond()
{
    delete ui;
}

void AddFond::on_butCan_clicked()
{
    this->close();
}

void AddFond::on_butAdd_clicked()
{
    dmodel->query->exec("INSERT INTO bookamount VALUES( "
                        ""+ dmodel->special->record(ui->comboSpec->currentIndex()).field(0).value().toString() + ","
                        ""+ dmodel->book->record(ui->comboBook->currentIndex()).field(0).value().toString() + ","
                        "" + ui->spinBox->text() + " );");
    dmodel->update();
    this->close();
}
