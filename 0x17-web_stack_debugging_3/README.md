0x17. Web stack debugging #3
DevOps
SysAdmin
Scripting
Debugging


I first used "ps aux | grep apache2" to view process ID of apache server
then i used strace on one terminal and curl on another 
    "sudo strace -f -p 173 -o output" , my process id was 173
    output was the log output file of strace
then i used grep to list out all the enoent errors
    "grep ENOENT output"

this was the errors i found

    173   stat("/var/www/html/index.html", 0x7ffdffd95040) = -1 ENOENT (No such file or directory)
    173   lstat("/var/www/html/index.html", 0x7ffdffd95040) = -1 ENOENT (No such file or directory)
    173   stat("/var/www/html/index.cgi", 0x7ffdffd95040) = -1 ENOENT (No such file or directory)
    173   lstat("/var/www/html/index.cgi", 0x7ffdffd95040) = -1 ENOENT (No such file or directory)
    173   stat("/var/www/html/index.pl", 0x7ffdffd95040) = -1 ENOENT (No such file or directory)
    173   lstat("/var/www/html/index.pl", 0x7ffdffd95040) = -1 ENOENT (No such file or directory)
    173   access("/var/www/html/.maintenance", F_OK) = -1 ENOENT (No such file or directory)
    173   access("/var/www/html/wp-content/languages", F_OK) = -1 ENOENT (No such file or directory)
    173   stat("/var/www/html/wp-includes/languages", 0x7ffdffd923b0) = -1 ENOENT (No such file or directory)
    173   access("/var/www/html/wp-content/db.php", F_OK) = -1 ENOENT (No such file or directory)
    173   access("/var/www/html/wp-content/object-cache.php", F_OK) = -1 ENOENT (No such file or directory)
    173   lstat("/var/www/html/wp-includes/class-wp-locale.phpp", 0x7ffdffd8e250) = -1 ENOENT (No such file or directory)
    173   lstat("/var/www/html/wp-includes/class-wp-locale.phpp", 0x7ffdffd8e120) = -1 ENOENT (No such file or directory)
    173   lstat("/var/www/html/wp-includes/class-wp-locale.phpp", 0x7ffdffd90350) = -1 ENOENT (No such file or directory)
    173   open("/var/www/html/wp-includes/class-wp-locale.phpp", O_RDONLY) = -1 ENOENT (No such file or directory)

the errors were 
    Missing wordPress core files
    Custom files or directories Not Found
    and Typo in filename


after digging around in the files ive figured out the problem was a typo on the settings file
    /var/www/html/wp-settings.php
    on line 137, "require_once( ABSPATH . WPINC . '/class-wp-locale.phpp' );"

notice the double p, same as in the errors
after i corrected it started working fine