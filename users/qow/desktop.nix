{config, pkgs, path, ...}:
{
	home.pointerCursor = {
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 16;
		gtk.enable = true;
		x11.enable = true;
	};
	
	/*xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-termfilechooser
		];
		config.common."org.freedesktop.impl.portal.FileChooser" = ["termfilechooser"];
	};

	xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
		force = true;
		text = ''
			[filechooser]
			cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
			env=TERMCMD=kitty --class=file_chooser
		'';
	};*/

	xdg.configFile."niri/config.kdl" = {
		force = true;
		text = let
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
				position x=1280 y=0
			}
			output "DP-3" {
				mode "1280x1024@75.025"
				scale 1
				position x=0 y=1080
			}
			prefer-no-csd
			
			hotkey-overlay {
					skip-at-startup
			}
			
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

			layout {
				preset-column-widths {
					proportion 0.5
					proportion 1.0
				}
			}

			binds {
				Mod+T repeat=false { spawn "kitty"; }
				Mod+H          { focus-column-left;             }
				Mod+L          { focus-column-right;            }
				Mod+J          { focus-workspace-down;          }
				Mod+K          { focus-workspace-up;            }
				Mod+M          { switch-preset-column-width;    }
				Mod+C          { center-column;                 }
				Mod+Ctrl+H     { move-column-left;              }
				Mod+Ctrl+L     { move-column-right;             }
				Mod+Ctrl+J     { move-window-to-workspace-down; }
				Mod+Ctrl+K     { move-window-to-workspace-up;   }
				Mod+Alt+H      { focus-monitor-left;            }
				Mod+Alt+L      { focus-monitor-right;           }
				Mod+Alt+J      { focus-monitor-down;            }
				Mod+Alt+K      { focus-monitor-up;              }
				Mod+Alt+Ctrl+H { move-window-to-monitor-left;   }
				Mod+Alt+Ctrl+L { move-window-to-monitor-right;  }
				Mod+Alt+Ctrl+J { move-window-to-monitor-down;   }
				Mod+Alt+Ctrl+K { move-window-to-monitor-up;     }
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
	};

	# Maybe i will switch to hpyrland again...
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = false;
		configType = "lua";
		extraLuaFiles = let cpath = (f: builtins.path {path="${path.config}/hypr/${f}";}); in
		{
			"layout.lua" = {
				autoLoad = true;
				content = cpath "layout.lua";
			};
			"input.lua" = {
				autoLoad = true;
				content = cpath "input.lua";
			};
			"output.lua" = {
				autoLoad = true;
				content = cpath "output.lua";
			};
			"decoration.lua" = {
				autoLoad = true;
				content = cpath "decoration.lua";
			};
		};
	};
	
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
