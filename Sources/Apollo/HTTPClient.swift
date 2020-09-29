import Foundation

/// A client for fetching data given an HTTP URLRequest
public protocol HTTPClient {
  /// A completion block returning a result. On `.success` it will contain a tuple with non-nil `Data` and its corresponding `HTTPURLResponse`. On `.failure` it will contain an error.
  typealias Completion = (Result<(Data, HTTPURLResponse), Error>) -> Void

  /// The main method to perform a request.
  ///
  /// - Parameters:
  ///   - request: The request to perform.
  ///   - completion: A completion handler to call when the task has either completed successfully or failed.
  ///
  /// - Returns: A Cancellable representing the request.
  @discardableResult
  func sendRequest(_ request: URLRequest,
                   completion: @escaping Completion) -> Cancellable

  /// Cleans up and invalidates everything related to this HTTP client.
  func invalidate()
}
