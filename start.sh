#!/bin/bash
set -e

# تنظیم پورت اصلی که Railway تعیین کرده
PORT=${PORT:-3000}

echo "🚀 Starting X-UI with Multi-Protocol support on port $PORT..."

cd /usr/local/x-ui

# تنظیم پورت اصلی پنل به صورت خودکار
./x-ui setting -port 2053 -webBasePath /managepanel/ || true

# اجرای X-UI
./x-ui &

echo "▶️ X-UI is running. Xray Core is ready for all protocols."

# نگه داشتن کانتینر
wait -n
