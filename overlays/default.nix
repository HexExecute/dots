system: inputs: final: prev: {
  caelestia-cli = inputs.caelestia-cli.packages.${system}.default;
  caelestia-shell = inputs.caelestia-shell.packages.${system}.default;
  zen-browser = inputs.zen-browser.packages.${system}.beta;
}
