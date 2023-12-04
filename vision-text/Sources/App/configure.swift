import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // 解析命令行参数并设置端口
    let defaultPort = 16902
    let port: Int
    if let portArgument = CommandLine.arguments.first(where: { $0.starts(with: "-p") })?.split(separator: "=").last,
       let parsedPort = Int(portArgument) {
        port = parsedPort
    } else {
        port = defaultPort
    }
    // app.http.server.configuration.requestDecompression = .enabled(limit: .megabytes(10))
    // app.http.server.configuration.readTimeout = .seconds(60)  // 读取超时时间
    // app.http.server.configuration.writeTimeout = .seconds(60) // 写入超时时间  
    app.http.server.configuration.requestDecompression = .enabled(limit: .size(30_000_000)) // 10 MB
    app.http.server.configuration.port = port
    app.http.server.configuration.hostname = "0.0.0.0"

    // register routes
    try routes(app)
}
