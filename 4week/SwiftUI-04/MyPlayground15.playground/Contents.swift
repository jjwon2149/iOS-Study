import Foundation


let connectionOK = true
let connectionSpeed = 30.00
let fileFound = true

enum FileTransferError: Error, LocalizedError {
    case noConnection
    case lowBandwidth
    case fileNotFound
    
    var errorDescription: String?{
        switch self {
        case .noConnection:
            return NSLocalizedString("noConnection", comment: "No Connection")
        case .lowBandwidth:
            return NSLocalizedString("lowBandwidth", comment: "")
        case .fileNotFound:
            return NSLocalizedString("fileNotFound", comment: "")

        }
    }
}

func fileTransfer() throws {
    
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
    //do Something
}

func sendFile() -> String {
    
    do{
        try fileTransfer()
    } catch FileTransferError.noConnection, FileTransferError.lowBandwidth {
        return "No Connection"
    } catch FileTransferError.fileNotFound {
        return "File Not Found"
    } catch let error {
        return "Unknown Error \(error.localizedDescription)"
    }
    
    return "Successful transfer"
    
}

sendFile()
