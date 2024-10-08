FROM gitpod/workspace-full

RUN curl -fsSL --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
&& rustup target add wasm32-unknown-unknown \
&& cargo install --locked stellar-cli --features opt \
&& stellar network add \
  testnet \
  --rpc-url https://soroban-testnet.stellar.org:443 \
  --network-passphrase "Test SDF Network ; September 2015" \
&& stellar keys generate alice --network testnet \
&& stellar keys address alice
