#!/bin/sh

cli=/Applications/Seil.app/Contents/Library/bin/seil

$cli set enable_control_l 1
/bin/echo -n .
$cli set keycode_control_l 80
/bin/echo -n .
