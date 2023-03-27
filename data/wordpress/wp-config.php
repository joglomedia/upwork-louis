<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wpdb' );

/** Database username */
define( 'DB_USER', 'dbuser' );

/** Database password */
define( 'DB_PASSWORD', 'passwd12345' );

/** Database hostname */
define( 'DB_HOST', 'db' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'YjnEf,73/o0+Wr@)euuy(7n [FRwe~]<qMWQZy6u^C szr?%&SUoE7E/DA$J:aBR');
define('SECURE_AUTH_KEY',  '-_Mef qH,|shbp$leie2PWa?`S-XyULz[gfoH0IN/z-U^Rr9tP@FWE,;IfezpQ-:');
define('LOGGED_IN_KEY',    'dUDsQyrV?v.D`M+0g0ImPchU@{v-EHDs#(>?1a!+3P_Hb]9C$-bLnZc_6y9rfnc9');
define('NONCE_KEY',        '-IMw33QR=R2=z$I--:>(c(-=lh)|mUbxt]B[BOJS{V2](]PW+hf[eE4>DluH,Y@c');
define('AUTH_SALT',        '2V$k1ePh6-.h.U8/F[;}F;g0q8gH[_ykoS21TMB9=H&|f2s%C/J%A;i|`<>|o|$Z');
define('SECURE_AUTH_SALT', '|3Y6r{31!wdlN8}uTjqf$^.bYoz}tZy&,)PB53-@Sy!2`mz>%^Bos7pm ,3G68Fa');
define('LOGGED_IN_SALT',   'Z9`kwL}+~@JQEY>/vn3Lm=T]283i)/uy,G$J*N%gJpbzhvn~^r_%GLt-p57;FDS}');
define('NONCE_SALT',       '|=@-[?KZ[Y3R>760@z*BH3`#jx]/Av?]62j@gS#Vo_]#*/P-;>~-7GGYBD-9i5Y@');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';