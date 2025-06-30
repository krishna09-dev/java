# Spring Boot Demo Application

A simple Spring Boot backend service that provides a foundation for building Java web applications.

## Features

- Spring Boot 3.1.5 with Java 17
- RESTful API endpoints
- Maven build system
- Comprehensive tests
- Ready for deployment

## Endpoints

- `GET /` - Welcome message
- `GET /hello` - Hello world endpoint

## Getting Started

### Prerequisites

- Java 17 or higher
- Maven 3.6 or higher

### Running the Application

1. Clone the repository
2. Build the application:
   ```bash
   mvn clean compile
   ```

3. Run tests:
   ```bash
   mvn test
   ```

4. Start the application:
   ```bash
   mvn spring-boot:run
   ```

5. The application will start on `http://localhost:8080`

### Building for Production

To create a deployable JAR file:

```bash
mvn package
```

The executable JAR will be created in the `target/` directory as `demo-0.0.1-SNAPSHOT.jar`.

You can run it directly with:

```bash
java -jar target/demo-0.0.1-SNAPSHOT.jar
```

## Testing the API

Once the application is running, you can test the endpoints:

```bash
# Test the home endpoint
curl http://localhost:8080/

# Test the hello endpoint
curl http://localhost:8080/hello
```

## Project Structure

```
src/
├── main/
│   ├── java/com/example/demo/
│   │   ├── DemoApplication.java      # Main Spring Boot application
│   │   └── HelloController.java     # REST controller
│   └── resources/
│       └── application.properties   # Application configuration
└── test/
    └── java/com/example/demo/
        ├── DemoApplicationTests.java    # Application context test
        └── HelloControllerTest.java     # Controller unit tests
```

## Configuration

The application can be configured via `src/main/resources/application.properties`:

- `server.port=8080` - Server port (default: 8080)
- `spring.application.name=demo` - Application name

## Extending the Application

This project provides a solid foundation for building backend services. You can extend it by:

- Adding more REST controllers
- Integrating with databases (JPA/Hibernate)
- Adding security (Spring Security)
- Implementing additional business logic
- Adding more comprehensive error handling

## Technology Stack

- **Spring Boot 3.1.5** - Application framework
- **Spring Web** - REST API support
- **Maven** - Build tool and dependency management
- **JUnit 5** - Testing framework
- **Java 17** - Programming language