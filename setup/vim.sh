if [ "$CONFIGURE_VIM" == '1' ] || [ "$RUN_ALL" == '1' ]; then
  mkdir -p ~/.vim/plugged
  mkdir -p ~/.vim/colors && \
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts


fi


