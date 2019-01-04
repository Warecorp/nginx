# Nginx Docker Container Images

* [Environment variables](#environment-variables)
* [Nginx modules](#nginx-modules)
    * [PageSpeed]
    * [ModSecurity]
* [Customization](#customization)

## Environment Variables

| Variable                                             | Default Value               | Description                         |
| -----------------------------------------            | --------------------------- | -----------                         |
| `NGINX_ALLOW_ACCESS_HIDDEN_FILES`                    |                             |                                     |
| `NGINX_BACKEND_FAIL_TIMEOUT`                         | `0`                         |                                     |
| `NGINX_BACKEND_HOST`                                 | Varies with a preset        |                                     |
| `NGINX_BACKEND_PORT`                                 | Varies with a preset        |                                     |
| `NGINX_CLIENT_BODY_BUFFER_SIZE`                      | `16k`                       |                                     |
| `NGINX_CLIENT_BODY_TIMEOUT`                          | `60s`                       |                                     |
| `NGINX_CLIENT_HEADER_BUFFER_SIZE`                    | `4k`                        |                                     |
| `NGINX_CLIENT_HEADER_TIMEOUT`                        | `60s`                       |                                     |
| `NGINX_CLIENT_MAX_BODY_SIZE`                         | `32m`                       |                                     |
| `NGINX_CONF_INCLUDE`                                 | `conf.d/*.conf`             |                                     |
| `NGINX_DISABLE_CACHING`                              |                             |                                     |
| `NGINX_DJANGO_MEDIA_ROOT`                            | `/var/www/html/media/`      |                                     |
| `NGINX_DJANGO_MEDIA_URL`                             | `/media/`                   |                                     |
| `NGINX_DJANGO_STATIC_ROOT`                           | `/var/www/html/static/`     |                                     |
| `NGINX_DJANGO_STATIC_URL`                            | `/static/`                  |                                     |
| `NGINX_DRUPAL_ALLOW_XML_ENDPOINTS`                   |                             |                                     |
| `NGINX_DRUPAL_FILE_PROXY_URL`                        |                             | e.g. `http://dev.example.com`       |
| `NGINX_DRUPAL_HIDE_HEADERS`                          |                             |                                     |
| `NGINX_DRUPAL_XMLRPC_SERVER_NAME`                    |                             | Drupal 6/7 only                     |
| `NGINX_ERROR_403_URI`                                |                             |                                     |
| `NGINX_ERROR_404_URI`                                |                             |                                     |
| `NGINX_ERROR_LOG_LEVEL`                              | `error`                     |                                     |
| `NGINX_ERROR_MESSAGE_50x`                            |                             |                                     |
| `NGINX_FASTCGI_BUFFER_SIZE`                          | `32k`                       | For PHP-based presets only          |
| `NGINX_FASTCGI_BUFFERS`                              | `16 32k`                    | For PHP-based presets only          |
| `NGINX_FASTCGI_INDEX`                                | `index.php`                 | For PHP-based presets only          |
| `NGINX_FASTCGI_INTERCEPT_ERRORS`                     | `on`                        | For PHP-based presets only          |
| `NGINX_FASTCGI_READ_TIMEOUT`                         | `900`                       | For PHP-based presets only          |
| `NGINX_GZIP_BUFFERS`                                 | `16 8k`                     |                                     |
| `NGINX_GZIP_COMP_LEVEL`                              | `1`                         |                                     |
| `NGINX_GZIP_DISABLE`                                 | `msie6`                     |                                     |
| `NGINX_GZIP_HTTP_VERSION`                            | `1.1`                       |                                     |
| `NGINX_GZIP_MIN_LENGTH`                              | `20`                        |                                     |
| `NGINX_GZIP_PROXIED`                                 | `any`                       |                                     |
| `NGINX_GZIP_VARY`                                    | `on`                        |                                     |
| `NGINX_GZIP`                                         | `on`                        |                                     |
| `NGINX_HIDE_50x_ERRORS`                              |                             |                                     |
| `NGINX_HTTP2`                                        |                             |                                     |
| `NGINX_INDEX_FILE`                                   | Varies with a preset        | Hard-coded for Drupal and WP        |
| `NGINX_KEEPALIVE_REQUESTS`                           | `100`                       |                                     |
| `NGINX_KEEPALIVE_TIMEOUT`                            | `75s`                       |                                     |
| `NGINX_LARGE_CLIENT_HEADER_BUFFERS`                  | `8 16k`                     |                                     |
| `NGINX_LOG_FORMAT_OVERRIDE`                          |                             |                                     |
| `NGINX_MODSECURITY_ENABLED`                          |                             | See [ModSecurity]                   |
| `NGINX_MODSECURITY_INBOUND_ANOMALY_SCORE_THRESHOLD`  | `7`                         |                                     |
| `NGINX_MODSECURITY_OUTBOUND_ANOMALY_SCORE_THRESHOLD` | `7`                         |                                     |
| `NGINX_MODSECURITY_POST_CORE_RULES`                  |                             | Location to rules loaded after CRS  |
| `NGINX_MODSECURITY_PRE_CORE_RULES`                   |                             | Location to rules loaded before CRS |
| `NGINX_MODSECURITY_USE_OWASP_CRS`                    |                             | See [ModSecurity]                   |
| `NGINX_MULTI_ACCEPT`                                 | `on`                        |                                     |
| `NGINX_NO_DEFAULT_HEADERS`                           |                             |                                     |
| `NGINX_PAGESPEED_ENABLE_FILTERS`                     |                             |                                     |
| `NGINX_PAGESPEED_ENABLED`                            |                             | See [PageSpeed]                     |
| `NGINX_PAGESPEED_FILE_CACHE_PATH`                    | `/var/cache/ngx_pagespeed/` |                                     |
| `NGINX_PAGESPEED_PRESERVE_URL_RELATIVITY`            | `on`                        |                                     |
| `NGINX_PAGESPEED_REWRITE_LEVEL`                      | `CoreFilters`               |                                     |
| `NGINX_PAGESPEED_STATIC_ASSET_PREFIX`                | `/pagespeed_static`         |                                     |
| `NGINX_PAGESPEED`                                    | `on`                        | See [PageSpeed]                     |
| `NGINX_REAL_IP_HEADER`                               | `X-Real-IP`                 |                                     |
| `NGINX_REAL_IP_RECURSIVE`                            | `off`                       |                                     |
| `NGINX_RESET_TIMEDOUT_CONNECTION`                    | `off`                       |                                     |
| `NGINX_SEND_TIMEOUT`                                 | `60s`                       |                                     |
| `NGINX_SENDFILE`                                     | `on`                        |                                     |
| `NGINX_SERVER_EXTRA_CONF_FILEPATH`                   |                             |                                     |
| `NGINX_SERVER_NAME`                                  | `default`                   |                                     |
| `NGINX_SERVER_ROOT`                                  | `/var/www/html`             |                                     |
| `NGINX_SERVER_TOKENS`                                | `off`                       |                                     |
| `NGINX_SET_REAL_IP_FROM`                             |                             |                                     |
| `NGINX_STATIC_404_TRY_INDEX`                         |                             |                                     |
| `NGINX_STATIC_ACCESS_LOG`                            | `off`                       |                                     |
| `NGINX_STATIC_EXPIRES`                               | `7d`                        |                                     |
| `NGINX_STATIC_MP4_BUFFER_SIZE`                       | `1M`                        |                                     |
| `NGINX_STATIC_MP4_MAX_BUFFER_SIZE`                   | `5M`                        |                                     |
| `NGINX_STATIC_OPEN_FILE_CACHE_ERRORS`                | `on`                        |                                     |
| `NGINX_STATIC_OPEN_FILE_CACHE_MIN_USES`              | `2`                         |                                     |
| `NGINX_STATIC_OPEN_FILE_CACHE_VALID`                 | `30s`                       |                                     |
| `NGINX_STATIC_OPEN_FILE_CACHE`                       | `max=1000 inactive=30s`     |                                     |
| `NGINX_TCP_NODELAY`                                  | `on`                        |                                     |
| `NGINX_TCP_NOPUSH`                                   | `on`                        |                                     |
| `NGINX_TRACK_UPLOADS`                                | `uploads 60s`               |                                     |
| `NGINX_UNDERSCORES_IN_HEADERS`                       | `off`                       |                                     |
| `NGINX_UPLOAD_PROGRESS`                              | `uploads 1m`                |                                     |
| `NGINX_USER`                                         | `nginx`                     |                                     |
| `NGINX_VHOST_NO_DEFAULTS`                            |                             |                                     |
| `NGINX_VHOST_PRESET`                                 | `html`                      |                                     |
| `NGINX_WORKER_CONNECTIONS`                           | `1024`                      |                                     |
| `NGINX_WORKER_PROCESSES`                             | `auto`                      |                                     |

Static files extension defined via the regex and can be overridden via the env var `NGINX_STATIC_EXT_REGEX`, default:
```
css|cur|js|jpe?g|gif|htc|ico|png|xml|otf|ttf|eot|woff|woff2|svg|mp4|svgz|ogg|ogv|pdf|pptx?|zip|tgz|gz|rar|bz2|doc|xls|exe|tar|mid|midi|wav|bmp|rtf|txt
```

Some environment variables can be overridden or added per [preset](#virtual-hosts-presets). 

## Nginx modules

| Name                  | Version           |
| --------------------- | ----------------  |
| [http_addition]       |                   |
| [http_auth_request]   |                   |
| [http_dav]            |                   |
| [http_flv]            |                   |
| [http_geoip]          |                   |
| [http_gunzip]         |                   |
| [http_gzip_static]    |                   |
| [http_image_filter]   |                   |
| [http_mp4]            |                   |
| [http_random_index]   |                   |
| [http_realip]         |                   |
| [http_secure_link]    |                   |
| [http_slice]          |                   |
| [http_ssl]            |                   |
| [http_stub_status]    |                   |
| [http_sub]            |                   |
| [http_v2]             |                   |
| [http_xslt]           |                   |
| [mail_ssl]            |                   |
| modsecurity           | See [ModSecurity] |
| pagespeed             | See [PageSpeed]   |
| [uploadprogress]      | 0.9.1             |
| [stream_geoip]        |                   |
| [stream_realip]       |                   |
| [stream_ssl]          |                   |
| [stream_ssl_preread]  |                   |

### Pagespeed

| Component                | Version   |
| ------------------------ | -------   |
| [PageSpeed Nginx module] | 1.13.35.2 |
| [PageSpeed Library]      | 1.13.35.2 |

To enable [Apache PageSpeed module](https://www.modpagespeed.com/) set `$NGINX_PAGESPEED_ENABLED` to any value. Additionally, you can change module status via `$NGINX_PAGESPEED` (set to `on` by default) and configure it via `$NGINX_PAGESPEED_` environment variables.

### ModSecurity

| Component                  | Version |
| -------------------------- | ------- |
| [ModSecurity Nginx module] | 1.0.0   |
| [ModSecurity Library]      | 3.0.3   |
| [OWASP CRS]                | 3.1.0   |

ModSecurity is disabled by default, to enable set `$NGINX_MODSECURITY_ENABLED` to any value. Additionally, you can enable [OWASP Core Rule Set (CRS)](https://modsecurity.org/crs/) by setting `$NGINX_MODSECURITY_USE_OWASP_CRS` to any value, ️be wary since it may [block some requests](https://github.com/wodby/nginx/pull/14#issuecomment-447404035) with the default configuration. See env vars starting with `$NGINX_MODSECURITY_` for advanced configuration.  

## Customization

* Disable default recommended headers via `$NGINX_NO_DEFAULT_HEADERS` (defined in `nginx.conf`)
* Disable default rules included in virtual host via `$NGINX_VHOST_NO_DEFAULTS` 
* Add extra locations via `$NGINX_SERVER_EXTRA_CONF_FILEPATH=/filepath/to/nginx-locations.conf`, the file will be included at the end of virtual host config (`server` context)
* Define [custom preset](#custom-preset)
* Completely override include of the virtual host config by overriding `NGINX_CONF_INCLUDE`, it will be included in `nginx.conf`

