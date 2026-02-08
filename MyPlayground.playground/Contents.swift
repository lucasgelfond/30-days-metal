import Metal
let device = MTLCreateSystemDefaultDevice()!
print("Device name: \(device.name)")

let commandQueue = device.makeCommandQueue()!
let commandBuffer = commandQueue.makeCommandBuffer()!
commandBuffer.addCompletedHandler { completedCommandBuffer in
    print("Command buffer completed")
}


let sourceBuffer = device.makeBuffer(length: 16, options: [])!
let destBuffer = device.makeBuffer(length: 16, options: [])!
let points = sourceBuffer.contents().bindMemory(to: SIMD2<Float>.self, capacity: 2)
points[0] = SIMD2<Float>(6, 6)
points[1] = SIMD2<Float>(7,7)
let p0 = points[0]
let p1 = points[1]
print("p0: \(p0), p1: \(p1)")
let blitCommandEncoder = commandBuffer.makeBlitCommandEncoder()!
blitCommandEncoder.copy(from: sourceBuffer, sourceOffset: 0, to: destBuffer, destinationOffset: 0, size: MemoryLayout<SIMD2<Float>>.stride * 2)
blitCommandEncoder.endEncoding()
commandBuffer.addCompletedHandler { completedCommandBuffer in
    let outPoints = destBuffer.contents().bindMemory(to: SIMD2<Float>.self, capacity: 2)
    let p1 = outPoints[1]
    print("p1 in destination buffer is \(p1)")
}
commandBuffer.commit()

