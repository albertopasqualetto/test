#!/bin/bash
set -x  # Opzione di debug

if [ "$1" == "start" ]; then
    if pgrep -f "python3 /workspaces/test/app/app.py" > /dev/null; then
        echo "Il server Flask è già in esecuzione."
    else
        echo "Avvio del server Flask..."
        nohup python3 /workspaces/test/app/app.py > /workspaces/test/app/flask_server.log 2>&1 &
        echo "Server Flask avviato con successo."
    fi
elif [ "$1" == "stop" ]; then
    if pgrep -f "python3 /workspaces/test/app/app.py" > /dev/null; then
        pkill -f "python3 /workspaces/test/app/app.py"
        echo "Server Flask terminato."
    else
        echo "Il server Flask non è in esecuzione."
    fi
else
    echo "Uso: $0 {start|stop}"
fi
