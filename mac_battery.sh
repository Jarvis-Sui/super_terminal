
if [[ "$(uname)" == Darwin ]]; then
    smart_battery_status=$(ioreg -rc "AppleSmartBattery")

    if [ $(echo "$smart_battery_status" | grep -c '^.*"ExternalConnected"\ =\ Yes') -eq 1 ]; then
        echo "#[fg=colour230,bg=colour40] Charging"
    else
        maxcapacity=$(echo "$smart_battery_status" | grep '^.*"MaxCapacity"\ =\ ' | sed -e 's/^.*"MaxCapacity"\ =\ //')
        currentcapacity=$(echo "$smart_battery_status" | grep '^.*"CurrentCapacity"\ =\ ' | sed -e 's/^.*CurrentCapacity"\ =\ //')
        pct=`echo "scale=0; 100 * $currentcapacity / $maxcapacity" | bc`
        timeremaining_sec=$(echo "$smart_battery_status" | grep '^.*"AvgTimeToEmpty"\ =\ ' | sed -e 's/^.*"AvgTimeToEmpty"\ =\ //')
        if [ $timeremaining_sec -gt 720 ] ; then 
            timeremaining_h="∞"
        else 
            timeremaining_h="$((timeremaining_sec / 60)):$((timeremaining_sec % 60))"
        fi
        if [ $pct -gt 70 ]; then
            color=colour40
        elif [ $pct -gt 30 ]; then
            color=colour220
        else
            color=colour160
        fi
        echo "#[fg=colour230,bg=$color] $pct | $timeremaining_h"
    fi
fi
