# changes all the phpp extensions in wp_setting file with php
$file_path = ' /var/www/html/wp-settings.php'

file_line { 'replace':
  path    => $file_path,
  match   => '\.phpp',
  line    => '.php',
  replace => true,
}