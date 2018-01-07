#-------------------------------------------------
#
# Project created by QtCreator 2012-05-29T14:50:42
#
#-------------------------------------------------

QT       += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

include(../_QT_Libs/qextserialport-1.2rc/src/qextserialport.pri)
#(google for qextserialport -> http://code.google.com/p/qextserialport/
# -> installation -> Usage(1) Source Code Only)

TARGET = SerialWin
TEMPLATE = app

#CONFIG += static   #test

SOURCES += main.cpp\
    ../_QT_Libs/HS-ULM/qhsuprot.cpp \
    Serial_main.cpp

HEADERS  += \
    ../_QT_Libs/HS-ULM/qhsuprot.h \
    Serial_main.h

FORMS    += \
    SerialMain.ui

OTHER_FILES += \
    App.rc \

win32:RC_FILE += App.rc
