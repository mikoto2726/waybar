
#!/bin/bash

BINANCE_WS="wss://stream.binance.com:9443/ws/btcusdt@trade"

websocat -n1 "$BINANCE_WS" | while read -r line; do
    price=$(echo "$line" | jq -r '.p | tonumber | floor')
    echo "{\"text\":\" \$${price} \", \"tooltip\":\"BTC Perp Price\"}"
done

