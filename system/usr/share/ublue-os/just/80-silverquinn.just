# Connect home using WireGuard
connect-home:
    #!/bin/bash
    echo "Connecting to home"
    tailscale up --exit-node fw --accept-routes

# Disconnect from home using WireGuard
disconnect-home:
    #!/bin/bash
    echo "Disconnecting from home"
    tailscale down

# TODO: Install system flatpaks
# _install-silverquinn-flatpaks:
#     #!/bin/bash
#     SILVERQUINN_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/silverquinn/flatpaks/main/flatpaks/silverquinn_flatpaks | tr '\n' ' ')"
#     echo "Installing Silverquinn Flatpaks.."
#     flatpak --system -y install ${SILVERQUINN_FLATPAK_LIST}