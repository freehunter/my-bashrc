function startserver() {
  sudo service postgresql96 start
  rails s -b $IP -p $PORT
}

function getGitBranch() {
  local currentBranch=`git branch | grep "*" | cut -d " " -f 2`
  echo $currentBranch
}

function gitpush() {
  echo "Going to push changes into $(getGitBranch)"
  rake assets:precompile RAILS_ENV=production
  git add .
  read -p "Commit message: " msg
  git commit -am "$msg"
  git push origin $(getGitBranch)
}
