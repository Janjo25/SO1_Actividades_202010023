# Servicio de Saludo

Este servicio ejecuta un script que imprime un saludo y la fecha actual de forma infinita, con una pausa de un segundo
entre cada iteración.

## Instalación

1. Guardar el script `script.sh` en la ubicación deseada.

2. Hacer que el script sea ejecutable.

3. Copiar el archivo `script.service` a `/etc/systemd/system/`.

4. Recargar el demonio de systemd:

   ```bash
   sudo systemctl daemon-reload
   ```

5. Habilitar el servicio para que se inicie automáticamente al arrancar el sistema:

   ```bash
   sudo systemctl enable script.service
   ```

6. Iniciar el servicio:

   ```bash
   sudo systemctl start script.service
   ```

## Verificación

- Verificar el estado del servicio:

  ```bash
  sudo systemctl status script.service
  ```

- Ver los registros del servicio:

  ```bash
  journalctl -u script.service
  ```
