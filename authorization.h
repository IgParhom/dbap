#ifndef AUTHORIZATION_H
#define AUTHORIZATION_H

#include <QWidget>
#include "mainwindow.h"
#include <QtSql>

namespace Ui {
class Authorization;
}

class Authorization : public QWidget
{
    Q_OBJECT

public:
    explicit Authorization(QWidget *parent = 0);
    ~Authorization();

private slots:
    void on_butAcc_clicked();

    void on_butCan_clicked();

private:
    Ui::Authorization *ui;
    MainWindow *mainwindow;
};

#endif // AUTHORIZATION_H
