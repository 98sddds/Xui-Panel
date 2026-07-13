FROM alpine:3.19

RUN apk add --no-cache curl bash ca-certificates libc6-compat

WORKDIR /app

# دانلود و نصب پنل
RUN curl -L https://github.com/mhsanaei/3x-ui/releases/download/v3.4.2/x-ui-linux-amd64.tar.gz -o x-ui.tar.gz \
    && tar -xzf x-ui.tar.gz --strip-components=1 \
    && rm x-ui.tar.gz \
    && chmod +x x-ui

# ایجاد مستقیم اسکریپت اجرا داخل داکر‌فایل
RUN echo '#!/bin/bash' > /app/run.sh && \
    echo './x-ui setting -port 2053 -webBasePath /managepanel/ || true' >> /app/run.sh && \
    echo './x-ui &' >> /app/run.sh && \
    echo 'while true; do sleep 10; done' >> /app/run.sh && \
    chmod +x /app/run.sh

EXPOSE 3000
CMD ["/app/run.sh"]
