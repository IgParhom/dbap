#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "datamodel.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QApplication::setQuitOnLastWindowClosed(false);

    ui->buttonDisc->setVisible(false);
    ui->stackedWidget->setCurrentIndex(0);

    adddisc = new AddDisc();
    addbook = new AddBook();
    addspec = new AddSpec();
    addfond = new AddFond();

    ui->table->setSelectionBehavior(QAbstractItemView::SelectRows); // выбор строки
    ui->table->setSelectionMode(QAbstractItemView::SingleSelection); // выбор только одной строки
    ui->table->verticalHeader()->setVisible(false); // скрытие индексов
    on_action_discipline_triggered();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_action_connect_triggered()
{

}

void MainWindow::on_action_disconnect_triggered()
{
    this->toLogWindow = true;
    this->close();
}

void MainWindow::closeEvent(QCloseEvent *event) {

    dmodel->disconnect();
    if(this->toLogWindow) {
        this->hide();
        this->parentWidget()->show();
    }
    else {
        exit(1);
    }
    event->accept();
}

void MainWindow::on_action_discipline_triggered()
{
    curModel = dmodel->discincycle;

    number=0;
    ui->lineSearch->setText("");

    ui->stackedWidget->setCurrentIndex(0);
    ui->buttonDisc->setVisible(true);
    ui->buttonDelCycle->setVisible(true);

    ui->table->setModel(curModel);
    ui->table->setColumnHidden(0,false);
    ui->table->setColumnWidth(0,ui->table->width()*0.4-1);
    ui->table->setColumnWidth(1,ui->table->width()*0.4-1);
    ui->table->setColumnWidth(2,ui->table->width()*0.2-1);
    ui->table->show();
}

void MainWindow::on_action_book_triggered()
{
    curModel = dmodel->book;

    number=1;
    ui->lineSearch->setText("");

    ui->stackedWidget->setCurrentIndex(0);
    ui->buttonDisc->setVisible(false);
    ui->buttonDelCycle->setVisible(false);

    ui->table->setModel(curModel);
    ui->table->setColumnHidden(0,true);
    ui->table->setColumnWidth(1,ui->table->width()*0.35-1);
    ui->table->setColumnWidth(2,ui->table->width()*0.35-1);
    ui->table->setColumnWidth(3,ui->table->width()*0.15-1);
    ui->table->setColumnWidth(4,ui->table->width()*0.15-1);
    ui->table->show();
}

void MainWindow::on_action_special_triggered()
{
    curModel = dmodel->special;

    number=2;
    ui->lineSearch->setText("");

    ui->stackedWidget->setCurrentIndex(0);
    ui->buttonDisc->setVisible(false);
    ui->buttonDelCycle->setVisible(false);

    ui->table->setModel(curModel);
    ui->table->setColumnHidden(0,true);
    ui->table->setColumnWidth(1,ui->table->width()-1);
    ui->table->show();
}

void MainWindow::on_action_fond_triggered()
{
    curModel = dmodel->fond;

    ui->comboBox->setModel(dmodel->special);
    ui->comboBox->setModelColumn(1);
    ui->comboBox->setCurrentIndex(0);

    number=3;
    ui->lineSearch->setText("");

    ui->stackedWidget->setCurrentIndex(1);
    ui->buttonDisc->setVisible(false);
    ui->buttonDelCycle->setVisible(false);

    ui->table->setModel(curModel);
    ui->table->setColumnHidden(0,true);
    ui->table->setColumnWidth(1,ui->table->width()*0.8-1);
    ui->table->setColumnWidth(2,ui->table->width()*0.2-1);
    ui->table->show();
}

void MainWindow::on_buttonDisc_clicked()
{
    dmodel->selectedDisc = curModel->record(ui->table->selectionModel()->currentIndex().row()).field(0).value().toString();
    if(curModel->record(ui->table->selectionModel()->currentIndex().row()).field(2).value().toString()=="Соответствует")
        dmodel->conc=true;
    else dmodel->conc=false;
    qDebug()<<dmodel->selectedDisc;
    dialog = new Dialog();
    dialog->setModal(true);
    dialog->show();
}

void MainWindow::on_comboBox_currentIndexChanged(const QString &arg1)
{
    curModel->setFilter("idspec IN (SELECT idspec FROM special WHERE nspec='"+arg1+"')");
    if(ui->table->currentIndex().row() < 0)
        ui->buttonDel->setDisabled(true);
    else ui->buttonDel->setDisabled(false);
}

void MainWindow::on_lineSearch_textChanged(const QString &arg1)
{
    switch (number) {
    case 0:{
        if(arg1=="")
        {
            curModel->setFilter("");
            if(ui->table->currentIndex().row() < 0)
                ui->buttonDel->setDisabled(true);
            else ui->buttonDel->setDisabled(false);        }
        else
        {
            curModel->setFilter("ndisc LIKE '%"+arg1+"%'");
            if(ui->table->currentIndex().row() < 0)
                ui->buttonDel->setDisabled(true);
            else ui->buttonDel->setDisabled(false);
        }
        break;}
    case 1:{
        if(arg1=="")
        {
            curModel->setFilter("");
            if(ui->table->currentIndex().row() < 0)
                ui->buttonDel->setDisabled(true);
            else ui->buttonDel->setDisabled(false);        }
        else
        {
            curModel->setFilter("nbook LIKE '%"+arg1+"%'");
            if(ui->table->currentIndex().row() < 0)
                ui->buttonDel->setDisabled(true);
            else ui->buttonDel->setDisabled(false);
        }
        break;}
    case 2:{
        if(arg1=="")
        {
            curModel->setFilter("");
            if(ui->table->currentIndex().row() < 0)
                ui->buttonDel->setDisabled(true);
            else ui->buttonDel->setDisabled(false);        }
        else
        {
            curModel->setFilter("nspec LIKE '%"+arg1+"%'");
            if(ui->table->currentIndex().row() < 0)
                ui->buttonDel->setDisabled(true);
            else ui->buttonDel->setDisabled(false);
        }
        break;}
    default:
    {
        ui->buttonDel->setDisabled(false);
        break;
    }
    }
}

void MainWindow::on_buttonAdd_clicked()
{
    switch (number) {
    case 0:{
        adddisc->setModal(true);
        adddisc->show();
        break;}
    case 1:{
        addbook->setModal(true);
        addbook->show();
        break;}
    case 2:{
        addspec->setModal(true);
        addspec->show();
        break;}
    case 3:{
        addfond->setModal(true);
        addfond->show();
        break;}
    default:
        break;
    }
}

void MainWindow::on_buttonDel_clicked()
{
    switch (number) {
    case 0:{

        dmodel->query->exec("DELETE FROM discipline WHERE ndisc='" + curModel->record(ui->table->selectionModel()->currentIndex().row()).field(0).value().toString() + "';");
        dmodel->update();
        break;}
    case 1:{
        dmodel->query->exec("DELETE FROM book WHERE idbook='" + curModel->record(ui->table->selectionModel()->currentIndex().row()).field(0).value().toString() + "';");
        dmodel->update();
        break;}
    case 2:{
        dmodel->query->exec("DELETE FROM special WHERE idspec='" + curModel->record(ui->table->selectionModel()->currentIndex().row()).field(0).value().toString() + "';");
        dmodel->update();
        break;}
    case 3:{
        int i= ui->comboBox->currentIndex();
        dmodel->query->exec("DELETE FROM bookamount WHERE idspec=(SELECT idspec FROM special WHERE nspec='" + ui->comboBox->currentText() + "') "
                                                    "AND idbook=(SELECT idbook FROM book WHERE nbook='" + curModel->record(ui->table->selectionModel()->currentIndex().row()).field(1).value().toString() + "');");
        dmodel->update();
        ui->comboBox->setCurrentIndex(i);
        break;}
    default:
        break;
    }
}

void MainWindow::on_table_clicked(const QModelIndex &index)
{
    if(ui->buttonDel->isEnabled() && index.row()<0){
        ui->buttonDel->setDisabled(true);
        ui->buttonDisc->setDisabled(true);
    }
    else if (!ui->buttonDel->isEnabled()){
        ui->buttonDel->setEnabled(true);
        ui->buttonDisc->setEnabled(true);
    }
}

void MainWindow::on_buttonDelCycle_clicked()
{
    dmodel->query->exec("DELETE FROM cycle WHERE ncycle='" + curModel->record(ui->table->selectionModel()->currentIndex().row()).field(1).value().toString() + "';");
    dmodel->update();
}
