;; This is a sample Guix Home configuration which can help setup your
;; home directory in the same declarative manner as Guix System.
;; For more information, see the Home Configuration section of the manual.
(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells)
  #:use-module (gnu services)
  #:use-module (gnu system shadow)
  #:use-module (gnu packages)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services sound))

(define home-config
  (home-environment
   (packages (append (specifications->packages (list
						;; Text Editors
						"emacs-next-pgtk"
						"neovim"
						;;Emacs configuration
						"emacs-guix"
						"emacs-geiser"
						;;xbox
						"xpadneo"
						;; Terminal
						"kitty"
						"foot"
						;;Browser
						"qutebrowser"
						"firefox"
						;;to stream yt on mpv
						"mpv"
						"yt-dlp"
						;;WM
						"hyprland"
						;;lock screen and idle
						"swaylock"
						"swayidle"
						;;app launcher
						"fuzzel"
						;;waybar
						"waybar"
						;;notification daemon
						"dunst"
						;;steam
						"steam-nvidia"
						"steam-devices-udev-rules"
						;;emulation
						"dolphin-emu"
						;;utilities
						"flatpak"
						"fastfetch"
						"wl-clipboard"
						"grimshot"
						"git"
						"alsa-utils"
						"wireplumber"
						"swww"
						"pavucontrol"
						"protonup-ng"
						;;brightness control
						"brightnessctl"
						;;player control
						"playerctl"
						;;Deps
						"gsettings-desktop-schemas"
						"make"
						"glib:bin"
						"curl"
						;;emoji font
						"font-google-noto-emoji"
						"python"
						"python-pip"
						"rust"
						"rust-cargo"
						"maturin"
						"openssh"
						"xdg-desktop-portal-hyprland"
						"xdg-desktop-portal-gtk"
						"xdg-utils"
						"node"
						"gcc-toolchain"
						))))
    (services
      (list
        ;; Uncomment the shell you wish to use for your user:
       (service home-fish-service-type)
       (service home-dbus-service-type)
       (service home-pipewire-service-type)

        (service home-files-service-type
         `((".guile" ,%default-dotguile)
           (".Xdefaults" ,%default-xdefaults)))

        (service home-xdg-configuration-files-service-type
         `(("gdb/gdbinit" ,%default-gdbinit)
           ("nano/nanorc" ,%default-nanorc)))))))

home-config
