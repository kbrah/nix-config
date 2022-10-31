
{ config, lib, pkgs, ...};

{
	programs.zsh.enable = true;

	services = {
		xserver = {
			layout = "us";
			xkbVariant = "";
			xkbOptions = "caps:swapescape";

			desktopManager = {
				xfce = {
					enable = true;    
					noDesktop = true;
					enableXfwm = false;
				};
			};
			displayManager = {
				lightdm.enable = true; 
				defaultSession = "xfce+i3";
			};

			windowManager.i3 = {
				enable = true;
				extraPackages = with pkgs; [
					dmenu
						i3status
						i3lock
						i3blocks
				];
			};
		};
	}
