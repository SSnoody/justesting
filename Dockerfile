FROM wordpress:latest

# Marca de build para verificar actualizaciones
RUN echo "build-timestamp-$(date -u +'%Y%m%dT%H%M%SZ')" > /build-info.txt

# Instalaciones adicionales opcionales (ej: plugins en el futuro)
# COPY ./wp-content/plugins /var/www/html/wp-content/plugins

EXPOSE 80

CMD ["apache2-foreground"]
