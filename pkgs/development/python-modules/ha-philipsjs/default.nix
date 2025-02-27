{ lib
, buildPythonPackage
, cryptography
, fetchFromGitHub
, httpx
, pytest-aiohttp
, pytest-mock
, pytestCheckHook
, pythonOlder
, respx
}:

buildPythonPackage rec {
  pname = "ha-philipsjs";
  version = "3.0.0";
  format = "setuptools";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "danielperna84";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-iJxu+TdgDHMnLuNTFj0UC8V76x3nAgGqswMLDSgmDmQ=";
  };

  propagatedBuildInputs = [
    cryptography
    httpx
  ];

  nativeCheckInputs = [
    pytest-aiohttp
    pytest-mock
    pytestCheckHook
    respx
  ];

  pythonImportsCheck = [
    "haphilipsjs"
  ];

  meta = with lib; {
    description = "Python library to interact with Philips TVs with jointSPACE API";
    homepage = "https://github.com/danielperna84/ha-philipsjs";
    changelog = "https://github.com/danielperna84/ha-philipsjs/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
