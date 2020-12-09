(module $lib
 (export "test" (func $test))
  ;;(func $test (export "test") (result i32) DOESNT WORK WTF
 (func $test  (result i32)
    (i32.const 42)
  )
)