{ buildPythonPackage
, fetchFromGitHub
, gfortran
, meson-python
, numpy
, pooch
, scipy
, xarray
}:
buildPythonPackage rec {
  pname = "climlab-cam3-radiation";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "climlab";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-+ek0sgkmewqWZAFls9WVgtQC78iFVfJfs1nOLU+EdZw=";
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
    pooch
    scipy
    xarray
  ];

  meta = {
    description = "A stand-alone Python wrapper for the NCAR CAM3 radiation scheme";
    homepage = "https://github.com/climlab/climlab-cam3-radiation";
  };
}
