#include "stopwatch.h"

Stopwatch::Stopwatch(QObject *parent)
{
    Q_UNUSED(parent);

    qDebug() << "Stopwatch called";
    m_timer.setInterval(15);
    m_timer.start();
}

void Stopwatch::start()
{
    qDebug() << "start called";
    m_timer.start();
    connect(&m_timer, SIGNAL(timeout()), this, SLOT(timeout()));

    m_watch.start();

}

void Stopwatch::stop()
{
    qDebug() << "stop called";

    disconnect(&m_timer, SIGNAL(timeout()), this, SLOT(timeout()));

    double value = (double)m_watch.elapsed() / 1000.0;

    if ( (!m_fastest && value > m_best)     // slowest mode, update if this is our longest time
         || (m_fastest && value < m_best) ) // fastest mode, update if this is our shortest time
    {
        setBest(value);
    }
}

void Stopwatch::reset()
{
    qDebug() << "reset called";
    m_watch.restart();
    setDisplay("0.00");
    setBest(0.00);
}

void Stopwatch::toggle(bool value)
{
    qDebug() << "toggle called: " << value;
    m_fastest = value;
}

void Stopwatch::timeout()
{
    //qDebug() << "timeout called";
    updateDisplay(false);
}

void Stopwatch::updateDisplay(bool reset)
{
    //qDebug() << "updateDisplay called";
    double elapsedDbl = (double)m_watch.elapsed() / 1000.0;
    QString value = reset ? 0 : QString::number(elapsedDbl, 'f', 2);

    setDisplay(value);
}

double Stopwatch::best()
{
    qDebug() << "best called";
    return m_best;
}

void Stopwatch::setBest(double value)
{
    qDebug() << "setBest called";

    m_best = value;
    emit bestChanged(); // updates value in QML
}


void Stopwatch::setDisplay(QString value)
{
    //qDebug() << "setDisplay called";
    if (value == m_display)
        return;
    m_display = value;
    emit displayChanged();

}

QString Stopwatch::display()
{
    //qDebug() << "display called";
    return m_display;
}


