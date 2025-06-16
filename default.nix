{ pkgs ? import <nixpkgs> { }, ... }:
with pkgs;

libngspice.overrideAttrs (oldAttrs: rec {
  pname = "libngspice-wav";
  version = "44.2";

  src = lib.cleanSource ./.;

  nativeBuildInputs = oldAttrs.nativeBuildInputs
    ++ [ autoconf libtool automake ];

  buildInputs = oldAttrs.buildInputs ++ [ libsndfile libsamplerate unzip ];

  configureFlags = oldAttrs.configureFlags
    ++ [ "--enable-sndfile" "--enable-samplerate" ];

  preConfigure = ''
    ./autogen.sh
  '';
})
