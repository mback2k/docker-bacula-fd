#!/bin/bash -e

if [ -f "${BACULA_CLIENT_PASS_FILE}" ]; then
    BACULA_CLIENT_PASS="$(< "${BACULA_CLIENT_PASS_FILE}")"
fi

echo "
Password = \"${BACULA_CLIENT_PASS}\"
" > /etc/bacula/bacula-fd-password

chmod 600 /etc/bacula/bacula-fd-password

exit 0
