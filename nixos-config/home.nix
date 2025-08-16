{ config, pkgs, ... }:

{
  home.username = "sid";
  home.homeDirectory = "/home/sid";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    tmux
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "siddharth-reddy-1607";
    userEmail = "sidd.reddy1607@gmail.com";
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
    };
  };

  home.sessionVariables = {
  SHELL = "${pkgs.zsh}/bin/zsh";
  };

  #Kanshi
  services.kanshi = {
    enable = true;
    systemdTarget = "wayland-session@Hyprland.target";

    settings = [
    {
      profile.name = "undocked";
      profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
          }
        ];
    }
    {
      profile.name = "nlr_single";
      profile.outputs = [
          {
            criteria = "HDMI-A-1";
            position = "0,0";
            mode = "1920x1080@60Hz";
            status = "enable";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
    }
    ];
  };

  programs.neovim.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
