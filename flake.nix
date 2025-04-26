{
  description = "NVF Flake";

  inputs = {
    nvf.url = "github:notashelf/nvf";
    nixpkgs.follows = "nvf/nixpkgs";
  };

  outputs = {
    nixpkgs,
    nvf,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
  in {
    packages = builtins.listToAttrs (map (system: {
        name = system;
        value = let
          mkNvf = extraModules: (
            (nvf.lib.neovimConfiguration {
              pkgs = import nixpkgs {inherit system;};
              modules = [./config] ++ extraModules;
            })
            .neovim
          );
        in {
          default = mkNvf [./config/extended.nix];
          minimal = mkNvf [];
        };
      })
      systems);
  };
}
