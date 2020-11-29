export PATH=/opt/wasi-sdk/bin/:$PATH
clang --target=wasm32 -nostdlib -Wl,--export-all,--relocatable,--no-entry,--shared -o lib.wasm lib.c
clang --target=wasm32 -nostdlib -Wl,--export-all,--relocatable,--allow-undefined,--shared -o main.wasm main.c

# wasm-ld --entry main lib.wasm main.wasm -o linked.wasm
# wasm-ld: error: entry symbol not defined (pass --no-entry to supress): main

wasm-ld  --verbose --trace --shared --relocatable -E  lib.wasm main.wasm -o linked.wasm

hexdump -C linked.wasm