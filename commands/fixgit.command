cd -- "$(dirname "$BASH_SOURCE")/.."
echo "Your email: "
read email
echo "Your name: "
read name
vagrant ssh -c "sudo sudo -u greenkey HOME=/home/greenkey git -C /webapps/greenkey/src/greenkey config --global user.email $email"
vagrant ssh -c "sudo sudo -u greenkey HOME=/home/greenkey git -C /webapps/greenkey/src/greenkey config --global user.name '$name'"
echo "Git config update complete!"