let
  mkFzfBind = keys: action: {
    mode = "n";
    key = "<leader>${keys}";
    action = ":FzfLua ${action}<CR>";
  };
in {
  flake.modules.nvf.fzflua = {
    vim = {
      fzf-lua.enable = true;

      keymaps = [
        (mkFzfBind "f" "files")
        (mkFzfBind "/" "live_grep")
        (mkFzfBind ";" "resume")
        (mkFzfBind "cs" "colorschemes")
        (mkFzfBind "gs" "git_status")
        (mkFzfBind "gd" "git_diff")
        (mkFzfBind "gb" "git_branches")
        (mkFzfBind "fu" "undo")
      ];
    };
  };
}
