/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.6.2
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
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QToolBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout_2;
    QPushButton *openSerialButton;
    QLineEdit *portNameText;
    QHBoxLayout *horizontalLayout_5;
    QPushButton *initializeScreenButton;
    QLineEdit *lineEdit_5;
    QHBoxLayout *horizontalLayout_8;
    QPushButton *portAUpdate;
    QLineEdit *portAText;
    QHBoxLayout *horizontalLayout;
    QPushButton *portBUpdateButton;
    QLineEdit *portBText;
    QHBoxLayout *horizontalLayout_4;
    QPushButton *portCUpdateButton;
    QLineEdit *portCText;
    QHBoxLayout *horizontalLayout_6;
    QPushButton *readAnalogButton;
    QLineEdit *channelText;
    QTextEdit *outputText;
    QMenuBar *menuBar;
    QToolBar *mainToolBar;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(400, 300);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QStringLiteral("centralWidget"));
        verticalLayoutWidget = new QWidget(centralWidget);
        verticalLayoutWidget->setObjectName(QStringLiteral("verticalLayoutWidget"));
        verticalLayoutWidget->setGeometry(QRect(20, 20, 321, 392));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setSpacing(6);
        verticalLayout->setContentsMargins(11, 11, 11, 11);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setSizeConstraint(QLayout::SetMaximumSize);
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setSpacing(6);
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        horizontalLayout_2->setSizeConstraint(QLayout::SetFixedSize);
        openSerialButton = new QPushButton(verticalLayoutWidget);
        openSerialButton->setObjectName(QStringLiteral("openSerialButton"));

        horizontalLayout_2->addWidget(openSerialButton);

        portNameText = new QLineEdit(verticalLayoutWidget);
        portNameText->setObjectName(QStringLiteral("portNameText"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(portNameText->sizePolicy().hasHeightForWidth());
        portNameText->setSizePolicy(sizePolicy);
        portNameText->setMinimumSize(QSize(100, 0));

        horizontalLayout_2->addWidget(portNameText);


        verticalLayout->addLayout(horizontalLayout_2);

        horizontalLayout_5 = new QHBoxLayout();
        horizontalLayout_5->setSpacing(6);
        horizontalLayout_5->setObjectName(QStringLiteral("horizontalLayout_5"));
        initializeScreenButton = new QPushButton(verticalLayoutWidget);
        initializeScreenButton->setObjectName(QStringLiteral("initializeScreenButton"));

        horizontalLayout_5->addWidget(initializeScreenButton);

        lineEdit_5 = new QLineEdit(verticalLayoutWidget);
        lineEdit_5->setObjectName(QStringLiteral("lineEdit_5"));
        sizePolicy.setHeightForWidth(lineEdit_5->sizePolicy().hasHeightForWidth());
        lineEdit_5->setSizePolicy(sizePolicy);
        lineEdit_5->setMinimumSize(QSize(100, 0));

        horizontalLayout_5->addWidget(lineEdit_5);


        verticalLayout->addLayout(horizontalLayout_5);

        horizontalLayout_8 = new QHBoxLayout();
        horizontalLayout_8->setSpacing(6);
        horizontalLayout_8->setObjectName(QStringLiteral("horizontalLayout_8"));
        portAUpdate = new QPushButton(verticalLayoutWidget);
        portAUpdate->setObjectName(QStringLiteral("portAUpdate"));

        horizontalLayout_8->addWidget(portAUpdate);

        portAText = new QLineEdit(verticalLayoutWidget);
        portAText->setObjectName(QStringLiteral("portAText"));
        sizePolicy.setHeightForWidth(portAText->sizePolicy().hasHeightForWidth());
        portAText->setSizePolicy(sizePolicy);
        portAText->setMinimumSize(QSize(100, 0));

        horizontalLayout_8->addWidget(portAText);


        verticalLayout->addLayout(horizontalLayout_8);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setSpacing(6);
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalLayout->setSizeConstraint(QLayout::SetDefaultConstraint);
        portBUpdateButton = new QPushButton(verticalLayoutWidget);
        portBUpdateButton->setObjectName(QStringLiteral("portBUpdateButton"));

        horizontalLayout->addWidget(portBUpdateButton);

        portBText = new QLineEdit(verticalLayoutWidget);
        portBText->setObjectName(QStringLiteral("portBText"));
        sizePolicy.setHeightForWidth(portBText->sizePolicy().hasHeightForWidth());
        portBText->setSizePolicy(sizePolicy);
        portBText->setMinimumSize(QSize(100, 0));

        horizontalLayout->addWidget(portBText);


        verticalLayout->addLayout(horizontalLayout);

        horizontalLayout_4 = new QHBoxLayout();
        horizontalLayout_4->setSpacing(6);
        horizontalLayout_4->setObjectName(QStringLiteral("horizontalLayout_4"));
        portCUpdateButton = new QPushButton(verticalLayoutWidget);
        portCUpdateButton->setObjectName(QStringLiteral("portCUpdateButton"));

        horizontalLayout_4->addWidget(portCUpdateButton);

        portCText = new QLineEdit(verticalLayoutWidget);
        portCText->setObjectName(QStringLiteral("portCText"));
        sizePolicy.setHeightForWidth(portCText->sizePolicy().hasHeightForWidth());
        portCText->setSizePolicy(sizePolicy);
        portCText->setMinimumSize(QSize(100, 0));

        horizontalLayout_4->addWidget(portCText);


        verticalLayout->addLayout(horizontalLayout_4);

        horizontalLayout_6 = new QHBoxLayout();
        horizontalLayout_6->setSpacing(6);
        horizontalLayout_6->setObjectName(QStringLiteral("horizontalLayout_6"));
        readAnalogButton = new QPushButton(verticalLayoutWidget);
        readAnalogButton->setObjectName(QStringLiteral("readAnalogButton"));

        horizontalLayout_6->addWidget(readAnalogButton);

        channelText = new QLineEdit(verticalLayoutWidget);
        channelText->setObjectName(QStringLiteral("channelText"));
        sizePolicy.setHeightForWidth(channelText->sizePolicy().hasHeightForWidth());
        channelText->setSizePolicy(sizePolicy);
        channelText->setMinimumSize(QSize(100, 0));

        horizontalLayout_6->addWidget(channelText);


        verticalLayout->addLayout(horizontalLayout_6);

        outputText = new QTextEdit(verticalLayoutWidget);
        outputText->setObjectName(QStringLiteral("outputText"));

        verticalLayout->addWidget(outputText);

        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QStringLiteral("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 400, 19));
        MainWindow->setMenuBar(menuBar);
        mainToolBar = new QToolBar(MainWindow);
        mainToolBar->setObjectName(QStringLiteral("mainToolBar"));
        MainWindow->addToolBar(Qt::TopToolBarArea, mainToolBar);
        statusBar = new QStatusBar(MainWindow);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        MainWindow->setStatusBar(statusBar);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", 0));
        openSerialButton->setText(QApplication::translate("MainWindow", "Open serial port", 0));
#ifndef QT_NO_TOOLTIP
        portNameText->setToolTip(QApplication::translate("MainWindow", "Serial port device, e.g. /dev/ttyACM0", 0));
#endif // QT_NO_TOOLTIP
        initializeScreenButton->setText(QApplication::translate("MainWindow", "Initialize Screen", 0));
        portAUpdate->setText(QApplication::translate("MainWindow", "Update PORTA", 0));
        portBUpdateButton->setText(QApplication::translate("MainWindow", "Update PORTB", 0));
#ifndef QT_NO_TOOLTIP
        portBText->setToolTip(QApplication::translate("MainWindow", "Value to set on PORTB", 0));
#endif // QT_NO_TOOLTIP
        portCUpdateButton->setText(QApplication::translate("MainWindow", "Update PORTC", 0));
#ifndef QT_NO_TOOLTIP
        portCText->setToolTip(QApplication::translate("MainWindow", "Value to set on PORTC", 0));
#endif // QT_NO_TOOLTIP
        readAnalogButton->setText(QApplication::translate("MainWindow", "Read Analog", 0));
#ifndef QT_NO_TOOLTIP
        channelText->setToolTip(QApplication::translate("MainWindow", "Channel to read on PORTA", 0));
#endif // QT_NO_TOOLTIP
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
