//  clang --target=wasm32 -nostdlib -Wl,--export-all,--allow-undefined,--shared -o module.wasm module.c
int foo(){
	return 43;
}
// in test.c :
// int foo();
/* linking with  DOESN'T CURRENTLY WORK!
https://iandouglasscott.com/2019/07/18/experimenting-with-webassembly-dynamic-linking-with-clang/

 /usr/local/opt/llvm/bin/wasm-ld --entry main test.wasm module.wasm -o linked.wasm
 /opt/wasi-sdk/bin/wasm-ld --entry main test.wasm module.wasm -o linked.wasm
 OR
 clang --target=wasm32 -nostdlib -Wl,--export-all,--allow-undefined,--shared test.c -o test.wasm module.wasm 
 clang --target=wasm32 -Wl,--entry=main,--shared -nostdlib module.wasm -o test.wasm test.c module.wasm
 /usr/local/Cellar/llvm/10.0.0_3/bin/lld test.wasm module.wasm -o linked.wasm

*/