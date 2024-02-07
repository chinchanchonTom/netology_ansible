# Домашнее задание к занятию 1 «Введение в Ansible»

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

<details><summary>Решение:</summary>

some_fact=12
![запуск ansible](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/step1%20facts.png)

</details>


2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

<details><summary>Решение:</summary>


![Проверка артефакта](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/step2.png)
</details>


3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

<details><summary>Решение:</summary>

![Check docker conteiners](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/create%20containers.png)
</details>


4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

<details><summary>Решение:</summary>

```shell
$ ansible-playbook site.yml -i inventory/prod.yml

PLAY [Print os facts] *******************************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************************************
ok: [ubuntu]
ok: [centos7]

TASK [Print OS] *************************************************************************************************************************************************************************
ok: [centos7] => {
    "msg": "CentOS"
}
ok: [ubuntu] => {
    "msg": "Ubuntu"
}

TASK [Print fact] ***********************************************************************************************************************************************************************
ok: [centos7] => {
    "msg": "el"
}
ok: [ubuntu] => {
    "msg": "deb"
}

PLAY RECAP ******************************************************************************************************************************************************************************
centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```


</details>


5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

<details><summary>Решение:</summary>

![изменение facts](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/new%20facts%20deb%2Cel.png)

</details>

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

<details><summary>Решение:</summary>

![check facts](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/new%20facts%20deb%2Cel.png)

</details>


7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.



<details><summary>Решение:</summary>

```shell
ansible-vault encrypt group_vars/{deb,el}/examp.yml
New Vault password: 
Confirm New Vault password: 
Encryption successful
```

![example descrypt](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/%D0%9F%D1%80%D0%B8%D0%BC%D0%B5%D1%80%20%D1%88%D0%B8%D1%84%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F.png)



</details>



8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.


<details><summary>Решение:</summary>

![check ](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/prod_vault.png)



</details>




9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.


<details><summary>Решение:</summary>

![search doc](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/ansible-doc.png)



</details>



10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

<details><summary>Решение:</summary>

Тут назвал рандомно группу win7 в коде изменил.

![search doc](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/%D0%BD%D0%BE%D0%B2%D0%B0%D1%8F%20%D0%B3%D1%80%D1%83%D0%BF%D0%BF%D0%B0%20%D1%85%D0%BE%D1%81%D1%82%D0%BE%D0%B2.png)



</details>


11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из 
верных `group_vars`.

<details><summary>Решение:</summary>



![search doc](https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/prod_vault.png)



</details>



12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

https://github.com/chinchanchonTom/netology_ansible/blob/main/08-ansible-01-base/img/prod_vault.png


13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.
2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.
3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.
4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).
5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.

---

#
