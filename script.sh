#!/bin/bash


# Check if git is installed or not
if ! command -v git &> /dev/null; then
  echo "Git is not installed, installing git ..."
  sudo pacman -Sy --noconfirm git

  # Check if git install was a success or not
  if ! command -v git &> /dev/null; then
    echo "Failed to install git, check your internet maybe!"
    exit 1
  else
    echo "Git installed successfully"
  fi
fi

# Check if yay is installed or not
if command -v yay &> /dev/null; then
  echo "yay is already installed"
else
  # Clone yay repo
  git clone https://aur.archlinux.org/yay.git
  
  # Build and install yay
  cd yay
  makepkg -si

  # Check if yay was successfully installed
  if command -v yay &> /dev/null; then
    echo "yay has been installed successfully"
  else
    echo "Failed to install yay, check your internet maybe!"
  fi

  # Delete the yay repo from local machine
  cd ..
  rm -rf yay
fi

echo "Installing CURL"
# Install curl
yay -S --noconfirm curl

echo "
	Installing Rust 🦀

"
# Install rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

# Install all other package (essential)
yay -S --noconfirm base-devel google-chrome spotify discord xwaylandvideobridge neofetch neovim-git nano visual-studio-code-bin htop bpytop freshfetch-git ttf-symbola noto-fonts-cjk noto-fonts-emoji ttf-twemoji fzf kcalc vlc okular tt spicetify-cli

echo "All the packages basically required are installed !!"

# Installing the starship bash config 
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc

echo "Starship config has been added to your konsole !!"

echo "Now installing Volta and node latest"

# Install node latest using volta
curl https://get.volta.sh | bash
source ~/.bashrc
volta install node

echo "Now installing SDKMAN and Java version 17.0.9 of microsoft "
# Install java latest using SDKMAN
curl -s "https://get.sdkman.io" | bash
source ~/.bashrc
sdk install java 17.0.9-ms

echo "
 	Java latets installed
"

echo "
  Now Installing Miniconda
"

# Install miniconda (Assuming x86 system, again feel free to modify the script)
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh


echo "Restart the terminal and paste 'conda config --set auto_activate_base false' to stop conda from activating base"


