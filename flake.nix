{
  description = "NVF Flake";

  inputs = {
    nvf.url = "github:notashelf/nvf";
    nixpkgs.follows = "nvf/nixpkgs";
    flake-parts.follows = "nvf/flake-parts";
  };

  outputs = {
    nixpkgs,
    nvf,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
  in {
    devShells = builtins.listToAttrs (map (system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        name = system;
        value = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              alejandra
              git
              tig
            ];
          };
        };
      })
      systems);
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
