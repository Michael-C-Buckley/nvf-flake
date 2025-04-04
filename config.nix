_: {
  vim = {
    autocomplete.blink-cmp.enable = true;
    statusline.lualine.enable = true;
    telescope.enable = true;
    navigation.harpoon.enable = true;
    utility.oil-nvim.enable = true;

    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
    };

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
      python.enable = true;
    };
  };
}
