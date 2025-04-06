{
  enableLSP = true;
  enableTreesitter = true;

  bash.enable = true;
  rust.enable = true;
  python.enable = true;
  nix = import ./nix.nix;
}
