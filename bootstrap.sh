#!/bin/sh

DIR="${HOME}/.dotfiles"

if [ ! -d ${DIR} ]; then
  git clone git@github.com:im6e/dotfiles.git ${DIR}
fi

pushd ${DIR}

git submodule update --init

for f in `ls -a`
do
  [ $f = "." ] && continue
  [ $f = ".." ] && continue
  [ $f = "README.md" ] && continue
  [ $f = ".git" ] && continue
  [ $f = ".gitignore" ] && continue
  [ $f = ".gitmodules" ] && continue
  [ $f = ".solarized" ] && continue
  [ $f = "bootstrap.sh" ] && continue
  [ $f = "Brewfile" ] && continue
  ln -snf ${DIR}/$f ~/
done

vim -c ':NeoBundleInstall!' -c ':q!' -c ':q!'

popd
