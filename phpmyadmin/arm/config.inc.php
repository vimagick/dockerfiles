<?php

require('/etc/phpmyadmin/config.secret.inc.php');

/* Ensure we got the environment */
$vars = array(
    'PMA_ARBITRARY',
    'PMA_HOST',
    'PMA_HOSTS',
    'PMA_VERBOSE',
    'PMA_VERBOSES',
    'PMA_PORT',
    'PMA_PORTS',
    'PMA_SOCKET',
    'PMA_SOCKETS',
    'PMA_USER',
    'PMA_PASSWORD',
    'PMA_ABSOLUTE_URI',
    'PMA_CONTROLHOST',
    'PMA_CONTROLPORT',
    'PMA_PMADB',
    'PMA_CONTROLUSER',
    'PMA_CONTROLPASS',
    'PMA_QUERYHISTORYDB',
    'PMA_QUERYHISTORYMAX',
    'MAX_EXECUTION_TIME',
    'MEMORY_LIMIT'
);
foreach ($vars as $var) {
    $env = getenv($var);
    if (!isset($_ENV[$var]) && $env !== false) {
        $_ENV[$var] = $env;
    }
}
if (isset($_ENV['PMA_QUERYHISTORYDB'])) {
    $cfg['QueryHistoryDB'] = boolval($_ENV['PMA_QUERYHISTORYDB']);
}

if (isset($_ENV['PMA_QUERYHISTORYMAX'])) {
    $cfg['QueryHistoryMax'] = intval($_ENV['PMA_QUERYHISTORYMAX']);
}

/* Arbitrary server connection */
if (isset($_ENV['PMA_ARBITRARY']) && $_ENV['PMA_ARBITRARY'] === '1') {
    $cfg['AllowArbitraryServer'] = true;
}

/* Play nice behind reverse proxys */
if (isset($_ENV['PMA_ABSOLUTE_URI'])) {
    $cfg['PmaAbsoluteUri'] = trim($_ENV['PMA_ABSOLUTE_URI']);
}

/* Figure out hosts */

/* Fallback to default linked */
$hosts = array('db');

/* Set by environment */
if (!empty($_ENV['PMA_HOST'])) {
    $hosts = array($_ENV['PMA_HOST']);
    $verbose = array($_ENV['PMA_VERBOSE']);
    $ports = array($_ENV['PMA_PORT']);
} elseif (!empty($_ENV['PMA_HOSTS'])) {
    $hosts = array_map('trim', explode(',', $_ENV['PMA_HOSTS']));
    $verbose = array_map('trim', explode(',', $_ENV['PMA_VERBOSES']));
    $ports = array_map('trim', explode(',', $_ENV['PMA_PORTS']));
}
if (!empty($_ENV['PMA_SOCKET'])) {
    $sockets = array($_ENV['PMA_SOCKET']);
} elseif (!empty($_ENV['PMA_SOCKETS'])) {
    $sockets = explode(',', $_ENV['PMA_SOCKETS']);
}

/* Server settings */
for ($i = 1; isset($hosts[$i - 1]); $i++) {
    $cfg['Servers'][$i]['host'] = $hosts[$i - 1];
    if (isset($verbose[$i - 1])) {
        $cfg['Servers'][$i]['verbose'] = $verbose[$i - 1];
    }
    if (isset($ports[$i - 1])) {
        $cfg['Servers'][$i]['port'] = $ports[$i - 1];
    }
    if (isset($_ENV['PMA_USER'])) {
        $cfg['Servers'][$i]['auth_type'] = 'config';
        $cfg['Servers'][$i]['user'] = $_ENV['PMA_USER'];
        $cfg['Servers'][$i]['password'] = isset($_ENV['PMA_PASSWORD']) ? $_ENV['PMA_PASSWORD'] : '';
    } else {
        $cfg['Servers'][$i]['auth_type'] = 'cookie';
    }
    if (isset($_ENV['PMA_PMADB'])) {
      $cfg['Servers'][$i]['pmadb'] = $_ENV['PMA_PMADB'];
      $cfg['Servers'][$i]['relation'] = 'pma__relation';
      $cfg['Servers'][$i]['table_info'] = 'pma__table_info';
      $cfg['Servers'][$i]['table_coords'] = 'pma__table_coords';
      $cfg['Servers'][$i]['pdf_pages'] = 'pma__pdf_pages';
      $cfg['Servers'][$i]['column_info'] = 'pma__column_info';
      $cfg['Servers'][$i]['bookmarktable'] = 'pma__bookmark';
      $cfg['Servers'][$i]['history'] = 'pma__history';
      $cfg['Servers'][$i]['recent'] = 'pma__recent';
      $cfg['Servers'][$i]['favorite'] = 'pma__favorite';
      $cfg['Servers'][$i]['table_uiprefs'] = 'pma__table_uiprefs';
      $cfg['Servers'][$i]['tracking'] = 'pma__tracking';
      $cfg['Servers'][$i]['userconfig'] = 'pma__userconfig';
      $cfg['Servers'][$i]['users'] = 'pma__users';
      $cfg['Servers'][$i]['usergroups'] = 'pma__usergroups';
      $cfg['Servers'][$i]['navigationhiding'] = 'pma__navigationhiding';
      $cfg['Servers'][$i]['savedsearches'] = 'pma__savedsearches';
      $cfg['Servers'][$i]['central_columns'] = 'pma__central_columns';
      $cfg['Servers'][$i]['designer_settings'] = 'pma__designer_settings';
      $cfg['Servers'][$i]['export_templates'] = 'pma__export_templates';
    }
    if (isset($_ENV['PMA_CONTROLHOST'])) {
      $cfg['Servers'][$i]['controlhost'] = $_ENV['PMA_CONTROLHOST'];
    }
    if (isset($_ENV['PMA_CONTROLPORT'])) {
      $cfg['Servers'][$i]['controlport'] = $_ENV['PMA_CONTROLPORT'];
    }
    if (isset($_ENV['PMA_CONTROLUSER'])) {
      $cfg['Servers'][$i]['controluser'] = $_ENV['PMA_CONTROLUSER'];
    }
    if (isset($_ENV['PMA_CONTROLPASS'])) {
      $cfg['Servers'][$i]['controlpass'] = $_ENV['PMA_CONTROLPASS'];
    }
    $cfg['Servers'][$i]['compress'] = false;
    $cfg['Servers'][$i]['AllowNoPassword'] = true;
}
for ($i = 1; isset($sockets[$i - 1]); $i++) {
    $cfg['Servers'][$i]['socket'] = $sockets[$i - 1];
    $cfg['Servers'][$i]['host'] = 'localhost';
}
/*
 * Revert back to last configured server to make
 * it easier in config.user.inc.php
 */
$i--;

/* Uploads setup */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

if (isset($_ENV['MAX_EXECUTION_TIME'])) {
    $cfg['ExecTimeLimit'] = $_ENV['MAX_EXECUTION_TIME'];
}

if (isset($_ENV['MEMORY_LIMIT'])) {
    $cfg['MemoryLimit'] = $_ENV['MEMORY_LIMIT'];
}

/* Include User Defined Settings Hook */
if (file_exists('/etc/phpmyadmin/config.user.inc.php')) {
    include('/etc/phpmyadmin/config.user.inc.php');
}
