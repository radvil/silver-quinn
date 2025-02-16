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

_install-silverquinn-flatpaks:
    #!/bin/bash
    SILVERQUINN_FLATPAK_LIST=(
      "com.dec05eba.gpu_screen_recorder"
      "com.github.wwmm.easyeffects"
      "app.zen_browser.zen"
      "org.gnome.Showtime"
      "com.brave.Browser"
      "org.kde.kdenlive"
      "com.slack.Slack"
    )
    echo "Installing Silverquinn Flatpaks.."
    flatpak --system -y install "${SILVERQUINN_FLATPAK_LIST[@]}"
