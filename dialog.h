#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QtSql>
#include <QMessageBox>
#include "addbookindisc.h"

namespace Ui {
class Dialog;
}

class Dialog : public QDialog
{
    Q_OBJECT

public:
    explicit Dialog(QWidget *parent = 0);
    ~Dialog();

    AddBookInDisc *addlibr;

private slots:
    void on_butAdd_clicked();

    void on_butDel_clicked();

    void on_butClos_clicked();

    void on_pushButton_clicked();

private:
    Ui::Dialog *ui;
};

#endif // DIALOG_H
