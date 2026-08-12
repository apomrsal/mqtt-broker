FROM eclipse-mosquitto:latest

# نسخ ملف الإعدادات المعدل من المشروع إلى داخل الحاوية
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

EXPOSE 10000

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
