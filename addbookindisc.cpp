#include "addbookindisc.h"
#include "ui_addbookindisc.h"
#include "datamodel.h"

AddBookInDisc::AddBookInDisc(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::AddBookInDisc)
{
    ui->setupUi(this);
    ui->comboBook->setModel(dmodel->query_book);
    dmodel->query_book->setQuery("SELECT nbook,author FROM book NATURAL JOIN library",dmodel->db);
    ui->comboBook->show();

    ui->comboSpec->setModel(dmodel->special);
    ui->comboSpec->setModelColumn(1);
    ui->comboSpec->show();
}
AddBookInDisc::~AddBookInDisc()
{
    delete ui;
}

void AddBookInDisc::on_butAdd_clicked()
{    
    dmodel->query->exec("INSERT INTO library VALUES( "
                       ""+ dmodel->special->record(ui->comboSpec->currentIndex()).field(0).value().toString() + ","
                       "(SELECT iddisc FROM discipline WHERE ndisc='"+dmodel->selectedDisc+"'),"
                       ""+ dmodel->book->record(ui->comboBook->currentIndex()).field(0).value().toString() + ");");
    dmodel->update();
    this->close();
}

void AddBookInDisc::on_butCan_clicked()
{
    this->close();
}
