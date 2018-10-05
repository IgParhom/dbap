#include "addspec.h"
#include "ui_addspec.h"
#include "datamodel.h"

AddSpec::AddSpec(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::AddSpec)
{
    ui->setupUi(this);
}

AddSpec::~AddSpec()
{
    delete ui;
}

void AddSpec::on_butAdd_clicked()
{
    dmodel->query->exec("INSERT INTO special(nspec) VALUES('" + ui->lineEdit->text() + "')");
    dmodel->update();
    this->close();
}

void AddSpec::on_butCan_clicked()
{
    this->close();
}
