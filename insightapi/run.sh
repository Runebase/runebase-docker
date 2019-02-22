mkdir -p /data/.runebase/

envsubst < /etc/runebase.conf.template > /data/.runebase/runebase.conf

asyncRun() {
    "$@" &
    sleep 2
    pid="`ps aux | grep [b]itcore | awk '{print $2}'`"
    echo "bitcore pid: $pid"
    trap "kill -2 $pid" SIGINT SIGTERM

    # A signal emitted while waiting will make the wait command return code > 128
    # Let's wrap it in a loop that doesn't end before the process is indeed stopped
    while kill -0 $pid > /dev/null 2>&1; do
        wait
    done
}
asyncRun "$@"