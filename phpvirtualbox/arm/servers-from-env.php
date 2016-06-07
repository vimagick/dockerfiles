<?php

$servers = array();
$config_overrides = array();

// getting config overrides for all servers
foreach ($_SERVER as $key => $value) {
    preg_match('/(.*?)(?:_ENV_|_)?CONF_(.+)/', $key, $matches);
    if ($matches) {
        $value= (strpos($value, ',')) ? split(',',$value) : $value;
        $config_overrides[$matches[1]] = array($matches[2] => $value);
    }
}

echo 'Exposing the following linked server instances:' . PHP_EOL;

// getting servers from linked vboxwebsrv containers or environment variables
foreach ($_SERVER as $key => $value) {
    if (substr($key, -15) === '_PORT_18083_TCP') {
        $prefix = substr($key, 0, -15);

        $name = getenv($prefix . '_NAME');
        $pos = strrpos($name, '/');
        if ($pos !== false) {
            $name = substr($name, $pos + 1);
        }

        if (!$name) {
            $name = strtolower($prefix);
        }
        $name = ucfirst($name);

        $location = 'http://' . str_replace('tcp://', '', $value) . '/';

        echo '- ' . $name . ' (' . $location .')' . PHP_EOL;

        $username = getenv($prefix.'_USER');
        $password = getenv($prefix.'_PW');

        if ($username == "") $username = 'username';
        if ($password == "") $password = 'username';

        $servers []= array_merge(array(
            'name' => $name,
            'username' => $username,
            'password' => $password,
            'authMaster' => true,
            'location' => $location),
            (array_key_exists($prefix, $config_overrides)) ? $config_overrides[$prefix] : array());
    }
}
// check if there are any servers
if (!$servers) {
    echo 'Error: No vboxwebsrv instance linked? Use "--link containername:myname"' . PHP_EOL;
    echo 'Use environment variables if no vboxwebsrv containers are used!';
    exit(1);
}

// put servers array to file
file_put_contents('/var/www/config-servers.php', '<?php return ' . var_export($servers, true) . ';');

if (array_key_exists("", $config_overrides)) {
    // getting global config overrides
    file_put_contents('/var/www/config-override.php','<?php return ' . var_export($config_overrides[""], true) . ';' );
}
