export PATH=/opt/wasi-sdk/bin/:$PATH
clang --target=wasm32 -nostdlib -Wl,--relocatable -o lib.wasm lib.c
clang --target=wasm32 -nostdlib -Wl,--relocatable -o main.wasm main.c

wasm-ld --entry main lib.wasm main.wasm -o linked.wasm

# clang adds two parameters (argc, argv) to main by convention:
# wasmer -i main linked.wasm ||  
wasmer -i main linked.wasm  -- 1 2