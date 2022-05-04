<?php
/*
Plugin Name: Content Types Plugin
Description: Minimalistic plugin for SCL content types proof of concept
Text Domain: scl-content-types-plugin
Domain Path: /languages
*/
function ctp_load_textdomain() {
  $plugin_rel_path = basename( dirname( __FILE__ ) ) . '/languages'; /* Relative to WP_PLUGIN_DIR */
  load_plugin_textdomain( 'scl-content-types-plugin', false, $plugin_rel_path );
}

function create_banners_post_type() {
  register_post_type( 'banners',
  // CPT Options
      array(
          'labels' => array(
              'name' => __( 'Banners', 'scl-content-types-plugin' ),
              'singular_name' => __( 'Banner', 'scl-content-types-plugin' )
          ),
          'public' => true,
          'has_archive' => true,
          'rewrite' => array('slug' => 'banners'),
          'show_in_rest' => true,
      )
  );
}

add_action( 'init', 'create_banners_post_type' );
add_action( 'plugins_loaded', 'ctp_load_textdomain' );

?>
