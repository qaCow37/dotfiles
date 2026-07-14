{lib, ...}:
{
	programs.starship.settings =
	let
		style = rec {
			bch = "◥";
			ech = "◣";

			do = fg: bg: "(fg:${fg} bg:${bg})";
			dobg = bg: do "crust" bg;
			beg = c: n:          "[${bch}]${do n c}";
			end = c: n: "${dobg c}[${ech}]${do c n}";
		};

		mkmod = fmt: attr: {
			disabled = false;
			format = fmt;
		} // attr;
	in
	{
		format = lib.concatStrings
		[
			"[ $os  ]"       (style.end "red"    "maroon"     )
			"[ $directory ]" (style.end "maroon" "peach"      )
			"[ $time ]"      (style.end "peach"  "transparent")

			"    "
			"$git_metrics"

			"$line_break"
			"$character"
		];

		os = mkmod "$symbol"
		{
			symbols.NixOS = "";
		};
		directory = mkmod "$path"
		{
			truncation_symbol = "…/";
			truncation_length = 3;
			truncate_to_repo = true;
		};
		time = mkmod "$time"
		{
			time_format = "%H:%M";
		};

		git_metrics = let
			prefix = lib.concatStrings [
				(style.beg "transparent" "#FFFFFF")
				"[ ]"
				(style.end "#FFFFFF" "green")
			];
			added = lib.concatStrings [
				# (style.beg "transparent" "green")
				"[ +$added ]"
				(style.end "green" "red")
			];
			deleted = lib.concatStrings [
				# no begin
				"[ -$deleted ]"
				(style.end "red" "transparent")
			];
		in mkmod "${prefix}${added}${deleted}" {};
	};
}
