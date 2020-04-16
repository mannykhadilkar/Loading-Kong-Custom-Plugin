#!/bin/sh
PLUGINS="bundled"

# get location of plugin and name of docker container
# echo "Please enter your plugin file folder format (i.e. kong/plugins/plugin-name)"
# read PLUGINLOCATION
# echo "Please enter your docker container:"
# stty -echo
# read DOCKERCONTAINER
# stty echo
# unset PLUGIN
# unset DOCKERCON

export PLUGIN=$PLUGINLOCATION
export DOCKERCON=$DOCKERCONTAINER
export PLUGINNAME=$PLUGINNAME


#copy the code format into docker
# i.e. docker cp kong/plugins/kong-plugin-header-echo/  kong-ent:/usr/local/share/lua/5.1/kong/plugins
docker cp $PLUGIN/  $DOCKERCON:/usr/local/share/lua/5.1/kong/plugins

#reload Kong with the appropriate plugin added. 
docker exec -ti DOCKERCON /bin/sh -c "KONG_PLUGINS='bundled,$PLUGINNAME' kong reload"

# cd ..
# rm -Rf tmp
