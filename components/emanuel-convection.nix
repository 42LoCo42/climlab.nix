{ buildPythonPackage
, fetchFromGitHub
, gfortran
, meson-python
, numpy
}:
buildPythonPackage rec {
  pname = "climlab-emanuel-convection";
  version = "0.3-unstable-2024-11-15";

  src = fetchFromGitHub {
    owner = "climlab";
    repo = pname;
    rev = "902fee7300902a67e6fba511bf702bbcbe0dc347";
    hash = "sha256-4YtFGU66cNBWcXDW+EJL5VJL/wzpAtDAh1BjpHnYrVM=";
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
    description = "A stand-alone Python wrapper for the Emanuel convection scheme";
    homepage = "https://github.com/climlab/climlab-emanuel-convection";
  };
}
