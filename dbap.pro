#-------------------------------------------------
#
# Project created by QtCreator 2018-07-30T17:33:43
#
#-------------------------------------------------

QT       += core gui sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = dbap
TEMPLATE = app
CONFIG += c++11


SOURCES += main.cpp\
        authorization.cpp \
    dialog.cpp \
    addbookindisc.cpp \
    adddisc.cpp \
    addspec.cpp \
    addbook.cpp \
    addfond.cpp \
    datamodel.cpp \
    mainwindow.cpp

HEADERS  += authorization.h \
    dialog.h \
    addbook.h \
    addbookindisc.h \
    adddisc.h \
    addspec.h \
    addfond.h \
    datamodel.h \
    mainwindow.h

FORMS    += authorization.ui \
    addspec.ui \
    addbookindisc.ui \
    dialog.ui \
    mainwindow.ui \
    adddisc.ui \
    addbook.ui \
    addfond.ui

DISTFILES += \
    create_script_1.sql \
    insert_script.sql \
    script.sql \
    Дополнения
