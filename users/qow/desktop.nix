{pkgs, path, ...}:
{
	home.pointerCursor = {
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 16;
		gtk.enable = true;
		x11.enable = true;
	};

	xdg.configFile."niri/config.kdl" = {
		force = true;
		text = let
			kill-window = ''spawn-sh "kill -9 $(niri msg --json focused-window | jq -r '.pid')"'';
		in
		''
			output "DP-1" {
				mode "2560x1440@239.992"
				scale 1
				position x=1280 y=0
				focus-at-startup
			}
			output "DP-2" {
				mode "1280x1024@75.025"
				scale 1
				position x=0 y=0
			}
			prefer-no-csd

			hotkey-overlay {
					skip-at-startup
			}

			input {
				keyboard {
					repeat-delay 150
					repeat-rate 50
				}
			}
			gestures {
				hot-corners {
					off
				}
			}
			recent-windows {
				off
			}

			cursor {
				xcursor-size 16
				xcursor-theme "Bibata-Modern-Classic"
				hide-when-typing
				hide-after-inactive-ms 3000
			}

			blur {
				passes 5
				offset 8
				noise 0.02
				saturation 1.0
			}
			window-rule {
				background-effect {
					blur true
					xray false
				}
				geometry-corner-radius 12
				clip-to-geometry true
			}

			// Fixes bluring issues for zen-browser
			window-rule {
				match app-id="zen-beta"
				draw-border-with-background false
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
				Mod+Ctrl+H     { move-column-left;              }
				Mod+Ctrl+L     { move-column-right;             }
				Mod+Ctrl+J     { move-window-to-workspace-down; }
				Mod+Ctrl+K     { move-window-to-workspace-up;   }
				Mod+N          { focus-monitor-next;            }
				Mod+Ctrl+N     { move-column-to-monitor-next;   }
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

	home.packages = with pkgs; [
		qt5.qtwayland
		qt6.qtwayland
	];
	home.sessionVariables = {
		QT_QPA_PLATFORM = "wayland";
		QT_QPA_PLATFORMTHEME = "qt5ct";
	};
}
