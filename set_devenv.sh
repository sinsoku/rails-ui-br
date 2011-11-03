root=$(cd $(dirname $0);pwd)
ui_br="_ui"

# setup git-hooks
cp ${root}/devenv/git-hooks/post-checkout ${root}/.git/hooks/
cp ${root}/devenv/git-hooks/post-commit ${root}/.git/hooks/

# setup submodule
cd ${root}
git submodule update --init
cd ${root}/${ui_br}
git checkout -t origin/${ui_br}
