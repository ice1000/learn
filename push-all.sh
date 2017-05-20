read -p "Enter commit message:"
git stage *
git commit * -m "${REPLY}"
git gc
git push origin master

read
