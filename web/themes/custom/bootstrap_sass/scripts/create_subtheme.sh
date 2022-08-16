#!/bin/bash
# Script to quickly create sub-theme.

echo '
+------------------------------------------------------------------------+
| With this script you could quickly create serg_ysu_theme sub-theme     |
| In order to use this:                                                  |
| - serg_ysu_theme theme (this folder) should be in the contrib folder   |
+------------------------------------------------------------------------+
'
echo 'The machine name of your custom theme? [e.g. mycustom_bootstrap_sass]'
read CUSTOM_BOOTSTRAP_SASS

echo 'Your theme name ? [e.g. My custom serg_ysu_theme]'
read CUSTOM_BOOTSTRAP_SASS_NAME

if [[ ! -e ../../custom ]]; then
    mkdir ../../custom
fi
cd ../../custom
cp -r ../contrib/serg_ysu_theme $CUSTOM_BOOTSTRAP_SASS
cd $CUSTOM_BOOTSTRAP_SASS
for file in *serg_ysu_theme.*; do mv $file ${file//serg_ysu_theme/$CUSTOM_BOOTSTRAP_SASS}; done
for file in config/*/*serg_ysu_theme.*; do mv $file ${file//serg_ysu_theme/$CUSTOM_BOOTSTRAP_SASS}; done

# Remove create_subtheme.sh file, we do not need it in customized subtheme.
rm scripts/create_subtheme.sh

# mv {_,}$CUSTOM_BOOTSTRAP_SASS.theme
grep -Rl serg_ysu_theme .|xargs sed -i -e "s/bootstrap_sass/$CUSTOM_BOOTSTRAP_SASS/"
sed -i -e "s/SASS Bootstrap Starter Kit Subtheme/$CUSTOM_BOOTSTRAP_SASS_NAME/" $CUSTOM_BOOTSTRAP_SASS.info.yml
echo "# Check the themes/custom folder for your new sub-theme."
