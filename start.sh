#!/bin/bash
set -e

# ۱. اجرای Tunnel (توکن را در Railway به عنوان متغیر TUNNEL_TOKEN ست کنید)
if [ -n "$TUNNEL_TOKEN" ]; then
    echo "🔗 Starting Cloudflare Tunnel..."
    cloudflared tunnel --no-autoupdate run --token "$TUNNEL_TOKEN" &
else
    echo "⚠️ TUNNEL_TOKEN not found. Running without tunnel."
fi

# ۲. اجرای پنل
cd /usr/local/x-ui
./x-ui setting -port 2053 -webBasePath /managepanel/ || true
./x-ui &

# ۳. مانیتورینگ
wait -n
