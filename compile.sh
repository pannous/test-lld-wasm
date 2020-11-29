export PATH=/opt/wasi-sdk/bin/:$PATH
wat2wasm --relocatable lib.wat # this works
# clang --target=wasm32 -nostdlib -Wl,--export-all,--relocatable,--no-entry,--shared -o lib.wasm lib.c
clang --target=wasm32 -nostdlib -Wl,--relocatable -o lib.wasm lib.c
clang --target=wasm32 -nostdlib -Wl,--relocatable -o main.wasm main.c

wasm-ld --entry main lib.wasm main.wasm -o linked.wasm
# wasm-ld: error: lib.wasm: Out of order section type: 0

hexdump -C linked.wasm
# wasmer -i main linked.wasm || 
wasmer -i main linked.wasm  -- 1 2