---

## Установка 

---

Данный playbook Автоматически устанавливает и насатраивает clickhouse и vector для уже настроенных докер контейнеров. 
Данные для изменения хостов находятся в playbook\inventory\prod используйте эти строки что бы изменить: Имя группы хостов, имя хостов и способ подключения и т.д



```shell

  click-docker: # имя группы хостов 
    hosts:
      click:# Имя хоста 
        ansible_connection: docker# способ подключения 
  vector-docker:#имя группы хостов 
    hosts:
      vector:#Имя хоста 
       ansible_connection: docker # способ подключения 

```

Для Установки в примере используется Centos7 

## Версия 

Для выбора версии и архитектуры зайдите и замените переменные в playbook\groupvars\click-docker или vector-docker соответвующие данные 

```shell


clickhouse_version: "22.3.3.44"
clickhouse_arch: "x86_64"

vector_version: "0.33.0"
vector_arch: "x86_64"


```
Настройки пользователя в playbook (а именно комманда become: True ) закоментирована по причине что в контейнере его нету. Используйте эту настройку для установки для виртуальных машин или серверов. 

--- 
## запуск и проверка 
Для проверки выполните и исправьте ошибки 
```shell

ansible-lint site.yml

```

Что бы запустить playbook запустите команду 

```shell

ansible-playbook -i /inventory/prod.yml site.yml

```
Где укажете путь до файла конфигурации и имя playbook 

qwerer