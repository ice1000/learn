read -p "Enter commit message:"
git stage *
git commit -a -m "${REPLY}"
git gc
git push origin master
