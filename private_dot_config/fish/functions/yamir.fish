function yamir -d "Force refresh of all package lists after updating /etc/pacman.d/mirrorlist"
    yay -Syy $argv
end
