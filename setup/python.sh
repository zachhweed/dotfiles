if [ "$CONFIGURE_PYTHON" == '1' ] || [ "$RUN_ALL" == '1' ]; then
  curl https://bootstrap.pypa.io/ez_setup.py -o - | sudo python
  sudo easy_install pip

  # Media management (handled by python libraries)

  pip3 install beets beets-copyartifacts pynvim msgpack

fi
