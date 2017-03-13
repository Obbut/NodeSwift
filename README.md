# SwiftJS

Very experimental Swift <-> NodeJS binding.

## Usage

Mark swift types, functions and variables as "jsAvailable":

```swift
/// sourcery: jsAvailable
class SwiftClass {
    /// sourcery: jsAvailable
    static func sample() {
        print("hello from swift");
    }
```

Then in your JavaScript:

```javascript
let SwiftClass = require('./generated').SwiftClass;

SwiftClass.sample();
```

## Socket protocol

SwiftJS uses a socket-based protocol for communications.

### Message format

```
message length (int32 little endian) excluding itself (json only)
message (UTF8 JSON)
```

To call a static Swift function:

```json
{
    "a": "callStatic",
    "t": "SwiftClassName",
    "m": "staticMethodName"
}
```