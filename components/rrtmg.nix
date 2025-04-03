{ buildPythonPackage
, fetchFromGitHub
, gfortran
, meson-python
, numpy
}:
buildPythonPackage rec {
  pname = "climlab-rrtmg";
  version = "0.4.1";

  src = fetchFromGitHub {
    owner = "climlab";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-/NBMESqPb1qcUrWE+/Akj1nRy81HX2w78h1zQc15vY8=";
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
    description = "A stand-alone Python wrapper for the RRTMG radiation modules";
    homepage = "https://github.com/climlab/climlab-rrtmg";
  };
}
