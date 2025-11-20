# night routine script
function night
  set appblock "$HOME/.dotfiles/scripts/systems/app-block.sh"
  set grayscale "$HOME/.config/picom/toggle-gray.sh"
  
  bash $grayscale
  bash $appblock
  tw start planning night
end


