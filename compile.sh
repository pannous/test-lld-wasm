export PATH=/opt/wasi-sdk/bin/:$PATH
clang --target=wasm32 -nostdlib -Wl,--no-entry,--export-all,--relocatable,--shared -o module.wasm module.c
clang --target=wasm32 -nostdlib -Wl,--export-all,--relocatable,--allow-undefined,--shared -o main.wasm main.c
wasm-ld  --verbose --trace --shared --relocatable --merge-data-segments -E module.wasm main.wasm -o linked.wasm
hexdump -C linked.wasm