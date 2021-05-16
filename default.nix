let
  pkgs = import <nixpkgs> {};
  inherit (pkgs.haskell.lib) dontCheck;
  hPkgs = pkgs.haskell.packages.ghc8102.extend (final: prev: {
    servant-multipart = final.callCabal2nix "servant-multipart" ./servant-multipart {};
    servant-multipart-api = final.callCabal2nix "servant-multipart-api" ./servant-multipart-api {};
    servant-multipart-client = final.callCabal2nix "servant-multipart-client" ./servant-multipart-client {};
    http-media = dontCheck prev.http-media;
  });
in {
  inherit (hPkgs)
    servant-multipart
    servant-multipart-api
    servant-multipart-client
    ;
}
