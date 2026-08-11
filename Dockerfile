# استخدام الصورة الرسمية لـ Mosquitto
FROM eclipse-mosquitto:latest

# إنشاء مجلد الإعدادات في الصورة (لضمان وجوده)
RUN mkdir -p /mosquitto/config

# إنشاء ملف الإعدادات (mosquitto.conf) داخلياً وتعبئته بالإعدادات الصحيحة لـ Render
# الأمر المهم هنا هو listener 10000 0.0.0.0 لجعله يعمل على المنفذ الذي يطلبه Render
RUN echo "listener 10000 0.0.0.0" > /mosquitto/config/mosquitto.conf && \
    echo "allow_anonymous true" >> /mosquitto/config/mosquitto.conf && \
    echo "persistence false" >> /mosquitto/config/mosquitto.conf

# إخبار Render بأن الخدمة ستستخدم المنفذ 10000
EXPOSE 10000

# تشغيل Mosquitto مع تحديد ملف الإعدادات الذي أنشأناه للتو
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
