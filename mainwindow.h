#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QApplication>
#include <QCloseEvent>

//#include <authorization.h>
#include <dialog.h>
#include <adddisc.h>
#include <addbook.h>
#include <addspec.h>
#include <addfond.h>

#include <QtSql>
#include <QMessageBox>
#include <QDebug>
#include <QSqlRelation>
#include <QSqlRelationalTableModel>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    //Authorization *auth;
    Dialog *dialog;
    AddDisc *adddisc;
    AddBook *addbook;
    AddSpec *addspec;
    AddFond *addfond;

    int number=0;

protected:
    void closeEvent(QCloseEvent *event) override;

private slots:

    void on_action_connect_triggered();

    void on_action_disconnect_triggered();

    void on_action_discipline_triggered();

    void on_action_book_triggered();

    void on_action_special_triggered();

    void on_action_fond_triggered();

    void on_buttonDisc_clicked();

    void on_comboBox_currentIndexChanged(const QString &arg1);

    void on_lineSearch_textChanged(const QString &arg1);

    void on_buttonAdd_clicked();

    void on_buttonDel_clicked();

    void on_table_clicked(const QModelIndex &index);

    void on_buttonDelCycle_clicked();

private:
    Ui::MainWindow *ui;
    QSqlTableModel *curModel;
    bool toLogWindow = false;
};

#endif // MAINWINDOW_H
