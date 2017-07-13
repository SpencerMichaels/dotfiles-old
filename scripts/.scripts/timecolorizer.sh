#!/bin/bash
# Takes a timezone as the first argument and prints a colorized time based on
# how appropriate it is to contact a person in that timezone

set -e

time_within()
{
    start=$1
    mid=$2
    end=$3
    if [ $start -le $mid ] && [ $mid -lt $end ]; then
        echo true
    else
        echo false
    fi
}

timezone=$1
tz_time=`TZ=$timezone date +'%k%M'`
tz_time_str=`TZ=$timezone date +'%a %-l:%M %p'`

tz_day=`TZ=$timezone date +'(%b %d)'`
my_day=`date +'(%b %d)'`
if [ "$tz_day" != "$my_day" ]; then
    tz_time_str="$tz_time_str $tz_day"
fi

is_work_hours=$(time_within 0900 $tz_time 1700)
is_stretch_hours_morn=$(time_within 0700 $tz_time 0900)
is_stretch_hours_night=$(time_within 1700 $tz_time 2300)

if $is_work_hours; then
    tput setaf 2
elif $is_stretch_hours_morn || $is_stretch_hours_night; then
    tput setaf 3
else
    tput setaf 1
fi

echo $tz_time_str
tput setaf 7
