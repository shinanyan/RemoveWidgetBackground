#!/bin/sh
# Toolchain selection for this project (rootful scheme).
#
# CI keeps its toolchain at $HOME/theos. A local machine usually has the two
# toolchains somewhere else, so point THEOS_LOCAL at the one you want instead of
# editing this file:
#
#     THEOS_LOCAL=$HOME/rootless/theos source devkit/env.sh
#
# Only THEOS_LOCAL is honoured. Do not read $THEOS back: the CI runner exports
# THEOS for the roothide step before these scripts run, so honouring it would
# silently build this variant with the wrong toolchain.

export THEOS=${THEOS_LOCAL:-$HOME/theos}
export THEOS_PACKAGE_SCHEME=
export THEOS_DEVICE_IP=127.0.0.1
export THEOS_DEVICE_PORT=58422
export THEOS_DEVICE_SIMULATOR=

# Fail loudly instead of silently keeping a bogus $THEOS: the build would otherwise fall
# back to a stale toolchain without any warning.
if [ ! -d "$THEOS" ]; then
    echo "devkit/env.sh: THEOS is not a directory: $THEOS" >&2
    echo "  Override it for this machine, e.g.:" >&2
    echo "    THEOS_LOCAL=\$HOME/rootless/theos source devkit/env.sh" >&2
    return 1 2>/dev/null || exit 1
fi
