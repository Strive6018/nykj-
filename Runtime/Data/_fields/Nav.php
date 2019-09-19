<?php
return array (
  0 => 'nav_id',
  1 => 'nav_pid',
  2 => 'nav_oid',
  3 => 'nav_title',
  4 => 'nav_tips',
  5 => 'nav_link',
  6 => 'nav_status',
  7 => 'nav_target',
  '_autoinc' => true,
  '_pk' => 'nav_id',
  '_type' => 
  array (
    'nav_id' => 'tinyint(3) unsigned',
    'nav_pid' => 'tinyint(3) unsigned',
    'nav_oid' => 'tinyint(3)',
    'nav_title' => 'varchar(50)',
    'nav_tips' => 'varchar(50)',
    'nav_link' => 'varchar(255)',
    'nav_status' => 'tinyint(1)',
    'nav_target' => 'tinyint(1)',
  ),
);
?>