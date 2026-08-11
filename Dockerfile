FROM eclipse-mosquitto:latest

# نسخ ملف الإعدادات
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# تشغيل الخادم
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
