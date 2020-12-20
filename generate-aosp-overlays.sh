#!/bin/bash
cd CarrierSettings
for i in $(grep -lrE "omadm|sprintdm|sprinthm"); do
        rm "$i"
done
cd ..
./carriersettings_extractor.py CarrierSettings
a=(
        "ci_action_on_sys_update"
        "config_ims_package_override_string"
        "com.google.android"
)
for i in ${a[@]}; do
        sed -i "/$i/d" ./vendor.xml
done
