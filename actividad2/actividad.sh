GITHUB_USER=${GITHUB_USER}

if [ -z "${GITHUB_USER}" ]; then # Se usa '-z' para verificar si la variable está vacía.
  read -r -p "Ingrese su nombre de usuario de GitHub: " GITHUB_USER
fi

URL="https://api.github.com/users/${GITHUB_USER}"

response=$(curl -s "${URL}") # El comando 'curl' se usa para hacer solicitudes HTTP. La opción '-s' se usa para silenciar la salida.

USER_IDENTIFIER=$(echo "${response}" | grep '"id":' | sed 's/[^0-9]*//g')
USER_CREATION=$(echo "${response}" | grep '"created_at":' | sed 's/.*"created_at": "//;s/".*//')

MESSAGE="Hola ${GITHUB_USER}. Identificador de Usuario: ${USER_IDENTIFIER}. Fecha de Creación: ${USER_CREATION}"

echo "${MESSAGE}"

CURRENT_DATE=$(date +"%Y-%m-%d_%H-%M-%S") # Se obtiene la fecha actual en el formato 'YYYY-MM-DD_HH-MM-SS'.

mkdir -p /tmp/"${CURRENT_DATE}" # Se crea un directorio temporal con la fecha actual.

log_file="/tmp/${CURRENT_DATE}/saludos.log"

echo "${MESSAGE}" > "${log_file}"
