# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan.
  ];

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Autoupdates
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Remote desktop
  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "${pkgs.gnome.gnome-session}/bin/gnome-session";
  services.xrdp.openFirewall = true;

  # Gnome
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Disable the GNOME3/GDM auto-suspend feature that cannot be disabled in GUI!
  # If no user is logged in, the machine will power down after 20 minutes.
  systemd.targets.sleep.enable = true;
  systemd.targets.suspend.enable = true;
  systemd.targets.hibernate.enable = true;
  systemd.targets.hybrid-sleep.enable = true;

  # Hostname and networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.resolvconf.enable = true;

  # Time zone and locale settings
  time.timeZone = "America/Montevideo";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_UY.UTF-8";
    LC_IDENTIFICATION = "es_UY.UTF-8";
    LC_MEASUREMENT = "es_UY.UTF-8";
    LC_MONETARY = "es_UY.UTF-8";
    LC_NAME = "es_UY.UTF-8";
    LC_NUMERIC = "es_UY.UTF-8";
    LC_PAPER = "es_UY.UTF-8";
    LC_TELEPHONE = "es_UY.UTF-8";
    LC_TIME = "es_UY.UTF-8";
  };

  # Keymap configuration
  console.keyMap = "br-abnt2";

  # Enable sound with PipeWire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User configuration
  users.users.pedros = {
    isNormalUser = true;
    description = "Pedro Scheeffer";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    git
    neovim
    docker
    docker-compose
    bash
    github-runner
    vscode
  ];


  # Enable essential programs and services
  programs.firefox.enable = true;
  services.openssh.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Enable Nginx
  services.nginx.enable = true;

  # Firewall configuration
  netwroking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22  80 443 ];
  # networking.firewall.allowedUDPPorts = [ 1194 2342 ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System state version
  system.stateVersion = "24.05";
}
