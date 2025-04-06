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

    languages = import ./languages;

    utility = {
      oil-nvim.enable = true;
    };

    tabline.nvimBufferline.enable = true;

    keymaps = import ./keymaps.nix;
  };
}
