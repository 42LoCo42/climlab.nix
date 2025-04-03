{ buildPythonPackage
, fetchFromGitHub
, gfortran
, meson-python
, numpy
}:
buildPythonPackage rec {
  pname = "climlab-sbm-convection";
  version = "0.2-unstable-2024-11-26";

  src = fetchFromGitHub {
    owner = "climlab";
    repo = pname;
    rev = "93667af80b90bdb235fed60da824bad62da18484";
    hash = "sha256-lWu71fbnhRAxAhNZCnoheUtSP1VPgr39F7xVoa1zj60=";
  };

  pyproject = true;

  nativeBuildInputs = [
    gfortran
  ];

  build-system = [
    meson-python
  ];

  dependencies = [
    numpy
  ];

  meta = {
    description = "A stand-alone Python wrapper for the Simplified Betts-Miller convection scheme";
    homepage = "https://github.com/climlab/climlab-sbm-convection";
  };
}
