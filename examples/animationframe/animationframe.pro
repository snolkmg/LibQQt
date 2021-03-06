#-------------------------------------------------
#
# Project created by QtCreator 2016-06-17T10:03:52
#
#-------------------------------------------------
QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = animationframe
TEMPLATE = app

INCLUDEPATH +=  $$PWD

SOURCES += $$PWD/main.cpp $$PWD/qqtapp.cpp $$PWD/qqtwindow.cpp \
    animationmanager.cpp

HEADERS  += $$PWD/qqtapp.h $$PWD/qqtwindow.h \
    animationmanager.h

FORMS    += $$PWD/qqtwindow.ui

#qmake_pre/post_link will work after source changed but not pro pri changed.
system("touch main.cpp")

#-------------------------------------------------
#link qqt library
#if you link a library to your app, on android you must select the running kit to the app, not LibQQt e.g.
#user can modify any infomation under this annotation
#-------------------------------------------------
include(../../multi-link/multi-link/add_base_manager.pri)



#-------------------------------------------------
#user app may use these these settings prefertly
#-------------------------------------------------
#-------------------------------------------------
#install app
#-------------------------------------------------
#CONFIG += can_install
can_install:equals(QSYS_PRIVATE, Embedded) {
    target.path = /Application
    INSTALLS += target
} else: unix {
    equals(QSYS_PRIVATE, macOS) {
        target.path = /Applications
        INSTALLS += target
    }
}

############
##config defination
############
equals(QSYS_PRIVATE, macOS) {
    CONFIG += app_bundle
}

contains(QSYS_PRIVATE, Android|AndroidX86) {
    CONFIG += mobility
    MOBILITY =
    DISTFILES += \
        android/AndroidManifest.xml

    ANDROID_PACKAGE_SOURCE_DIR = $${PWD}/android
}

#这个的设置有特点，要先设置
add_version (1,0,0,0)

#先发布App
#app从build到deploy
add_deploy()

#后发布依赖
#libQQt从sdk到build和deploy
add_dependent_manager(QQt)

#-------------------------------------------------
##project environ
#-------------------------------------------------
#default
message ($${TARGET} config $${CONFIG})
message ($${TARGET} define $${DEFINES})


