let 
  schemes = [
    "desert"
    "nord"
    "slate"
    "habamax"
    "lunaperche"
    ];
  colorBinds = builtins.map (s: {
    mode = "n";
    key = "<leader>cs${builtins.substring 0 1 s}";
    action = ":colorscheme ${s}";
    silent = true;
  }) schemes;
in [
  {
    mode = "n";
    key = "<leader>fa";
    action = ":!alejandra %<CR>";
    silent = true;
  }
] ++ colorBinds