function tail --wraps='sudo tailscale ' --description 'alias tail=sudo tailscale '
  sudo tailscale  $argv
        
end
