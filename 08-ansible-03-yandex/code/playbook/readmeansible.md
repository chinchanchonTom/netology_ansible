--- 
### Clickhouse-Vector-Lighthouse-playbook
---

Этот playbook развертывает на ВМ инфаструктуру для сбора и анализа логов при помощи Clickhouse-Vector-Lighthouse.

Playbook разбит на 3 отделных настройки в 1 playbook.
# Clickhouse в качестве БД
# Vector в качестве транспорта
# Lighthouse в качестве просмотрщика таблицы с логами


В конце плейбука выдает конечную ссылку для подключения в котором уже все подключения к БД прописаны. 
---

Подготовка к использованию

---
Внимание!!! Данная установка подойте только для Centos. Для ubuntu использовать другие плейбуки. 
Для установки укажите в inventory\prod.yml 
1. Хосты
2. IP адреса хостов 
3.  Пользователя под котором вы хотите подключаться (Должны быть прописаны заранее и иметь доступ по ssh)

shell ```

clickhouse:# Группа хостов для установки clickhouse 
  hosts:
    clickhouse-01:# Название ВМ
      ansible_host: <IP address># IP адресс ВМ
      ansible_user: <User># Пользователь 
      ansible_connection: ssh #Способ подключения 
vector:# Группа хостов для установки vector
  hosts:
    vector-01:# Название ВМ
      ansible_host: <IP address>#
      ansible_user: <User>#
      ansible_connection: ssh#
lighthouse:# Группа хостов для установки lighthouse
  hosts:#
    lighthouse-01:# Название ВМ
      ansible_host: <IP address> # IP адресс ВМ
      ansible_user: <User> # IP адресс ВМ
      ansible_connection: ssh # IP адресс ВМ

```

Выбора версии, архитектуры и порта для  Vector, Clickhouse и Lighthouse нужно изменить параметры в group_vars/{Vector, Clickhouse ,Lighthouse}
shell ```
clickhouse_version: "22.3.3.44"

vector_version: "0.33.0"
vector_arch: "x86_64"


lighthouse_port: 8080

```
---
 Установка 

shell ```

ansible-playbook -i invetory/prod.yml site.yml

```
