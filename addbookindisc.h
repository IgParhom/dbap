#ifndef ADDBOOKINDISC_H
#define ADDBOOKINDISC_H

#include <QDialog>
#include <QtSql>

namespace Ui {
class AddBookInDisc;
}

class AddBookInDisc : public QDialog
{
    Q_OBJECT

public:
    explicit AddBookInDisc(QWidget *parent = 0);
    ~AddBookInDisc();

private slots:
    void on_butAdd_clicked();

    void on_butCan_clicked();

private:
    Ui::AddBookInDisc *ui;
};

#endif // ADDBOOKINDISC_H
