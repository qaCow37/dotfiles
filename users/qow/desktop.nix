{config, pkgs, path, ...}:
{
	home.pointerCursor = {
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 16;
		gtk.enable = true;
		x11.enable = true;
	};

	xdg.configFile."niri/config.kdl".text =
	let
		kill-window = ''spawn-sh "kill -9 $(niri msg --json focused-window | jq -r '.pid')"'';
	in
	''
		output "DP-1" {
			mode "2560x1440@239.992"	
			scale 1
			position x=1280 y=1080
			focus-at-startup
		}
		output "DP-2" {	
			mode "1920x1080@144.001"
			scale 1
			position x=720 y=0
		}
		output "DP-3" {
			mode "1280x1024@75.025"
			scale 1
			position x=0 y=1080
		}
		prefer-no-csd
		
		input {
			keyboard {
				repeat-delay 250
			}
		}
		gestures {
			hot-corners {
				off
			}
		}

		cursor {
			xcursor-size 16
			xcursor-theme "Bibata-Modern-Classic"
			hide-when-typing
			hide-after-inactive-ms 3000
		}

		blur {
			passes 4
			offset 12
			noise 0.0
			saturation 1.0
		}
		window-rule {
			match app-id="kitty"
			background-effect {
				blur true
				xray false
			}
		}
		window-rule {
			geometry-corner-radius 12
			clip-to-geometry true
		}

		binds {
			CTRL+ALT+T repeat=false { spawn "kitty"; }
			Mod+Left            { focus-column-left;             }
			Mod+Right           { focus-column-right;            }
			Mod+Up              { focus-workspace-up;            }
			Mod+Down            { focus-workspace-down;          }
			Mod+Ctrl+Left       { move-column-left;              }
			Mod+Ctrl+Right      { move-column-right;             }
			Mod+Ctrl+Up         { move-window-to-workspace-up;   }
			Mod+Ctrl+Down       { move-window-to-workspace-down; }
			Mod+Shift+Up        { set-column-width "100%";       }
			Mod+Shift+Down      { set-column-width  "50%";       }
			Mod+Alt+Left        { focus-monitor-left;            }
			Mod+Alt+Right       { focus-monitor-right;           }
			Mod+Alt+Up          { focus-monitor-up;              }
			Mod+Alt+Down        { focus-monitor-down;            }
			Mod+Alt+Ctrl+Left   { move-window-to-monitor-left;   }
			Mod+Alt+Ctrl+Right  { move-window-to-monitor-right;  }
			Mod+Alt+Ctrl+Up     { move-window-to-monitor-up;     }
			Mod+Alt+Ctrl+Down   { move-window-to-monitor-down;   }
			Mod+F4       repeat=false { close-window;   }
			Mod+Shift+F4 repeat=false { ${kill-window}; }
			
			XF86AudioPlay             { spawn "playerctl" "play-pause"; }
			XF86AudioStop             { spawn "playerctl" "stop";       }
			XF86AudioNext             { spawn "playerctl" "next";       }
			XF86AudioPrev             { spawn "playerctl" "previous";   }
			XF86AudioRaiseVolume      { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05+"; }
			XF86AudioLowerVolume      { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.05-"; }
			CTRL+XF86AudioRaiseVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02+"; }
			CTRL+XF86AudioLowerVolume { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.02-"; }
		}
	'';

	services.hyprpaper = {
		enable = true;
		settings =
		let
			wallpaper = "${path.assets}/background.png";
			black     = "${path.assets}/black.png";
		in
		{
			perload = [wallpaper black];
			wallpaper = [
				{
					monitor = "DP-1";
					path = wallpaper;
					fit_mode = "cover";
				}
				{
					monitor = "*";
					path = black;
					fit_mode = "fill";
				}
			];
		};
	};
}
