(module 
	(import "lib" "test" (func $test (result i32)))
	(func $main (export "main") (result i32)
		(call $test)
	 )
)