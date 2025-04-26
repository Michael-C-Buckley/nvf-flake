let
  schemes = [
    "slate"
    "habamax"
    "gruvbox"
    "ayu"
    "rose-pine"
    "catppuccin-mocha"
    "onedark"
  ];
  colorBinds =
    builtins.map (s: {
      mode = "n";
      key = "<leader>cs${builtins.substring 0 1 s}";
      action = ":colorscheme ${s}";
      silent = true;
    })
    schemes;

  telescopeBind = {
    key,
    action
  }: {
    mode = "n";
    key = "<leader>f${key}";
    action = ":Telescope ${action}<CR>";
  };
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
      action = ":Telescope find_files<CR>";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = ":Telescope live_grep<CR>";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = ":Telescope help_tags<CR>";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = ":Telescope buffers<CR>";
    }
  ]
  ++ colorBinds
