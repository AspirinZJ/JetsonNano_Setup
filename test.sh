git config --global user.name "AspirinZJ"
git config --global user.email "zhangmengwei1996@outlook.com"

echo "Generating ssh key"
ssh-keygen -t rsa

cat ~/.ssh/id_rsa.pub

echo "Paste the key to Github"
