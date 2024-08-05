# Actividad 3: Administración de Usuarios, Grupos y Permisos en Linux

## Parte 1: Gestión de Usuarios

### 1. Creación de Usuarios

**Comando:**

```
sudo adduser usuario1
sudo adduser usuario2
sudo adduser usuario3
```

**Resultado:**

```
info: Adding user `usuario1' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `usuario1' (1001) ...
info: Adding new user `usuario1' (1001) with group `usuario1' ...
info: Creating home directory `/home/usuario1' ...
info: Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for usuario1
Enter the new value, or press ENTER for the default
    Full Name []:
    Room Number []:
    Work Phone []:
    Home Phone []:
    Other []:
Is the information correct? [Y/n]
info: Adding new user `usuario1' to supplemental/extra groups `users' ...
info: Adding user `usuario1' to group `users' ...
```

```
info: Adding user usuario2' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group usuario2' (1002) ...
info: Adding new user usuario2' (1002) with group usuario2' ...
info: Creating home directory /home/usuario2' ...
info: Copying files from /etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for usuario2
Enter the new value, or press ENTER for the default
    Full Name []:
    Room Number []:
    Work Phone []:
    Home Phone []:
    Other []:
Is the information correct? [Y/n]
info: Adding new user usuario2' to supplemental/extra groups users' ...
info: Adding user usuario2' to group users' ...
```

```
info: Adding user `usuario3' ...
info: Selecting UID/GID from range 1000 to 59999 ...
info: Adding new group `usuario3' (1003) ...
info: Adding new user `usuario3' (1003) with group `usuario3' ...
info: Creating home directory `/home/usuario3' ...
info: Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for usuario3
Enter the new value, or press ENTER for the default
    Full Name []:
    Room Number []:
    Work Phone []:
    Home Phone []:
    Other []:
Is the information correct? [Y/n]
info: Adding new user `usuario3' to supplemental/extra groups `users' ...
info: Adding user `usuario3' to group `users' ...
```

### 2. Asignación de Contraseñas

**Comando:**

```
sudo passwd usuario1
sudo passwd usuario2
sudo passwd usuario3
```

**Resultado:**

```
New password:
Retype new password:
passwd: password updated successfully
```

### 3. Información de Usuarios

**Comando:**

```
id usuario1
```

**Resultado:**

```
uid=1001(usuario1) gid=1001(usuario1) groups=1001(usuario1),100(users)
```

### 4. Eliminación de Usuarios

**Comando:**

```
sudo deluser usuario3
```

**Resultado:**

```
info: Removing crontab ...
info: Removing user 'usuario3' ...
```

## Parte 2: Gestión de Usuarios

### 1. Gestión de Grupos

**Comando:**

```
sudo addgroup grupo1
sudo addgroup grupo2
```

**Resultado:**

```
info: Selecting GID from range 1000 to 59999 ...
info: Adding group 'grupo1' (GID 1003) ...
```

```
info: Selecting GID from range 1000 to 59999 ...
info: Adding group 'grupo2' (GID 1004) ...
```

### 2. Agregar Usuarios a Grupos

**Comando:**

```
sudo usermod -aG grupo1 usuario1
sudo usermod -aG grupo2 usuario2
```

**Resultado:**

```
N/A
```

### 3. Verificar Membresía

**Comando:**

```
groups usuario1
groups usuario2
```

**Resultado:**

```
usuario1 : usuario1 users grupo1
usuario2 : usuario2 users grupo2
```

### 4. Eliminar Grupo

**Comando:**

```
sudo delgroup grupo2
```

**Resultado:**

```
info: Removing group 'grupo2' ...
```

## Parte 3: Gestión de Permisos

### 1. Creación de Archivos y Directorios

**Comando:**

```
su -l usuario1
echo "202010023" > ~/archivo1.txt
mkdir ~/directorio1
echo "Luis Lizama" > ~/directorio1/archivo2.txt
```

**Resultado:**

```
N/A
```

### 2. Verificar Permisos

**Comando:**

```
ls -l ~/archivo1.txt
ls -ld ~/directorio1
```

**Resultado:**

```
-rw-rw-r-- 1 usuario1 usuario1 10 Aug  4 23:59 /home/usuario1/archivo1.txt
drwxrwxr-x 2 usuario1 usuario1 4096 Aug  4 23:59 /home/usuario1/directorio1/
```

### 3. Modificar Permisos-Modo Numérico

**Comando:**

```
chmod 640 ~/archivo1.txt
```

**Resultado:**

```
N/A
```

### 4. Modificar Permisos-Modo Simbólico

**Comando:**

```
chmod u+x ~/directorio1/archivo2.txt
```

**Resultado:**

```
N/A
```

### 5. Cambiar el Grupo Propietario

**Comando:**

```
sudo chgrp grupo1 ~/directorio1/archivo2.txt
```

**Resultado:**

```
N/A
```

### 6. Configurar Permisos de Directorio

**Comando:**

```
chmod 740 ~/directorio1
```

**Resultado:**

```
N/A
```

### 7. Comprobación de Acceso

**Comando:**

```
su -l usuario2
cat /home/usuario1/archivo1.txt
cat /home/usuario1/directorio1/archivo2.txt
```

**Resultado:**

```
cat: /home/usuario1/archivo1.txt: Permission denied
cat: /home/usuario1/directorio1/archivo2.txt: Permission denied
```

### 8. Verificación Final

**Comando:**

```
c@b:~$ su -l usuario1
ls -l ~/archivo1.txt
ls -ld ~/directorio1/
ls -l ~/directorio1/archivo2.txt
```

**Resultado:**

```
-rw-rw-r-- 1 usuario1 usuario1 10 Aug  4 23:59 /home/usuario1/archivo1.txt
drwxrwxr-x 2 usuario1 usuario1 4096 Aug  4 23:59 /home/usuario1/directorio1/
-rw-rw-r-- 1 usuario1 grupo1 12 Aug  4 23:59 /home/usuario1/directorio1/archivo2.txt
```

### Reflexión

**¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?**

Para proteger los datos y asegurar que sólo usuarios autorizados tengan acceso.


**¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?**

Solo conozco `chmod`, `chown`, y `chgrp`.
