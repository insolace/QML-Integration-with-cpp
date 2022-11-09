#ifndef STOPWATCH_H
#define STOPWATCH_H

#include <QObject>
#include <QVariant>
#include <QTimer>
#include <QElapsedTimer>
#include <QDebug>

class Stopwatch : public QObject
{
    Q_OBJECT

    // properties used in QML, NOTIFY is a signal
    Q_PROPERTY(double best READ best WRITE setBest NOTIFY bestChanged)
    Q_PROPERTY(QString display READ display WRITE setDisplay NOTIFY displayChanged)

public:
    explicit Stopwatch(QObject *parent = nullptr);

signals:
    void bestChanged();
    void displayChanged();

public slots:

    void start();
    void stop();
    void reset();
    void toggle(bool value);

    void timeout();

private:
    QTimer m_timer;
    QElapsedTimer m_watch;
    QString m_display;
    double m_best;
    bool m_fastest;


    void updateDisplay(bool reset = false);
    double best();
    void setBest(double value);
    QString display();
    void setDisplay(QString value);

};

#endif // STOPWATCH_H
