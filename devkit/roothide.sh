#!/bin/sh
# Toolchain selection for this project (roothide scheme).
#
# CI keeps the roothide fork at $HOME/theos-roothide. A local machine usually has
# it somewhere else, so point THEOS_LOCAL at it instead of editing this file:
#
#     THEOS_LOCAL=$HOME/roothide/theos source devkit/roothide.sh
#
# Only THEOS_LOCAL is honoured. The CI runner exports THEOS for this step too, so
# reading $THEOS back would work here but break the other two scripts.

export THEOS=${THEOS_LOCAL:-$HOME/theos-roothide}
export THEOS_PACKAGE_SCHEME=roothide
export THEOS_DEVICE_IP=127.0.0.1
export THEOS_DEVICE_PORT=58422
export THEOS_DEVICE_SIMULATOR=

# Fail loudly instead of silently keeping a bogus $THEOS: the build would otherwise fall
# back to a stale toolchain without any warning.
if [ ! -d "$THEOS" ]; then
    echo "devkit/roothide.sh: THEOS is not a directory: $THEOS" >&2
    echo "  Override it for this machine, e.g.:" >&2
    echo "    THEOS_LOCAL=\$HOME/roothide/theos source devkit/roothide.sh" >&2
    return 1 2>/dev/null || exit 1
fi
