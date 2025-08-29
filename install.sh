origin="$(pwd)"
root="$(dirname "$(realpath "$0")")"

cd "$root" || exit 1

git submodule status | grep -q '^-' >/dev/null &&
        git submodule update --init

git --work-tree="$HOME" --git-dir=dotfiles/.git checkout

cd "$origin" || exit 1
