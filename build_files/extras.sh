#!/usr/bin/env bash 

mkdir -p /tmp/extras 

# Install Starship prompt
echo "Attempting to install Starship Prompt"
STARSHIP_VERSION=$(curl -s "https://api.github.com/repos/starship/starship/releases/latest" | jq -r '.tag_name' | sed 's/v//')
curl -L -o "/tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz" "https://github.com/starship/starship/releases/download/v${STARSHIP_VERSION}/starship-x86_64-unknown-linux-gnu.tar.gz"
curl -L -o "/tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz.sha256" "https://github.com/starship/starship/releases/download/v${STARSHIP_VERSION}/starship-x86_64-unknown-linux-gnu.tar.gz.sha256"
EXPECTED_STARSHIP_SUM=$(cat /tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz.sha256)
ACTUAL_STARSHIP_SUM=$(sha256sum /tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz | awk '{print $1}')
if [ "$EXPECTED_STARSHIP_SUM" == "$ACTUAL_STARSHIP_SUM" ]; then
    echo "Starship checksum matches"
    tar -xzf "/tmp/extras/starship-x86_64-unknown-linux-gnu.tar.gz" -C "/tmp/extras"
    mv /tmp/extras/starship /usr/bin
else 
    echo "Starship checksums do not match"
    exit 1
fi

# Install Rustdesk 
echo "Attempting to install Rustdesk"
RUSTDESK_VERSION=$(curl -s "https://api.github.com/repos/rustdesk/rustdesk/releases/latest" | jq -r '.tag_name' | sed 's/v//')
curl -L -o "/tmp/extras/rustdesk-${RUSTDESK_VERSION}.x86_64.rpm" "https://github.com/rustdesk/rustdesk/releases/download/v${RUSTDESK_VERSION}/rustdesk-${RUSTDESK_VERSION}.x86_64.rpm"
curl -L -o "/tmp/extras/rustdesk-${RUSTDESK_VERSION}.x86_64.rpm.sha256" "https://github.com/rustdesk/rustdesk/releases/download/v${RUSTDESK_VERSION}/rustdesk-${RUSTDESK_VERSION}.x86_64.rpm.sha256"
dnf install "/tmp/extras/rustdesk-${RUSTDESK_VERSION}.x86_64.rpm"

rm -rf /tmp/extras
