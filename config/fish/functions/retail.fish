function retail --wraps='sudo tailscale down && sudo tailscale up' --description 'alias retail=sudo tailscale down && sudo tailscale up'
  sudo tailscale down && sudo tailscale up $argv
        
end
