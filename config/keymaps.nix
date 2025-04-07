let
  schemes = [
    "slate"
    "habamax"
    "lunaperche"
    "gruvbox"
    "ayu"
    "rose-pine"
    "catppuccin-mocha"
  ];
  colorBinds =
    builtins.map (s: {
      mode = "n";
      key = "<leader>cs${builtins.substring 0 1 s}";
      action = ":colorscheme ${s}";
      silent = true;
    })
    schemes;
in
  [
    {
      mode = "n";
      key = "<leader>fa";
      action = ":!alejandra %<CR>";
      silent = true;
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = ":FzfLua files<CR>";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree toggle<CR>";
    }
  ]
  ++ colorBinds
