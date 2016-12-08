function dock-clean
  docker ps -aq -f status=exited | xargs docker rm -v
end
