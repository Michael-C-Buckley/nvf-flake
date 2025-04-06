{
  enable = true;
  extraDiagnostics = {
    enable = true;
    types = [
      "statix"
      "deadnix"
    ];
  };
  format = {
    enable = true;
    type = "alejandra";
  };
  lsp = {
    enable = true;
    server = "nil";
  };
  treesitter.enable = true;
}
