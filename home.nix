{ config, pkgs, ... }:

{
  home.username = "heidi";
  home.homeDirectory = "/home/heidi";

  home.packages = with pkgs; [
    neofetch

    firefox
  ];

  home.stateVersion = "23.11";

  programs.home-manager.enable = true; 
}
