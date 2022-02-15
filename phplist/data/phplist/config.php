<?php

/* https://github.com/phpList/phplist3/blob/master/public_html/lists/config/config.php */

$database_host = getenv('DB_HOST');
$database_name = getenv('DB_NAME');
$database_user = getenv('DB_USERNAME');
$database_password = getenv('DB_PASSWORD');

define('PHPMAILERHOST', getenv('SMTP_HOST') ?: 'localhost');
define('PHPMAILERPORT', intval(getenv('SMTP_PORT') ?: '25'));
define('PHPMAILER_SECURE', strtolower(getenv('SMTP_SECURE') ?: 'false') === 'true');

define('TEST', 0);
define('HASH_ALGO', 'sha256');
define('UPLOADIMAGES_DIR','images');
define('MANUALLY_PROCESS_BOUNCES',1);
define('MANUALLY_PROCESS_QUEUE',0);
define('PHPMAILER_SECURE',0);
define('CHECK_REFERRER',false);
