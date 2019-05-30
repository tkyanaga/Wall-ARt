////
////  CaptureManager.swift
////  Wall ARt
////
////  Created by Tyrone Yanaga on 5/7/19.
////  Copyright © 2019 tk74. All rights reserved.
////
//
//import Foundation
//import UIKit
//import AVFoundation
//
//protocol CaptureManagerDelegate: class {
//    func processCapturedImage(image: UIImage)
//}
//
//class CaptureManager: NSObject {
//    internal static let shared = CaptureManager()
//    weak var delegate: CaptureManagerDelegate?
//    var session: AVCaptureSession?
//    
//    override init() {
//        super.init()
//        session = AVCaptureSession()
//        
//        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
//            else {
//                print("Unable to access back camera!")
//                return
//        }
//        
//        //setup input
//        do{
//            let input = try AVCaptureDeviceInput(device: backCamera)
//            session?.addInput(input)
//        }
//        catch let error  {
//            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
//        }
//        
//        
//        
//        //setup output
//        let output = AVCaptureVideoDataOutput()
//        output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as AnyHashable: kCVPixelFormatType_32BGRA]
//        output.setSampleBufferDelegate(self, queue: DispatchQueue.main)
//        session?.addOutput(output)
//    }
//    
//    func statSession() {
//        session?.startRunning()
//    }
//    
//    func stopSession() {
//        session?.stopRunning()
//    }
//    
//    func getImageFromSampleBuffer(sampleBuffer: CMSampleBuffer) ->UIImage? {
//        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
//            return nil
//        }
//        CVPixelBufferLockBaseAddress(pixelBuffer, .readOnly)
//        let baseAddress = CVPixelBufferGetBaseAddress(pixelBuffer)
//        let width = CVPixelBufferGetWidth(pixelBuffer)
//        let height = CVPixelBufferGetHeight(pixelBuffer)
//        let bytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer)
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)
//        guard let context = CGContext(data: baseAddress, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) else {
//            return nil
//        }
//        guard let cgImage = context.makeImage() else {
//            return nil
//        }
//        let image = UIImage(cgImage: cgImage, scale: 1, orientation:.right)
//        CVPixelBufferUnlockBaseAddress(pixelBuffer, .readOnly)
//        return image
//    }
//}
//
//extension CaptureManager: AVCaptureVideoDataOutputSampleBufferDelegate {
//    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
//        guard let outputImage = getImageFromSampleBuffer(sampleBuffer: sampleBuffer) else {
//            return
//        }
//        delegate?.processCapturedImage(image: outputImage)
//    }
//}
