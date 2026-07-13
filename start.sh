#!/bin/bash
set -e

# تنظیم پورت دریافتی از Railway (پیش‌فرض 3000)
export PORT=${PORT:-3000}

echo "🚀 Starting X-UI on port $PORT..."

cd /usr/local/x-ui

# تنظیمات پایه پنل
./x-ui setting -port 2053 -webBasePath /managepanel/ || true

# اجرای پنل در پس‌زمینه
./x-ui &

# مانیتور برای اطمینان از بالا ماندن پنل
while true; do
  if ! pgrep -x "x-ui" > /dev/null; then
    echo "❌ X-UI crashed! Restarting..."
    exit 1
  fi
  sleep 10
done
