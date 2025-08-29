set -e

origin="$(pwd)"
root="$(dirname "$(realpath "$0")")"

cd "$root" || exit 1

rm -rf dotfiles/.* dotfiles/* || true

git clone --bare git@github.com:1emank/dotfiles.git dotfiles

git --work-tree="$HOME" --git-dir="${root}/dotfiles" checkout --force

! alias dof >/dev/null 2>&1 && cat <<EOF >> ~/.bashrc

dotfiles(){
    git --git-dir="${root}/dotfiles/" "--work-tree=$HOME" "\$@"
}
alias dof=dotfiles
EOF

cd "$origin" || exit 1
