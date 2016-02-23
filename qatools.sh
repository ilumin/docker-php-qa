#!/bin/sh

CURRENT_DIR=$(pwd)

FIRST_ARG="$1"
COUNT_ARG=$#

if [[ ${COUNT_ARG} = 0 ]]; then
  FIRST_ARG="-h"
fi

echo ''
echo ''
echo '    dMMMMb  dMP dMP dMMMMb        .aMMMb   .aMMMb      dMMMMMMP .aMMMb  .aMMMb  dMP    .dMMMb '
echo '   dMP.dMP dMP dMP dMP.dMP       dMP"dMP  dMP"dMP        dMP   dMP"dMP dMP"dMP dMP    dMP" VP '
echo '  dMMMMP" dMMMMMP dMMMMP"       dMP.dMP  dMMMMMP        dMP   dMP dMP dMP dMP dMP     VMMMb   '
echo ' dMP     dMP dMP dMP           dMP.MMP  dMP dMP        dMP   dMP.aMP dMP.aMP dMP    dP .dMP   '
echo 'dMP     dMP dMP dMP            VMMP"MP dMP dMP        dMP    VMMMP"  VMMMP" dMMMMMP VMMMP"    '
echo ''
echo ''

echo "on ${CURRENT_DIR}"
echo ''

case ${FIRST_ARG} in
  "-h" )
    echo "qatools <tools> [args|...]"
    echo ''
    echo 'Available tools'
    echo '1. PHPLoc                   example: qatools phploc --log-csv=<file-path> <source-path>'
    echo '2. PHPDepend                example: qatools pdepend --summary-xml=<file-path> --jdepend-chart=<file-path> --overview-pyramid=<file-path> <source-path>'
    echo '3. PHP Mess Detector        example: qatools phpmd <source-file> xml --report-file=<file-path> cleancode,codesize,controversial,design,naming,unusedcode'
    echo '4. PHP Code Sniffer         example: qatools phpcs --standard=PSR1,PSR2 --report=xml --report-file=<file-path> <source-file>'
    echo '5. PHP Copy/Paste Detector  example: qatools phpcpd <source-file>'
    echo '6. # PhpMetrics             example: qatools phpmetrics --report-file=<file-path> <source-file>'
    echo ''
    ;;
  * )
    echo "RUN docker with ${TOOLS}"
    echo ''
    docker run --rm -i -v ${CURRENT_DIR}:/var/www phpqa $@
    ;;
esac
