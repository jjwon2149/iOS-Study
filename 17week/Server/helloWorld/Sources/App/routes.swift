import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        req.logger.critical("Received request for /hello")
        // req.logger.debug("") 등과 같이 다양한 로그를 찍을 수 있음.
        return "Hello, world!"
    }
    
    app.get("greet", ":name") { req async -> String in
        guard let guest = req.parameters.get("name") else {
            return "Hi!"
        }
        return "Hi, \(guest), greetings! Thanks for visiting us."
    }
    
    app.get("student", ":name") { req async throws -> String in
        guard let studentName = req.parameters.get("name") else {
            throw Abort(.badRequest)
        }
        let studentRecords = [
            "Peter" : 3.42,
            "Thomas" : 2.98,
            "Jane" : 3.91,
            "Ryan" : 4.00,
            "Kyle" : 4.00,
        ]
        if let gpa = studentRecords[studentName] {
            return "The student \(studentName)'s GPA is \(gpa)"
        } else {
            return "The student's record can't be found!"
        }
    }
}