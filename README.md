# Customer Churn Analysis

## О проекте

Этот проект посвящён анализу customer churn (оттока клиентов) на основе датасета Telco Customer Churn.

Основная цель проекта — выявить факторы, влияющие на уход клиентов, а также определить наиболее рискованные сегменты пользователей с помощью SQL-анализа.

В рамках проекта был проведён полный exploratory data analysis (EDA) с использованием PostgreSQL.

Во время анализа были исследованы:
- типы контрактов клиентов,
- ежемесячные платежи,
- длительность использования сервиса (tenure),
- наличие технической поддержки,
- тип интернет-сервиса,
- методы оплаты,
- уровень churn среди различных групп клиентов.

Проект включает:
- проверку данных на NULL values и duplicate customer IDs,
- анализ customer behavior,
- расчёт churn rate,
- проверку бизнес-гипотез,
- поиск закономерностей в данных,
- формирование business insights и recommendations.

Для анализа использовались:
- GROUP BY,
- CASE WHEN,
- агрегатные функции,
- conditional aggregation,
- KPI calculations,
- business segmentation.

---

## Используемые инструменты
- PostgreSQL
- SQL
- GitHub

---

## Основные гипотезы проекта
- Клиенты с month-to-month контрактами уходят чаще.
- Высокие monthly charges могут влиять на churn.
- Новые клиенты чаще прекращают пользоваться сервисом.
- Отсутствие technical support увеличивает churn.
- Тип интернет-сервиса влияет на churn rate.
- Метод оплаты может быть связан с customer retention.

---

## Основные инсайты
- Клиенты с month-to-month контрактами показали самый высокий churn rate.
- Клиенты с более высокими monthly charges уходили чаще.
- Новые клиенты имели более высокий риск churn.
- Пользователи без technical support чаще прекращали пользоваться сервисом.
- Fiber Optic клиенты показали высокий churn rate.
- Пользователи electronic check чаще уходили по сравнению с другими payment methods.

---

## Бизнес-рекомендации
- Мотивировать клиентов переходить на долгосрочные контракты.
- Пересмотреть pricing strategy для high-paying customers.
- Улучшить onboarding и early customer engagement.
- Повысить доступность и качество technical support.
- Дополнительно исследовать причины churn среди Fiber Optic пользователей.
- Продвигать automatic payment methods для повышения customer retention.

---

## SQL Skills Used
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- CASE WHEN
- COUNT / AVG / MIN / MAX
- ROUND
- Conditional Aggregation
- KPI Calculations
- Churn Rate Analysis
