wat2wasm --relocatable module.wat
wat2wasm --relocatable main.wat
wasm-ld  --verbose --trace --shared --relocatable --merge-data-segments -E module.wasm main.wasm -o linked.wasm
hexdump -C linked.wasm