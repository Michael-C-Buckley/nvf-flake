{
  description = "NVF Flake";

  inputs = {
    nixpkgs.follows = "nvf/nixpkgs";
    nvf.url = "github:notashelf/nvf";
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
              modules = [./config];
            })
            .neovim
          );
        };
      })
      systems);
  };
}
