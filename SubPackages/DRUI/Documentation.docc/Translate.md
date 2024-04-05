# Translate Rust Code to Swift.

translate this rust code to swift, preserve comment, doc, and argument name,

Take rust `impl` as swift `public extension`,
- function with `pub fn func_name(&self)` to swift `func`
- function with `pub fn func_name(&mut self)` to swift `mutating func`
- function with `pub fn func_name()` to swift `static func`
- rust `new` function to swift `init` in struct,

### Naming
#### Type name: camelcase
#### function name: camelcase
#### global constant: camelcase
turn somewhat rust
```rust
from__() -> Self
```
to swift
```swift
init()
```

### Inline
add `@inlinable` to swift public variable and function for rust `[inline]`
add `@inline(__always)` to swift public variable and function for rust `#[inline(always)]`

### Debug
```rust
impl std::fmt::Debug for Type
```
To Custom
```swift
public extension Type: CustomDebugStringConvertible
```

### Index
```rust
impl std::ops::IndexMut<usize> for Type
impl std::ops::Index<usize> for Typ2
```
convert to swift
```swift
public extension Type {
    subscript[index: Int]:  {
        get {
            
        }
        mutating set {
            
        }
    }
}
public extension Type {
    subscript[index: Int]:  {
        get {
            
        }
   }
}
```

### Convertable
```rust
impl From<Type2> for Type1
                        
```
convert to swift
```swift
public protocol From {
    associatedtype T
    init(_ value: T)
}

public protocol Into {
    associatedtype T
    static func into() -> T
}

public extension Type1: From where From.T == Type2 {
    
}
```

### Get and Set
change fn that have get and set semantic to  swift
```swift
var varName: Type {
    get {

    }
    mutating set {

    }
}
```

### Operator
```rust
impl AddAssign<Type2> for Type1
impl SubAssign<Type2> for Type1
impl Add<Type2> for Type1
impl Sub for Type
impl Sub<Type2> for Type1 {
Impl Mul<Type2> for Type1
impl Div<Type2> for Type1
```
Convert to swift
```swift
public extension Type1{
    static func -= (lhs: inout Type1, rhs: Type2)
    static func += (lhs: inout Type1, rhs: Type2)
    static func + (lhs: Type1, rhs: Type2) -> Type1
    static func - (lhs: Type1, rhs: Type1) -> Type1
    static func - (lhs: Type1, rhs: Type2) -> Type1
    static func * (lhs: Type1, rhs: Type2) -> Type1
    static func / (lhs: Type1, rhs: Type2) -> Type1
}
```

