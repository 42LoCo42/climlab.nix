{ buildPythonPackage
, callPackage
, fetchFromGitHub
, numpy
, setuptools
}:
buildPythonPackage rec {
  pname = "climlab";
  version = "0.9.1";

  src = fetchFromGitHub {
    owner = "climlab";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-xN3VZTuIMqCB/5wprlMpkIB5WSafO3MbkpXoQItG2+w=";
  };

  pyproject = true;

  build-system = [
    setuptools
  ];

  dependencies = [
    numpy

    (callPackage ./cam3-radiation.nix { })
    (callPackage ./emanuel-convection.nix { })
    (callPackage ./rrtmg.nix { })
    (callPackage ./sbm-convection.nix { })
  ];

  meta = {
    description = "Python package for process-oriented climate modeling";
    homepage = "https://github.com/climlab/climlab";
  };
}
