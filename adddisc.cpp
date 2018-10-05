#include "adddisc.h"
#include "ui_adddisc.h"
#include "datamodel.h"

AddDisc::AddDisc(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::AddDisc)
{
    ui->setupUi(this);
    ui->radioDisc->setChecked(true);

    ui->comboBox->setModel(dmodel->cycle);
    ui->comboBox->setModelColumn(1);
    ui->comboBox->setCurrentIndex(0);
    ui->comboBox->show();
}

AddDisc::~AddDisc()
{
    delete ui;
}

void AddDisc::on_butAdd_clicked()
{
    if(ui->radioDisc->isChecked())
    {
        if(ui->checkBox->isChecked())
        {
            conc = "Соответствует";
        }
        else conc = "Не соответствует";
        dmodel->query->exec("INSERT INTO discipline(ndisc,idcycle) VALUES("
                            "'" + ui->lineEdit->text() + "', " + dmodel->cycle->record(ui->comboBox->currentIndex()).field(0).value().toString() + ");");
        dmodel->query->exec("INSERT INTO discincycle VALUES( "
                            "(SELECT iddisc FROM discipline WHERE ndisc='"+ ui->lineEdit->text() +"'), "
                          "" + dmodel->cycle->record(ui->comboBox->currentIndex()).field(0).value().toString() + ", '" + conc +"');");
    }
    else
    {
        dmodel->query->exec("INSERT INTO cycle(ncycle)"
                "VALUES ('" + ui->lineEdit->text() + "');");
    }
    dmodel->update();
    this->close();
}

void AddDisc::on_butCan_clicked()
{
    QApplication::quitOnLastWindowClosed();
}

void AddDisc::on_radioDisc_clicked()
{
    ui->label->setText("Название дисциплины");
    ui->comboBox->setEnabled(true);
    ui->checkBox->setEnabled(true);
    ui->comboBox->setModel(dmodel->cycle);
    ui->comboBox->setModelColumn(1);
    ui->comboBox->setCurrentIndex(0);
    ui->comboBox->show();
}

void AddDisc::on_radioCycle_clicked()
{
    ui->label->setText("Название цикла");
    ui->comboBox->setEnabled(false);
    ui->checkBox->setEnabled(false);
}
