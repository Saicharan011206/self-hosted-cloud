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

## Redis Configuration for Transactional File Locking

Nextcloud recommended using an in-memory cache instead of database for transactional file locking to improve performance.

Redis is suggested an option for the cache backend.

### Installation

*sudo apt install redis-server php-redis*

### Service Verification

*redis-cli ping* (expect 'PONG' as output)

### Nextcloud Configuration

File: */var/www/nextcloud/config/config.php*

Added Configuration:

'filelocking.enabled' => true,
'memcache.locking' => '\\OC\\Memcache\\Redis',
'redis' => [
    'host' => 'localhost',
    'port' => 6379
]

This configuration moves file locking operation from the database to Redis, reducing database load and improving file operation performance.