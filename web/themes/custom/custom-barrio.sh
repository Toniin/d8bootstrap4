# Mettre ce script dans /var/www/server_name/web/themes/custom

echo 'Quel nom pour votre thème ?'
read theme

export CUSTOM_BARRIO=$theme # change this to your custom theme_name
cp -r ../contrib/bootstrap_barrio/subtheme $CUSTOM_BARRIO
cd $CUSTOM_BARRIO
for file in *bootstrap_barrio_subtheme.*; do mv $file ${file//bootstrap_barrio_subtheme/$CUSTOM_BARRIO}; done
for file in config/*/*bootstrap_barrio_subtheme.*; do mv $file ${file//bootstrap_barrio_subtheme/$CUSTOM_BARRIO}; done
mv {_,}$CUSTOM_BARRIO.theme
grep -Rl bootstrap_barrio_subtheme .|xargs sed -i '' -e "s/bootstrap_barrio_subtheme/$CUSTOM_BARRIO/"

echo 'Penser à renommer le 'name' de $theme.info.yml  pour le repérer dans les thèmes Drupal'
