{
  buildGoModule,
  fetchFromGitHub,
  lib
}: buildGoModule rec {
    pname = "commitlint";
    version = "0.10.1";

    src = fetchFromGitHub {
      owner = "conventionalcommit";
      repo = "commitlint";
      rev = "v${version}";
      hash = "sha256-OJCK6GEfs/pcorIcKjylBhdMt+lAzsBgBVUmdLfcJR0=";
    };

    vendorHash = "sha256-4fV75e1Wqxsib0g31+scwM4DYuOOrHpRgavCOGurjT8=";

    meta = with lib; {
      description = "commitlint checks if your commit messages meets the conventional commit format";
      homepage = "https://github.com/conventionalcommit/commitlint";
      license = licenses.mit;
      maintainers = with maintainers; [ wwmoraes ];
    };
  }
