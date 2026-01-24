{
  description = "NVF Flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
        flake-parts.follows = "flake-parts";
        ndg.follows = ""; # Documentation generator
      };
    };
  };

  outputs = {
    nixpkgs,
    nvf,
    flake-parts,
    ...
  } @ inputs: let
    inherit (nixpkgs.lib) hasPrefix lists;
    inherit (nixpkgs.lib.fileset) toList fileFilter;

    # Replacement for import-tree
    mkImport = path: toList (fileFilter (f: f.hasExt "nix" && !(hasPrefix "_" f.name)) path);
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
      imports = lists.flatten [
        flake-parts.flakeModules.modules
        (mkImport ./nvf)
      ];
    };
}
