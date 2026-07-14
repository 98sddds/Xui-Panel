#!/bin/bash

# اجرای تور در پس‌زمینه
tor -f /etc/tor/torrc &

# اجرای پنل X-UI
./x-ui
