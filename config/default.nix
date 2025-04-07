{pkgs, ...}: {
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
    tabline.nvimBufferline.enable = true;

    theme = {
      enable = true;
      name = "nord";
      style = "dark";
    };

    utility = {
      mkdir.enable = true;
      nix-develop.enable = true;
      oil-nvim.enable = true;
    };

    extraPlugins = import ./plugins {inherit pkgs;};
    keymaps = import ./keymaps.nix;
    languages = import ./languages;
  };
}
