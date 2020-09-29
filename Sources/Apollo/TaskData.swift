import Foundation

/// A wrapper for data about a particular task handled by `HTTPClient`
public class TaskData {
  
  public let completionBlock: HTTPClient.Completion
  private(set) var data: Data = Data()
  private(set) var response: HTTPURLResponse? = nil
  
  init(completionBlock: @escaping HTTPClient.Completion) {
    self.completionBlock = completionBlock
  }
  
  func append(additionalData: Data) {
    self.data.append(additionalData)
  }
  
  func responseReceived(response: URLResponse) {
    if let httpResponse = response as? HTTPURLResponse {
      self.response = httpResponse
    }
  }
}
