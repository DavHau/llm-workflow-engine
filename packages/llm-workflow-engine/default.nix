# An example package with dependencies defined via pyproject.toml
{
  config,
  lib,
  dream2nix,
  ...
}: {
  imports = [
    dream2nix.modules.dream2nix.pip
  ];

  name = "llm-workflow-engine";
  version = "0.18.2";

  mkDerivation = {
    src = ../../.;
    propagatedBuildInputs = [
      config.pip.drvs.setuptools.public
    ];
  };

  buildPythonPackage = {
    format = lib.mkForce "pyproject";
    pythonImportsCheck = [
      "lwe"
    ];
    catchConflicts = false;
  };

  pip = {
    pypiSnapshotDate = "2023-09-29";
    requirementsFiles = [
      "${../../requirements.txt}"
    ];
    requirementsList = [
      "setuptools"
    ];
    flattenDependencies = true;
  };
}
