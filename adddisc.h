#ifndef ADDDISC_H
#define ADDDISC_H

#include <QDialog>
#include <QtSql>

namespace Ui {
class AddDisc;
}

class AddDisc : public QDialog
{
    Q_OBJECT

public:
    explicit AddDisc(QWidget *parent = 0);
    ~AddDisc();
    QString conc;

private slots:
    void on_butAdd_clicked();

    void on_butCan_clicked();

    void on_radioDisc_clicked();

    void on_radioCycle_clicked();

private:
    Ui::AddDisc *ui;
};

#endif // ADDDISC_H
