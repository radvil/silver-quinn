#!/bin/bash

set -euo pipefail

# Function to show help
show_help() {
  echo "Silver Quinn Image Builder"
  echo "========================="
  echo
  echo "Usage: $0 [COMMAND] [VARIANT] [TAG]"
  echo
  echo "Commands:"
  echo "  build          - Build specified variant"
  echo "  clean          - Remove specified variant"
  echo "  clean-all      - Remove all silver-quinn images"
  echo "  list           - List all silver-quinn images"
  echo "  help           - Show this help message"
  echo
  echo "Variants:"
  echo "  kde-nvidia         - KDE Plasma with NVIDIA proprietary drivers"
  echo "  kde-nvidia-open    - KDE Plasma with NVIDIA open source drivers"
  echo "  gnome-nvidia       - GNOME with NVIDIA proprietary drivers"
  echo "  gnome-nvidia-open  - GNOME with NVIDIA open source drivers"
  echo
  echo "Tag:"
  echo "  latest (default) or specify a custom tag"
  echo
  echo "Examples:"
  echo "  $0 build kde-nvidia        # Build KDE variant with NVIDIA drivers"
  echo "  $0 build gnome-nvidia      # Build GNOME variant with NVIDIA drivers"
  echo "  $0 clean kde-nvidia        # Remove KDE NVIDIA variant"
  echo "  $0 clean-all              # Remove all variants"
  echo "  $0 list                   # List all variants"
}

# Function to list silver-quinn images
list_images() {
  echo "Local silver-quinn images:"
  podman images | grep "silver-quinn" || echo "No silver-quinn images found"
}

# Function to remove specific variant
clean_variant() {
  local variant=$1
  local tag=${2:-"latest"}
  echo "Removing silver-quinn-$variant:$tag..."
  podman rmi "localhost/silver-quinn-$variant:$tag" 2>/dev/null || echo "Image silver-quinn-$variant:$tag not found"
  
  # If removing kde-nvidia, also remove the default image
  if [ "$variant" = "kde-nvidia" ]; then
    echo "Removing silver-quinn:$tag..."
    podman rmi "localhost/silver-quinn:$tag" 2>/dev/null || echo "Image silver-quinn:$tag not found"
  fi
}

# Function to remove all silver-quinn images
clean_all() {
  echo "Removing all silver-quinn images..."
  podman images | grep "silver-quinn" | awk '{print $3}' | xargs -r podman rmi 2>/dev/null || echo "No silver-quinn images found"
}

# Show help if no arguments provided
if [ $# -eq 0 ]; then
  show_help
  exit 0
fi

# Parse command
COMMAND=$1
shift

case "$COMMAND" in
  "build")
    # Default values for build
    VARIANT=${1:-"kde-nvidia"}
    TAG=${2:-"latest"}

    # Map variant to base image
    case "$VARIANT" in
      "kde-nvidia")
        BASE_IMAGE="bazzite-asus-nvidia"
        ;;
      "kde-nvidia-open")
        BASE_IMAGE="bazzite-asus-nvidia-open"
        ;;
      "gnome-nvidia")
        BASE_IMAGE="bazzite-gnome-asus-nvidia"
        ;;
      "gnome-nvidia-open")
        BASE_IMAGE="bazzite-gnome-asus-nvidia-open"
        ;;
      *)
        echo "Error: Unknown variant '$VARIANT'"
        echo
        show_help
        exit 1
        ;;
    esac

    echo "Building silver-quinn-$VARIANT..."
    echo "Using base image: $BASE_IMAGE"

    # Build the image
    podman build \
      --build-arg="BASE_IMAGE=$BASE_IMAGE" \
      --tag="localhost/silver-quinn-$VARIANT:$TAG" \
      .

    # If this is kde-nvidia, also build the default image
    if [ "$VARIANT" = "kde-nvidia" ]; then
      echo "Building default silver-quinn image..."
      podman build \
        --build-arg="BASE_IMAGE=localhost/silver-quinn-kde-nvidia:$TAG" \
        --tag="localhost/silver-quinn:$TAG" \
        .
    fi

    echo "Done! Images built:"
    list_images
    ;;

  "clean")
    VARIANT=${1:-"kde-nvidia"}
    TAG=${2:-"latest"}
    clean_variant "$VARIANT" "$TAG"
    list_images
    ;;

  "clean-all")
    clean_all
    list_images
    ;;

  "list")
    list_images
    ;;

  "help"|"-h"|"--help")
    show_help
    ;;

  *)
    echo "Error: Unknown command '$COMMAND'"
    echo
    show_help
    exit 1
    ;;
esac 