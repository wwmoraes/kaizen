{ fetchzip, graphviz, jre, lib, makeBinaryWrapper, stdenvNoCC }:

stdenvNoCC.mkDerivation rec {
  pname = "structurizr-site-generatr";
  version = "1.3.0";

  src = fetchzip {
    url = "https://github.com/avisi-cloud/structurizr-site-generatr/releases/download/${version}/structurizr-site-generatr-${version}.tar.gz";
    hash = "sha256-53/PiVi9XLPlUMlTCoHqA8XF+rdbEUwAne+T1BVJKDQ=";
  };

  nativeBuildInputs = [
    makeBinaryWrapper
  ];

  buildCommand = ''
    mkdir -p $out/share/structurizr-site-generatr
    install -Dm644 $src/lib/* $out/share/structurizr-site-generatr

    mkdir -p $out/bin
    makeWrapper ${jre}/bin/java $out/bin/structurizr-site-generatr \
      --argv0 structurizr-site-generatr \
      --prefix PATH : ${lib.makeBinPath [ graphviz ]} \
      --add-flags "-classpath $out/share/structurizr-site-generatr/* nl.avisi.structurizr.site.generatr.AppKt"
  '';

  doInstallCheck = true;
  postCheckInstall = ''
    $out/bin/structurizr-site-generatr version
  '';

  meta = {
    description = "Static site generator for architecture models created with Structrizr DSL";
    homepage = "https://github.com/avisi-cloud/structurizr-site-generatr";
    license = lib.licenses.asl20;
    mainProgram = "structurizr-site-generatr";
    maintainers = with lib.maintainers; [ wwmoraes ];
    sourceProvenance = with lib.sourceTypes; [ binaryBytecode ];
  };
}
