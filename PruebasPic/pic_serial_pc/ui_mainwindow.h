/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.9.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *Frame;
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QVBoxLayout *verticalLayout_2;
    QHBoxLayout *horizontalLayout_7;
    QLabel *pathLabel;
    QLineEdit *devicePath;
    QHBoxLayout *horizontalLayout_3;
    QPushButton *openSerialButton;
    QPushButton *closeSerialButton;
    QSpacerItem *verticalSpacer;
    QVBoxLayout *commandsLayout_2;
    QLabel *label_4;
    QHBoxLayout *dataRow_2;
    QLabel *label_5;
    QLineEdit *inputText;
    QLabel *label_6;
    QHBoxLayout *commandRow1_2;
    QPushButton *setDataButton;
    QPushButton *getDataButton;
    QHBoxLayout *commandRow2_2;
    QPushButton *setControlButton;
    QPushButton *pulse1msButton;
    QLabel *portsLabel_2;
    QHBoxLayout *commandRow3_2;
    QPushButton *updatePortAButton;
    QPushButton *initializeScreenButton;
    QHBoxLayout *commandRow4_2;
    QPushButton *updatePortCButton;
    QPushButton *updatePortBButton;
    QPushButton *readAnalogButton;
    QVBoxLayout *outputLayout;
    QLabel *outputLabel;
    QTextEdit *outputText;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;
    QToolBar *toolBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(709, 506);
        Frame = new QWidget(MainWindow);
        Frame->setObjectName(QStringLiteral("Frame"));
        verticalLayoutWidget = new QWidget(Frame);
        verticalLayoutWidget->setObjectName(QStringLiteral("verticalLayoutWidget"));
        verticalLayoutWidget->setGeometry(QRect(10, 10, 679, 458));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        horizontalLayout_7 = new QHBoxLayout();
        horizontalLayout_7->setSpacing(6);
        horizontalLayout_7->setObjectName(QStringLiteral("horizontalLayout_7"));
        horizontalLayout_7->setSizeConstraint(QLayout::SetFixedSize);
        pathLabel = new QLabel(verticalLayoutWidget);
        pathLabel->setObjectName(QStringLiteral("pathLabel"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(pathLabel->sizePolicy().hasHeightForWidth());
        pathLabel->setSizePolicy(sizePolicy);

        horizontalLayout_7->addWidget(pathLabel);

        devicePath = new QLineEdit(verticalLayoutWidget);
        devicePath->setObjectName(QStringLiteral("devicePath"));

        horizontalLayout_7->addWidget(devicePath);


        verticalLayout_2->addLayout(horizontalLayout_7);

        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setSpacing(6);
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));
        horizontalLayout_3->setSizeConstraint(QLayout::SetFixedSize);
        openSerialButton = new QPushButton(verticalLayoutWidget);
        openSerialButton->setObjectName(QStringLiteral("openSerialButton"));

        horizontalLayout_3->addWidget(openSerialButton);

        closeSerialButton = new QPushButton(verticalLayoutWidget);
        closeSerialButton->setObjectName(QStringLiteral("closeSerialButton"));

        horizontalLayout_3->addWidget(closeSerialButton);


        verticalLayout_2->addLayout(horizontalLayout_3);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(verticalSpacer);


        horizontalLayout->addLayout(verticalLayout_2);

        commandsLayout_2 = new QVBoxLayout();
        commandsLayout_2->setSpacing(6);
        commandsLayout_2->setObjectName(QStringLiteral("commandsLayout_2"));
        label_4 = new QLabel(verticalLayoutWidget);
        label_4->setObjectName(QStringLiteral("label_4"));
        sizePolicy.setHeightForWidth(label_4->sizePolicy().hasHeightForWidth());
        label_4->setSizePolicy(sizePolicy);

        commandsLayout_2->addWidget(label_4);

        dataRow_2 = new QHBoxLayout();
        dataRow_2->setSpacing(6);
        dataRow_2->setObjectName(QStringLiteral("dataRow_2"));
        label_5 = new QLabel(verticalLayoutWidget);
        label_5->setObjectName(QStringLiteral("label_5"));
        sizePolicy.setHeightForWidth(label_5->sizePolicy().hasHeightForWidth());
        label_5->setSizePolicy(sizePolicy);

        dataRow_2->addWidget(label_5);

        inputText = new QLineEdit(verticalLayoutWidget);
        inputText->setObjectName(QStringLiteral("inputText"));

        dataRow_2->addWidget(inputText);


        commandsLayout_2->addLayout(dataRow_2);

        label_6 = new QLabel(verticalLayoutWidget);
        label_6->setObjectName(QStringLiteral("label_6"));
        sizePolicy.setHeightForWidth(label_6->sizePolicy().hasHeightForWidth());
        label_6->setSizePolicy(sizePolicy);

        commandsLayout_2->addWidget(label_6);

        commandRow1_2 = new QHBoxLayout();
        commandRow1_2->setSpacing(6);
        commandRow1_2->setObjectName(QStringLiteral("commandRow1_2"));
        commandRow1_2->setSizeConstraint(QLayout::SetDefaultConstraint);
        setDataButton = new QPushButton(verticalLayoutWidget);
        setDataButton->setObjectName(QStringLiteral("setDataButton"));

        commandRow1_2->addWidget(setDataButton);

        getDataButton = new QPushButton(verticalLayoutWidget);
        getDataButton->setObjectName(QStringLiteral("getDataButton"));

        commandRow1_2->addWidget(getDataButton);


        commandsLayout_2->addLayout(commandRow1_2);

        commandRow2_2 = new QHBoxLayout();
        commandRow2_2->setSpacing(6);
        commandRow2_2->setObjectName(QStringLiteral("commandRow2_2"));
        setControlButton = new QPushButton(verticalLayoutWidget);
        setControlButton->setObjectName(QStringLiteral("setControlButton"));

        commandRow2_2->addWidget(setControlButton);

        pulse1msButton = new QPushButton(verticalLayoutWidget);
        pulse1msButton->setObjectName(QStringLiteral("pulse1msButton"));

        commandRow2_2->addWidget(pulse1msButton);


        commandsLayout_2->addLayout(commandRow2_2);

        portsLabel_2 = new QLabel(verticalLayoutWidget);
        portsLabel_2->setObjectName(QStringLiteral("portsLabel_2"));
        sizePolicy.setHeightForWidth(portsLabel_2->sizePolicy().hasHeightForWidth());
        portsLabel_2->setSizePolicy(sizePolicy);

        commandsLayout_2->addWidget(portsLabel_2);

        commandRow3_2 = new QHBoxLayout();
        commandRow3_2->setSpacing(6);
        commandRow3_2->setObjectName(QStringLiteral("commandRow3_2"));
        updatePortAButton = new QPushButton(verticalLayoutWidget);
        updatePortAButton->setObjectName(QStringLiteral("updatePortAButton"));

        commandRow3_2->addWidget(updatePortAButton);

        initializeScreenButton = new QPushButton(verticalLayoutWidget);
        initializeScreenButton->setObjectName(QStringLiteral("initializeScreenButton"));

        commandRow3_2->addWidget(initializeScreenButton);


        commandsLayout_2->addLayout(commandRow3_2);

        commandRow4_2 = new QHBoxLayout();
        commandRow4_2->setSpacing(6);
        commandRow4_2->setObjectName(QStringLiteral("commandRow4_2"));
        updatePortCButton = new QPushButton(verticalLayoutWidget);
        updatePortCButton->setObjectName(QStringLiteral("updatePortCButton"));

        commandRow4_2->addWidget(updatePortCButton);

        updatePortBButton = new QPushButton(verticalLayoutWidget);
        updatePortBButton->setObjectName(QStringLiteral("updatePortBButton"));

        commandRow4_2->addWidget(updatePortBButton);


        commandsLayout_2->addLayout(commandRow4_2);

        readAnalogButton = new QPushButton(verticalLayoutWidget);
        readAnalogButton->setObjectName(QStringLiteral("readAnalogButton"));

        commandsLayout_2->addWidget(readAnalogButton);


        horizontalLayout->addLayout(commandsLayout_2);


        verticalLayout->addLayout(horizontalLayout);

        outputLayout = new QVBoxLayout();
        outputLayout->setSpacing(6);
        outputLayout->setObjectName(QStringLiteral("outputLayout"));
        outputLabel = new QLabel(verticalLayoutWidget);
        outputLabel->setObjectName(QStringLiteral("outputLabel"));

        outputLayout->addWidget(outputLabel);

        outputText = new QTextEdit(verticalLayoutWidget);
        outputText->setObjectName(QStringLiteral("outputText"));
        outputText->setReadOnly(true);

        outputLayout->addWidget(outputText);


        verticalLayout->addLayout(outputLayout);

        MainWindow->setCentralWidget(Frame);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 709, 19));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);
        toolBar = new QToolBar(MainWindow);
        toolBar->setObjectName(QStringLiteral("toolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, toolBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", Q_NULLPTR));
        pathLabel->setText(QApplication::translate("MainWindow", "Serial port path", Q_NULLPTR));
        openSerialButton->setText(QApplication::translate("MainWindow", "Open", Q_NULLPTR));
        closeSerialButton->setText(QApplication::translate("MainWindow", "Close", Q_NULLPTR));
        label_4->setText(QApplication::translate("MainWindow", "TftLcdIO test", Q_NULLPTR));
        label_5->setText(QApplication::translate("MainWindow", "Command data", Q_NULLPTR));
        label_6->setText(QApplication::translate("MainWindow", "Commands", Q_NULLPTR));
        setDataButton->setText(QApplication::translate("MainWindow", "Set Data", Q_NULLPTR));
        getDataButton->setText(QApplication::translate("MainWindow", "Get Data", Q_NULLPTR));
        setControlButton->setText(QApplication::translate("MainWindow", "Set Control", Q_NULLPTR));
        pulse1msButton->setText(QApplication::translate("MainWindow", "Pulse 1MS", Q_NULLPTR));
        portsLabel_2->setText(QApplication::translate("MainWindow", "Port operations", Q_NULLPTR));
        updatePortAButton->setText(QApplication::translate("MainWindow", "Update PORTA", Q_NULLPTR));
        initializeScreenButton->setText(QApplication::translate("MainWindow", "Initialize Screen", Q_NULLPTR));
        updatePortCButton->setText(QApplication::translate("MainWindow", "Update PORTC", Q_NULLPTR));
        updatePortBButton->setText(QApplication::translate("MainWindow", "Update PORTB", Q_NULLPTR));
        readAnalogButton->setText(QApplication::translate("MainWindow", "Read Analog", Q_NULLPTR));
        outputLabel->setText(QApplication::translate("MainWindow", "Output", Q_NULLPTR));
        outputText->setHtml(QApplication::translate("MainWindow", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:'Sans Serif'; font-size:9pt; font-weight:400; font-style:normal;\">\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600; color:#0055ff;\">Hola</span><span style=\" font-weight:600;\"> </span><span style=\" font-weight:600; color:#55ff7f;\">que</span><span style=\" font-weight:600;\"> </span><span style=\" font-weight:600; color:#ff5500;\">tal</span></p></body></html>", Q_NULLPTR));
        toolBar->setWindowTitle(QApplication::translate("MainWindow", "toolBar", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
