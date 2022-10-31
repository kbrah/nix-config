 {

   inputs = {
     nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";                  # Nix Packages

     #home-manager = {                                                      # User Package Management
     #   url = "github:nix-community/home-manager";
     #   inputs.nixpkgs.follows = "nixpkgs";
     # }; 
   };

  outputs = { self, nixpkgs }:
    let 
      user = "lasse";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
	inherit system;
	config.allowUnfree = true;
      };
      lib = nixpkgs.lib;	
    in 
    {
     nixosConfigurations = {
     	lasse = lib.nixosSystem {
	  inherit system;
	  modules = [ ./configuration.nix ];	 
	};
     };
     #homeConfigurations = (                                                # Non-NixOS configurations
     #   import ./nix {
     #     inherit (nixpkgs) lib;
     #     inherit inputs nixpkgs home-manager nixgl user;
     #   }
     # );
    };
 }
