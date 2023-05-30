docker image build --network=host --build-arg USER_ID=$(id -u $USER) --build-arg GROUP_ID=$(id -g $USER) -t gemforge-u20:0.1 .
