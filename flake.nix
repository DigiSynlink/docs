{
  description = "Digisynlink docs PDF Generator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
  };

  outputs = { self, nixpkgs, ... }: 
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux; 
    pythonpkgs = with pkgs.python310Packages; [
      mkdocs-material
      mkdocs-material-extensions
    ];
  in {
    # From Flake but will also processed by flake-compat
    devShell.x86_64-linux = pkgs.mkShell {
      buildInputs = with pkgs; [
          mkdocs
      ] ++ pythonpkgs;
    };
  };
}
