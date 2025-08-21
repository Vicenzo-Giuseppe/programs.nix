{
  inputs.std.url = "github:divnix/std";
  inputs.nixpkgs.url = "nixpkgs";

  outputs = {
    std,
    self,
    ...
  } @ inputs:
    with std;
      growOn {
        inherit inputs;
        cellsFrom = ./modules;
        systems = ["x86_64-linux"];
        cellBlocks = with std.blockTypes; [
          (runnables "runner")
        ];
      }
      {
      }
      // {
        packages.x86_64-linux.default = inputs.std.packages.x86_64-linux.std;

        wezterm = (std.harvest self ["wezterm" "runner"]).x86_64-linux.wezterm;
        firefox = (std.harvest self ["firefox" "runner"]).x86_64-linux.firefox;
      };
}
