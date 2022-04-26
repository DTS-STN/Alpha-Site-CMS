FROM wordpress:5.9.3-apache
WORKDIR /usr/src/wordpress
RUN set -eux; \
	find /etc/apache2 -name '*.conf' -type f -exec sed -ri -e "s!/var/www/html!$PWD!g" -e "s!Directory /var/www/!Directory $PWD!g" '{}' +; \
	cp -s wp-config-docker.php wp-config.php

# COPY custom-theme/ ./wp-content/themes/custom-theme/
# COPY custom-plugin/ ./wp-content/plugins/custom-plugin/

EXPOSE 80
