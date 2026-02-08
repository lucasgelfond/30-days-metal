import Metal
let device = MTLCreateSystemDefaultDevice()!
print("Device name: \(device.name)")

let buffer = device.makeBuffer(length: 16, options: [])!
print("Buffer is \(buffer.length) bytes in length")
let points = buffer.contents().bindMemory(to: SIMD2<Float>.self, capacity: 2)
points[0] = SIMD2<Float>(6, 6)
points[1] = SIMD2<Float>(7,7)
let p0 = points[0]
let p1 = points[1]
print("p0: \(p0), p1: \(p1)")
