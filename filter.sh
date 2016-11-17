wget https://onionoo.torproject.org/details

cat results | while read -r line; do host=$(echo $line | awk -F "\"*,\"*" '{printf("%s:%s",$1,$2)}'); echo $(cat details | jq '.relays[]' | jq "select(.or_addresses[0] | startswith(\"$host\"))" | jq -r '.platform + "," + .fingerprint'),$(echo $line | awk -F "\"*,\"*" '{printf("%s:%s,%s,%s,%s\n",$1,$2,$4,$5,$6)}'),$( acks=$(echo $line | awk -F "\"*,\"*" '{print $6}'); if [ "$acks" -gt 90 ] && [ "$acks" -lt 220 ]; then; echo vulnerable; else echo notvulnerable; fi); done;
