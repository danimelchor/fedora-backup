read -p "Have you updated fedora (y/n) " answer
case $answer in
    [Nn]* ) sudo dnf update -y;
            sudo reboot;;
    * ) echo "Please answer yes or no.";;
esac

read -p "Have you installed Snap and RMP Fusion Packages (y/n) " answer2
case $answer2 in
    [Nn]* ) # Install RPM Fusion
            sudo dnf install akmod-nvidia;
            sudo dnf install xorg-x11-drv-nvidia-cuda;
            # Install Snapcraft store
            echo "Installing Snapcraft";
            sudo dnf install snapd;
            # Reboot so Snapcraft changes are saved correctly
            sudo reboot;
    [Yy]* ) # Save snapcraft
            sudo ln -s /var/lib/snapd/snap /snap
            sudo snap install snap-store

            # Install VSCode
            echo "Installing VSCode"
            sudo snap install code --classic
            echo "VSCode Installed -- Sync Settings with GitHub!"

            # Install Discord
            echo "Installing Discord"
            sudo snap install discord

            # Install Spotify
            echo "Installing Spotify"
            sudo snap install spotify

            # Install Brave Browser
            echo "Installing Brave"
            sudo snap install brave

            # Install Gnome Tweaks for customizing
            echo "Installing Gnome Tweaks"
            sudo dnf install gnome-tweaks

            # Install Postman
            echo "Installing Postman"
            sudo snap install postman

            # Install git
            echo "Installing Git"
            sudo dnf install git-all

            # Configure github
            echo "Enter email: "
            read github_email

            ssh-keygen -t ed25519 -C github_email
            ssh-add ~/.ssh/id_ed25519
            echo "Github configured, add the ssh key located in '~/.ssh/id_ed25519.pub' to your GitHub profile"

            # Upgrade PIP and install python packages
            echo "Installing Python Packages"
            python -m pip install --upgrade pip
            sudo pip install virtualenv jupyterlab

            # Saving aliases
            echo "alias ve=\"source venv/bin/activate\"" >> ~/.bashrc

            # Dowloading used repositories
            cd ~/Documents
            mkdir CodeProjects
            git clone git@github.com:danimelchor/website.git

            # Dowloading BU Nexus repos
            mkdir Nexus
            cd Nexus
            git@github.com:Boston-University-Nexus/frontend.git
            git@github.com:Boston-University-Nexus/nodejs-backend.git
    * ) echo "Please answer yes or no.";;
esac