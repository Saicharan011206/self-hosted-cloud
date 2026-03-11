## PHP OPcache Optimization

Nextcloud reported that the OPcache interned strings buffer was nearly full.

OPcache is a PHP performance module that caches compiled PHP scripts in memory, reducing execution time and improving response performance.

### Configuration

File: */etc/php/8.4/apache2/php.ini*

Updated Configuration:

opcache.enable=1
opcache.memory_consumption=128
opcache.interned_strings_buffer=16
opcache.max_accelerated_files=10000
opcache.revalidate_freq=60
opcache.enable_cli=1

After modifying the application, restart the apache server.

