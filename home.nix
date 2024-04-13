{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.username = "heidi";
  home.homeDirectory = "/home/heidi";

  home.packages = with pkgs; [
    neofetch
    firefox
    spotify
    discord
    dmenu
    (st.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        (fetchpatch {
          url = "https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.5.diff";
          sha256 = "sha256-dOkrjXGxFgIRy4n9g2RQjd8EBAvpW4tNmkOVj4TaFGg=";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/ligatures/0.8.3/st-ligatures-20200430-0.8.3.diff";
          sha256 = "sha256-vKiYU0Va/iSLhhT9IoUHGd62xRD/XtDDjK+08rSm1KE=";
        })
      ];
    }))
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

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.gruvbox.enable = true;
    plugins = {
      lualine.enable = true;
    };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true; 
}
