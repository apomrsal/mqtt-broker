# 1. استخدام صورة Mosquitto
FROM eclipse-mosquitto:latest

# 2. تثبيت مكتبة WebSockets (هذه أهم خطوة لجعل المتصفح يعمل!)
RUN apt-get update && apt-get install -y libwebsockets-dev && rm -rf /var/lib/apt/lists/*

# 3. إنشاء ملف الإعدادات (mosquitto.conf) داخل الحاوية
# هذا الملف يخبر Mosquitto باستقبال TCP و WebSockets على المنفذ 10000
RUN echo "listener 10000 0.0.0.0" > /mosquitto/config/mosquitto.conf && \
    echo "protocol websockets" >> /mosquitto/config/mosquitto.conf && \
    echo "allow_anonymous true" >> /mosquitto/config/mosquitto.conf && \
    echo "listener 1883 0.0.0.0" >> /mosquitto/config/mosquitto.conf

# 4. إخبار Render بأن الخدمة مفتوحة على المنفذ 10000
EXPOSE 10000

# 5. تشغيل Mosquitto وقراءة ملف الإعدادات الذي أنشأناه
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
