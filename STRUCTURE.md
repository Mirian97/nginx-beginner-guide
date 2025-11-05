Dentro de um **container oficial do NGINX**, os arquivos principais seguem sempre a mesma estrutura — independentemente de você usar Debian, Alpine ou a versão “slim”.

Aqui está o mapa completo:

# **📁 Estrutura principal do NGINX no container oficial**

## **1. Configurações**

**/etc/nginx/**
Aqui ficam todos os arquivos de configuração do NGINX.

Os principais:

| Arquivo / Pasta                    | Função                                                       |
| ---------------------------------- | ------------------------------------------------------------ |
| **/etc/nginx/nginx.conf**          | Arquivo principal do NGINX (config global + includes)        |
| **/etc/nginx/conf.d/**             | Contém arquivos `.conf` adicionais, incluindo `default.conf` |
| **/etc/nginx/conf.d/default.conf** | Config geral do servidor padrão (porta 80 etc.)              |
| **/etc/nginx/mime.types**          | Mapping de tipos MIME (css, js, png etc.)                    |
| **/etc/nginx/modules/**            | Módulos carregados dinamicamente (se existirem)              |

---

## **2. Conteúdo / arquivos públicos**

**/usr/share/nginx/html/**
Diretório padrão servido pelo NGINX quando você não altera configs.

Contém normalmente:

- `index.html`
- `50x.html`

Se você copiar seu frontend estático sem alterar configs, esses arquivos vão aqui.

---

## **3. Logs**

**/var/log/nginx/**

Arquivos mais comuns:

- **access.log** — logs de requisições
- **error.log** — logs de erro do NGINX

Dentro de containers, esses arquivos muitas vezes **são redirecionados para stdout/stderr**, então você vê tudo com:

```
docker logs <container>
```

---

## **4. PID e runtime**

**/var/run/nginx.pid**
Contém o PID do processo master do NGINX.

Útil para enviar sinais manualmente:

```
kill -s reload $(cat /var/run/nginx.pid)
```

---

## **5. Binário**

**/usr/sbin/nginx**
Esse é o executável principal.

---

# **Mapa geral resumido:**

```
/etc/nginx/
    nginx.conf
    conf.d/
        default.conf
    mime.types

/usr/share/nginx/html/
    index.html
    50x.html

/var/log/nginx/
    access.log
    error.log

/var/run/nginx.pid

/usr/sbin/nginx
```

---

# Quer ver isso funcionando agora?

Se você estiver dentro do container, rode:

### **Listar configs**

```
ls -R /etc/nginx
```

### **Listar arquivos públicos**

```
ls /usr/share/nginx/html
```

### **Ver PID**

```
cat /var/run/nginx.pid
```
