{
  pkgs ? import <nixpkgs> {},
  extraPkgs ? [],
}:
pkgs.mkShellNoCC {
  name = "default";
  buildInputs = with pkgs;
    [
      # Formatting
      mdformat
      alejandra
      treefmt

      # Hooks
      lefthook
      deadnix
      statix
      typos
      nil
    ]
    ++ extraPkgs;

  shellHook = ''
    lefthook install
    git fetch
    git status --short --branch
    export PATH="$PATH:/usr/local/bin"
  '';
}
