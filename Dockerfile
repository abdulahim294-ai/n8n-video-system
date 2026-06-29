# 1. جلب نسخة n8n الرسمية المبنية على التوزيعة المستقرة
FROM n8nio/n8n:latest

# 2. التبديل للمستخدم الجذر لتثبيت Chromium ومكتبات بوبيتير
USER root

# 3. تثبيت المتصفح والاعتماديات التشغيلية داخل السيرفر المجاني
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

# 4. ضبط المتغيرات البيئية لـ Puppeteer لكي يرى المتصفح المثبت
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV NODE_FUNCTION_ALLOW_EXTERNAL=puppeteer

# 5. العودة للمستخدم الافتراضي لتشغيل n8n بأمان
USER node

