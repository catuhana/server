{
  description =
    "Unified configuration for my server and probably my desktops too.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = inputs@{ self, nixpkgs, agenix, ... }: {
    nixosConfigurations = {
      "meow" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";

        specialArgs = { inherit inputs; };

        modules = [
          ./meow

          ./config.nix

          agenix.nixosModules.default
        ];
      };
    };
  };
}
