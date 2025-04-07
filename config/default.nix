{pkgs, ...}: {
  vim = {
    # Navigation
    projects.project-nvim.enable = true;
    telescope.enable = true;
    navigation.harpoon.enable = true;
    filetree.neo-tree.enable = true;
    fzf-lua.enable = true;

    # Utility
    autopairs.nvim-autopairs.enable = true;
    autocomplete.blink-cmp.enable = true;
    statusline.lualine.enable = true;
    useSystemClipboard = true;
    tabline.nvimBufferline.enable = true;

    # Appearance
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    dashboard.alpha.enable = true;

    utility = {
      mkdir.enable = true;
      nix-develop.enable = true;
      oil-nvim.enable = true;
    };

    treesitter = {
      enable = true;
      context.enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
    };

    extraPlugins = import ./plugins {inherit pkgs;};
    keymaps = import ./keymaps.nix;
    languages = import ./languages;

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    visuals = {
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };
  };
}
