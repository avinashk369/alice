#!/bin/bash

# Find all pubspec.yaml files in the packages directory
find packages -name "pubspec.yaml" | while read -r pubspec; do
  # Navigate to the package directory
  package_dir=$(dirname "$pubspec")
  cd "$package_dir" || exit

  echo "Upgrading dependencies in $package_dir..."

  # Run pub upgrade
  dart pub outdated
  dart pub upgrade --major-versions

  # Return to the root directory
  cd - > /dev/null
done

echo "All dependencies upgraded!"