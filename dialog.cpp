#include "dialog.h"
#include "ui_dialog.h"
#include "datamodel.h"

Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);
    ui->label->setText("Книги, принадлежащие дисциплине: "+dmodel->selectedDisc);
    if(dmodel->conc==true)
        ui->label_2->setText("Соответствует");
    else ui->label_2->setText("Не соответствует");
    ui->tableView->setModel(dmodel->library);
    ui->tableView->setColumnHidden(1,true);
    dmodel->library->setFilter("iddisc IN (SELECT iddisc FROM discipline WHERE ndisc='"+dmodel->selectedDisc+"')");
    ui->tableView->show();
    dmodel->update();

    ui->tableView->setSelectionBehavior(QAbstractItemView::SelectRows); // выбор строки
    ui->tableView->setSelectionMode(QAbstractItemView::SingleSelection); // выбор только одной строки
    ui->tableView->verticalHeader()->setVisible(false); // скрытие индексов
}

Dialog::~Dialog()
{
    delete ui;
}

void Dialog::on_butAdd_clicked()
{
    addlibr = new AddBookInDisc();
    addlibr->setModal(true);
    addlibr->show();
}

void Dialog::on_butDel_clicked()
{
    dmodel->query->exec("DELETE FROM library WHERE idspec=(SELECT idspec FROM special WHERE nspec='" + dmodel->library->record(ui->tableView->selectionModel()->currentIndex().row()).field(0).value().toString() + "') "
                                              "AND iddisc=(SELECT iddisc FROM discipline WHERE ndisc='" + dmodel->selectedDisc + "')"
                                              "AND idbook=(SELECT idbook FROM book WHERE nbook='" + dmodel->library->record(ui->tableView->selectionModel()->currentIndex().row()).field(2).value().toString() + "');");
    dmodel->update();
}

void Dialog::on_butClos_clicked()
{
    this->close();
}


void Dialog::on_pushButton_clicked()
{
    if(dmodel->conc==true){
        dmodel->query->exec("UPDATE discincycle SET isset='Не соответствует' WHERE iddisc=(SELECT iddisc FROM discipline WHERE ndisc='"+ dmodel->selectedDisc +"');");
        ui->label_2->setText("Не соответствует");
        dmodel->conc=false;
        qDebug()<<dmodel->conc;
    }
    else {
        dmodel->query->exec("UPDATE discincycle SET isset='Соответствует' WHERE iddisc=(SELECT iddisc FROM discipline WHERE ndisc='"+ dmodel->selectedDisc +"');");
        ui->label_2->setText("Соответствует");
        dmodel->conc=true;
        qDebug()<<dmodel->conc;
    }
    dmodel->update();
}
