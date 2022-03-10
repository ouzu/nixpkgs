{ lib
, fetchFromGitHub
, rustPlatform
, glib
, gst_all_1
, gtk3
, pkg-config
, wrapGAppsHook
, ...
}:

rustPlatform.buildRustPackage rec {
  pname = "glide";
  version = "0.5.9";

  src = fetchFromGitHub {
    owner = "philn";
    repo = pname;
    rev = version;
    hash = "sha256-gkUeF6wnlziYJsQGES975FdNY5HohsxPULnYe9kql2Q=";
  };

  cargoHash = "sha256-uRV4dT2CcOm8LHe5wno/4sNroEGsStf6Mfzrs0ln3Kw=";

  nativeBuildInputs = [
    glib
    pkg-config
    wrapGAppsHook
  ];

  buildInputs = [
    glib
    gtk3
  ] ++ (with gst_all_1; [
    gstreamer
    gst-plugins-base
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-ugly
  ]);

  meta = with lib; {
    description = "media player based on GStreamer and GTK";
    homepage = "https://github.com/philn/glide";
    license = licenses.mit;
  };
}
