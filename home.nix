{ config, pkgs, lib, ... }:

{
  home.username = "heidi";
  home.homeDirectory = "/home/heidi";

  home.packages = with pkgs; [
    neofetch
    firefox
    spotify
    discord
    steam
    st
    dmenu
  ];

  programs.fish.enable = true;

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ~/.1password/agent.sock
    '';
  };

  programs.git = {
    enable = true;
    userName = "he1d1";
    userEmail = "hey@heidi.codes";
    signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP0no06qCsMxgQuiXknZmxE1ZqA2GzyWJBLhoTvkyAqh";
    signing.signByDefault = true;
    extraConfig = {
      gpg.format = "ssh";
      gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";
    };
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
