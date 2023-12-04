import Vapor
import Foundation
import AppKit
import Vision

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }
    app.on(.POST, "base64", body: .collect(maxSize: "10mb")) {req -> EventLoopFuture<[String: String]> in
        let ocrRequest = try req.content.decode(OCRRequest.self)
        guard let imageData = Data(base64Encoded: ocrRequest.base64) else {
            throw Abort(.badRequest)
        }

        return req.eventLoop.future(performOCR(with: imageData))
            .map { ["result": $0] }
    }
}


struct OCRRequest: Codable {
    let base64: String
    let languages: String
}

func performOCR(with imageData: Data) -> String {
    guard let cgImage = NSImage(data: imageData)?.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
        return "Failed to create CGImage"
    }

    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    let request = VNRecognizeTextRequest(completionHandler: nil)
    
    // 设置识别的语言为中文简体和繁体
    request.recognitionLanguages = ["zh-Hans", "en"]

    do {
        try handler.perform([request])
    } catch {
        return "OCR failed: \(error)"
    }

    guard let results = request.results else {
        return "No text recognized"
    }

    return results.compactMap { $0.topCandidates(1).first?.string }.joined(separator: "\n")
}