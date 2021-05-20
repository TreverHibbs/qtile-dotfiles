# run from $HOME
# install yay
pacman -S --needed git base-devel
cd src/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg
cd ../../

# install qtile
yay -S qtile

# install Xephyr
yay -S xorg-server-xecphyr

#install kitty
yay -S kitty

#install zsh
yay -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -l $HOME/.zshrc .zshrc

#install neovim
yay -S neovim
ln -l $HOME/.vimrc .vimrc

#install xclip
yay -S xclip

#install fzf
yay -S fzf

#install nodejs
yay -S nodejs npm

#install copyq
yay -S copyq

#install anki
yay -S copyq

#install feh
yay -S feh

#install jedi
yay -S jedi

#install pywal
yay -S python-pywal

#install playerctl for media control
yay -S playerctl

# messaging apps
yay -S thunderbird
yay -S discord

# picom
yay -S picom-jonaburg-git
