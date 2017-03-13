# SwiftJS

Very experimental Swift <-> Javascript interaction using NodeJS. Currently in development and not suitable for including in other projects.

SwiftJS works by generating Swift and Javascript code. The intention is to make it possible to re-use NodeJS libraries from Swift or to provide a cross-platform Javascript plugin API for your Swift projects.

## Usage

Mark swift types, functions and variables as "jsAvailable":

```swift
/// sourcery: jsAvailable
class SwiftClass {
    /// sourcery: jsAvailable
    static func sample() {
        print("hello from swift");
    }
}
```

Then in your JavaScript:

```javascript
let SwiftClass = require('./generated').SwiftClass;

SwiftClass.sample();
```

You need to run two instances of sourcery:

`sourcery --watch Sources SourceryTemplates/JavascriptTemplate.js.stencil js/generated.js`

`sourcery --watch Sources SourceryTemplates/SwiftTemplate.swift.stencil Sources/Generated.swift`

## Javascript Object Conformance to Swift Protocols

To use Javascript objects as arguments to Swift methods, define a Swift protocol and mark it as `jsAvailable`:

```swift
/// sourcery: jsAvailable
protocol Person {
	var firstName: String { get }
	var lastName: String { get }
	var email: String { get }
}
```

Because of the dynamic nature of Javascript, protocol conformance is implicit. All Javascript objects that statisfy the protocol requirements can be used.

Example function:

```swift
class Logger {
	static func logName(person: Person) {
		print("\(person.firstName) \(person.lastName)")
	}
}
```

Call from Javascript:

```javascript
Logger.logName({
	firstName: "Henk",
	lastName: "Example",
	email: "henk@example.com"
});
```

If the given Javascript object does not satisfy the protocol requirements, an exception (on the Javascript side) is raised.

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
