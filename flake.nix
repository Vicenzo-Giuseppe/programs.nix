{
  inputs.std.url = "github:divnix/std";
  inputs.nixpkgs.url = "nixpkgs";

  outputs = {std, ...} @ inputs:
    with std; growOn {
      inherit inputs;
      cellsFrom = ./apps;
    };
}
