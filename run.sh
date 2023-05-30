docker run --network host --detach -i --cap-add SYS_ADMIN --mount type=bind,src=[where you cloned gem forge],dst=/gem-forge-stack --name gemforge-perf gemforge-u20:0.1
