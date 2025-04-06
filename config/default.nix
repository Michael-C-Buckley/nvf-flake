_: {
  vim = {
    # Navigation
    projects.project-nvim.enable = true;
    telescope.enable = true;
    navigation.harpoon.enable = true;
    filetree.neo-tree.enable = true;
    fzf-lua.enable = true;

    # Utility
    autocomplete.blink-cmp.enable = true;
    statusline.lualine.enable = true;
    useSystemClipboard = true;

    theme = {
      enable = true;
      name = "nord";
      style = "dark";
    };

    languages = {
      enableLSP = true;
      enableTreesitter = true;
      bash.enable = true;
      nix.enable = true;
      rust.enable = true;
      python.enable = true;
    };

    utility = {
      oil-nvim.enable = true;
    };

    keymaps = import ./keymaps.nix;
  };
}
