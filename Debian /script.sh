#!/bin/bash

# Check if git is installed or not
if ! command -v git &> /dev/null; then
  echo "Git is not installed, installing git ..."
  sudo apt update
  sudo apt install -y git

  # Check if git install was a success or not
  if ! command -v git &> /dev/null; then
    echo "Failed to install git, check your internet maybe!"
    exit 1
  else
    echo "Git installed successfully"
  fi
fi

echo "Installing CURL"
# Install curl
sudo apt install -y curl

echo "Installing Rust 🦀"
# Install rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y

# Install all other packages (essential)
sudo apt install -y build-essential brave-browser spotify-client discord neofetch nano code htop fonts-symbola fonts-noto-cjk fonts-noto-color-emoji fzf kcalc okular

echo "All the packages basically required are installed !!"

# Installing the starship bash config 
curl -fsSL https://starship.rs/install.sh | bash
echo 'eval "$(starship init bash)"' >> ~/.bashrc

echo "Starship config has been added to your konsole !!"

echo "Now installing Volta and node latest"

read -p "Do you want to install Node.js using Volta? (yes/no): " choice

case "$choice" in
  yes|Yes|YES)
    echo "Installing Node.js using Volta..."
    curl https://get.volta.sh | bash
    source ~/.bashrc
    volta install node
    ;;
  no|No|NO)
    echo "Skipping Node.js installation."
    ;;
  *)
    echo "Invalid choice, please enter 'yes' or 'no'."
    ;;
esac

read -p "Do you want to install Java using SDKman? (yes/no): " choice

case "$choice" in
  yes|Yes|YES)
    echo "Now installing SDKMAN and Java version 17.0.9 of microsoft "
    # Install java latest using SDKMAN
    curl -s "https://get.sdkman.io" | bash
    source ~/.bashrc
    sdk install java 17.0.9-ms
    ;;
  no|No|NO)
    echo "Skipping Java installation."
    ;;
  *)
    echo "Invalid choice, please enter 'yes' or 'no'."
    ;;
esac

echo "Java latest installed"

echo "Now Installing Miniconda"

# Install miniconda (Assuming x86 system, again feel free to modify the script)
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

echo "Restart the terminal and paste 'conda config --set auto_activate_base false' to stop conda from activating base"

# Installing Docker now :)
read -p "Do you want to install Docker? {after installation the system will reboot !!!}(yes/no): " choice

case "$choice" in
  yes|Yes|YES)
    sudo apt update
    sudo apt install -y docker.io docker-compose
    sudo systemctl start docker.service
    sudo systemctl enable --now docker.service
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    sudo reboot now
    ;;
  no|No|NO)
    echo "Skipping Docker installation."
    ;;
  *)
    echo "Invalid choice, please enter 'yes' or 'no'."
    ;;
esac
