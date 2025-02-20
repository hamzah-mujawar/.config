;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
	     (nongnu packages linux)
	     (nongnu system linux-initrd)
	     (nongnu packages nvidia)
	     (nongnu services nvidia)
	     (srfi srfi-1))

(use-package-modules certs)	     
(use-service-modules cups desktop networking ssh xorg)

(operating-system
 (kernel-arguments '("snd-intel-dspcfg.dsp_driver=1"
		     "modprobe.blacklist=nouveau"
		     "nvidia_drm.modeset=1"))
 
  (locale "en_GB.utf8")
  (timezone "Europe/London")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "brick")
  
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "pickle")
                  (comment "Pickle")
                  (group "users")
                  (home-directory "/home/pickle")
                  (supplementary-groups '("wheel" "netdev" "audio" "video" "input")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (specifications->packages (list 
						"nss-certs"
						"sof-firmware"
						"i915-firmware"
						"bluez"
						"bluez-alsa"
						))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (cons*
    (service bluetooth-service-type)
    (service nvidia-service-type)
    ;; Remove gdm-service-type from %desktop-services
    (remove (lambda (service)
              (eq? (service-kind service) gdm-service-type))
            %desktop-services)))

  
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "5aee283c-cc9c-48ac-a709-206ed2901e23")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "E612-79B5"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "74d191a8-3850-4885-809b-29c8e2ff994b"
                                  'ext4))
                         (type "ext4"))
                       (file-system
                         (mount-point "/home")
                         (device (uuid
                                  "22e57825-e915-43f0-bfd1-46e2f823d086"
                                  'ext4))
                         (type "ext4")) %base-file-systems)))
