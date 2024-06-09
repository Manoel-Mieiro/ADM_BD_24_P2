<center>

# Postgresql com PgBarman

Projeto dedicado a exemplificar o gerenciamento de backups com o PgBarman

</center>

> IMPORTANTE
> Todos os comandos a seguir devem ser executados na pasta raiz do projeto

---

<center>

## Rodar

</center>

Projeto precisa de algumas pastas e arquivos de chaves.
```bash
bash run.sh configure;
```

Buildar.
```bash
bash run.sh build;
```


Levantar os containers.
```bash
bash run.sh up;
```


Parar os containers.
```bash
bash run.sh stop;
```


Parar e remover os containers.
```bash
bash run.sh drop;
```


Parar, remover os containers e pastas e chaves criados (Remover por completo o projeto da maquina).
```bash
bash run.sh drop_hard;
```

> IMPORTANTE
> Depois do `bash run.sh drop_hard` todos os dados registrados ou utilizados para testes serão perdidos