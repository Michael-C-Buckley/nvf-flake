{
  description = "NVF Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
  in {
    packages = builtins.listToAttrs (map (system: {
        name = system;
        value = {
          default = (
            (nvf.lib.neovimConfiguration {
              pkgs = import nixpkgs {inherit system;};
              modules = [./config.nix];
            })
            .neovim
          );
        };
      })
      systems);
  };
}
