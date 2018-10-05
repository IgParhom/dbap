#ifndef ADDFOND_H
#define ADDFOND_H

#include <QDialog>
#include <QtSql>

namespace Ui {
class AddFond;
}

class AddFond : public QDialog
{
    Q_OBJECT

public:
    explicit AddFond(QWidget *parent = 0);
    ~AddFond();

private slots:
    void on_butCan_clicked();

    void on_butAdd_clicked();

private:
    Ui::AddFond *ui;
};

#endif // ADDFOND_H
