#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set parameter.keyoverlaidmodifier_timeout 300
/bin/echo -n .
$cli set private.capslock 1
/bin/echo -n .
$cli set private.left_control_to_cosc 1
/bin/echo -n .
$cli set private.mpd_control 1
/bin/echo -n .
$cli set private.multilanguage_input 1
/bin/echo -n .
$cli set private.shifts_to_parens 1
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set remap.programmer.shifts_parens 1
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set repeat.wait 23
/bin/echo -n .
/bin/echo
