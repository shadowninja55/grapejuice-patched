{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  outputs = { self, nixpkgs }: let pkgs = nixpkgs.legacyPackages.x86_64-linux; in {
    defaultPackage.x86_64-linux = pkgs.grapejuice.override {
      wine = pkgs.wineWowPackages.staging.overrideAttrs (
        old: {
          patches = old.patches ++ [ ./patches/mouse.patch ]; 
        }
      );
    };
  };
}
