# SwiftJS

Very experimental Swift <-> NodeJS binding.

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