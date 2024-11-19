Please answer the following questions about your work:

0 - What language did you program in?
+ **Ruby**

1 - Have you manually tested the SDK?
+ **Yes**, I manually tested the SDK to ensure the API calls work as expected and that the error handling is functioning properly

2 - Did you add a test suite? If so, how will we use it? If not, why?
+ **Yes**, I added a comprehensive test suite using RSpec. To use it, you can run **bundle exec rspec** from the root of the project. The tests cover standard API interactions, edge cases, and error scenarios to ensure the SDK’s reliability.

3 - Did you use any 3rd party library? Why did you use it? What are the tradeoffs?
**Yes**, I used several 3rd party libraries:
+ **Faraday**: This is for making HTTP requests as it provides a flexible and well-supported interface for API interactions.
+ **Faraday-retry**: This is for implementing **automatic retries** on network failures, which improves resilience but may delay responses if retries are triggered.
+ **Dotenv**: For managing environment variables securely, making it easy to handle API keys and sensitive information.
+ **Yard**: For SDK documentation.

+ **Tradeoffs**: Using these libraries adds dependencies to the project, which can increase the complexity of managing updates and compatibility. However, they greatly simplify networking, error handling, and configuration.

4 - Do you feel this SDK makes it easier to interact with the API?
+ Yes, the SDK abstracts the complexity of API requests and error handling, providing a simplified and consistent interface for developers. It also supports features like pagination and filtering in an intuitive way.

5 - If you had more time, what else would you add? <br>
I would add:
+ More comprehensive **caching** to reduce API calls and improve performance.
+ Additional **logging** levels and customizable logging output for better debugging and monitoring.
+ Support for **more endpoints** of the API and features like webhook event handling if the API supports it.
+ Discuss with the Product team about **some API**s that **work incorrectly** and prioritize them in the backlog tasks.
+ Adding my solution in **Java** and **Node.js** to make it accessible to a broader range of developers rather than only using Ruby. Besides Ruby, I am also proficient in Java and Node.js.
+ Figure out the company infrastructure to implement CI/CD for the PROD deployment.

6 - What would you change in your current SDK solution? <br>
I would refactor and optimize parts of the SDK to improve maintainability, such as:
+ Abstracting configuration management further to make it easier to extend.
+ Simplifying the error-handling logic to be more efficient and robust.
+ Improving documentation with more detailed usage examples and edge case scenarios.

7 - On a scale of 1 to 10 (10 being the highest), how would you rate this solution?
+ I would rate this solution an 8. The SDK is well-structured and covers core features, but there is room for enhancement, especially in areas like caching, rate limiting, and advanced logging.

8 - Anything else we should keep in mind when we evaluate the project? <br>
Key Points to Consider:
+ The SDK emphasizes ease of use and provides a robust error-handling mechanism.
+ I made an effort to handle common and edge cases comprehensively in the test suite.
+ The solution is designed with extensibility in mind, making it relatively easy to add more endpoints or features in the future.
+ While the SDK is designed for production, it could benefit from further optimization and enhancements if more time were available.
