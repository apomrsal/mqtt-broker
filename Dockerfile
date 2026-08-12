# استخدام صورة تحتوي على Mosquitto و WebSockets بشكل جاهز
FROM eclipse-mosquitto:latest

# إنشاء مجلد الإعدادات (لضمان وجوده)
RUN mkdir -p /mosquitto/config

# إنشاء ملف الإعدادات (mosquitto.conf) لتشغيل WebSockets على المنفذ 10000
RUN echo "listener 10000 0.0.0.0" > /mosquitto/config/mosquitto.conf && \
    echo "protocol websockets" >> /mosquitto/config/mosquitto.conf && \
    echo "allow_anonymous true" >> /mosquitto/config/mosquitto.conf && \
    echo "listener 1883 0.0.0.0" >> /mosquitto/config/mosquitto.conf

# إعلان المنفذ للمنصة
EXPOSE 10000

# تشغيل Mosquitto باستخدام ملف الإعدادات
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
