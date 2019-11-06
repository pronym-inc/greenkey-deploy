cd -- "$(dirname "$BASH_SOURCE")/.."
vagrant ssh -c "sudo sudo -u greenkey HOME=/home/greenkey git -C /webapps/greenkey/src/greenkey add /webapps/greenkey/src/greenkey"
echo "Enter commit message:"
read commitmsg
vagrant ssh -c "sudo sudo -u greenkey HOME=/home/greenkey git -C /webapps/greenkey/src/greenkey commit -am '$commitmsg'"
vagrant ssh -c "sudo sudo -u greenkey HOME=/home/greenkey git -C /webapps/greenkey/src/greenkey push"
echo "Git commit complete!"