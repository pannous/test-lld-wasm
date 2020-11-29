(module 
	(import "lib" "test" (func $test (result i32)))
	(func $main (export "main") (param i32) (result i32)
		(call $test)
	 )
)