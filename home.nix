{ config, pkgs, ... }:

{
  home.username = "heidi";
  home.homeDirectory = "/home/heidi";

  home.packages = with pkgs; [
    neofetch
    firefox
    st
    dmenu
  ];

  programs.fish.enable = true;

  programs.git = {
    enable = true;
    userName = "he1d1";
    userEmail = "hey@heidi.codes";
  };

  programs.neovim = {
    enable = true; 
    defaultEditor = true;
    viAlias = true; 
    vimAlias = true; 
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      gruvbox-material
    ];
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true; 
}
