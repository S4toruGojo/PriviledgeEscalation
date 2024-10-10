#!/bin/bash

# Backup del file sudoers
sudo cp /etc/sudoers /etc/sudoers.bak

# Verifica se il parametro è già impostato
if ! grep -q '^Defaults timestamp_timeout=0' /etc/sudoers; then
  # Aggiungi il parametro al file sudoers
  echo 'Defaults timestamp_timeout=0' | sudo tee -a /etc/sudoers
fi

# Verifica se l'impostazione è stata applicata correttamente
if grep -q '^Defaults timestamp_timeout=0' /etc/sudoers; then
  echo "La configurazione è stata applicata con successo."
else
  echo "Si è verificato un errore durante l'applicazione della configurazione."
fi
