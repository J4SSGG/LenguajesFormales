<?php
#
# standalone PHP program 
# (edit top line to point to local PHP executable)
#
# Submits GET request to search HST archive for given RA, Dec, and radius,
# limit results to 10 records, 
# returns data set name, RA, Dec, and Target name
# as a comma-separated list
# prints out column headings and data
#

# create GET request

$request = "http://archive.stsci.edu/hst/search.php?";      //quotes url
$request .= "RA=53.084&DEC=-27.873&radius=1.0&max_records=10&";
$request .= "outputformat=CSV&action=Search"; 
$request .= "&selectedColumnsCsv=sci_data_set_name,sci_ra,sci_dec,sci_targname";

print "\nrequest = $request \n\n";

# download results from MAST as an array called $data
# (ignore errors)

$data = @file($request);

# print column headings (skip data types in next row)

print "$data[0]\n\n";

# now print search results

$cnt = count($data);
for ($i=2; $i<$cnt; $i++) print "$data[$i]\n";

?>

<?php
#
# standalone PHP program 
# (edit top line to point to local PHP executable)
#
# Submits GET request to search FUSE archive 
# request multiple RA & Dec values
# (results for each input position will be separated by a blank line)
# limit each set of results to 10 records, 
# return columns for data set name, Target name, RA, & Dec
# output as a comma-separated list with coordinates in decimal degrees
#

# create GET request

$request = "http://archive.stsci.edu/fuse/search.php?";      //quotes url
$request .= "ra=1.514,18.729,42.783&dec=63.679,-72.361,60.418&radius=1.0&max_records=10&";
$request .= "outputformat=SSV&action=Search&coordformat=dec"; 
$request .= "&selectedColumnsCsv=fes_data_set_name,fes_targname,fes_ra_targ,fes_dec_targ";


# download results from MAST as an array called $data
# (ignore errors)

$data = @file($request);

# print column headings (skip data types in next row)

print "$data[0]\n";

# now print search results

$cnt = count($data);
for ($i=2; $i<$cnt; $i++) print "$data[$i]";
?>

<?php
#
# standalone PHP program 
# (edit top line to point to local PHP executable)
#
# request ACS science observations (images and spectra) of NGC 1068
# (within 3 arcminutes),  return all default columns
# output as a comma-separated list with coordinates in decimal degrees
#

# create GET request

$request = "http://archive.stsci.edu/hst/search.php?";      //quotes url
$request .= "target=ngc1068&radius=3.0&image[]=ACS&spectrum[]=ACS&";
$request .= "outputformat=CSV&action=Search&coordformat=dec&"; 
$request .= "sci_aec[]=S";

# print "\nrequest = $request \n\n";

# download results from MAST as an array called $data
# (ignore errors)

$data = @file($request);

# print column headings (skip data types in next row)

print "$data[0]\n";

# now print search results

$cnt = count($data);
for ($i=2; $i<$cnt; $i++) print "$data[$i]";

?>
    <?php
    #
    # standalone PHP program 
    # (edit top line to point to local PHP executable)
    #
    # request ACS science observations (images and spectra) of NGC 1068
    # (within 3 arcminutes),  return all default columns
    # output as a comma-separated list with coordinates in decimal degrees
    #

    # create GET request

    $request = "http://archive.stsci.edu/hst/search.php?";      //quotes url
    $request .= "sci_pep_id=9788&sci_aec[]=S&";
    $request .= "outputformat=CSV&action=Search&coordformat=dec&"; 
    $request .= "selectedColumnsCsv=sci_pep_id,sci_data_set_name,sci_ra,sci_dec,sci_targname";

    # print "\nrequest = $request \n\n";

    # download results from MAST as an array called $data
    # (ignore errors)

    $data = @file($request);

    # print column headings (skip data types in next row)

    print "$data[0]\n";

    # now print search results

    $cnt = count($data);
    for ($i=2; $i<$cnt; $i++) print "$data[$i]";

    ?>

<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     'database_name_here' );
define( 'DB_USER',     'username_here' );
define( 'DB_PASSWORD', 'password_here' );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET',  'utf8mb4' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');