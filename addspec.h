#ifndef ADDSPEC_H
#define ADDSPEC_H

#include <QDialog>
#include <QtSql>

namespace Ui {
class AddSpec;
}

class AddSpec : public QDialog
{
    Q_OBJECT

public:
    explicit AddSpec(QWidget *parent = 0);
    ~AddSpec();

private slots:
    void on_butAdd_clicked();

    void on_butCan_clicked();

private:
    Ui::AddSpec *ui;
};

#endif // ADDSPEC_H
