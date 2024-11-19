# Lord of the Rings SDK (LotrSDK)

This SDK provides a simple and efficient way for developers to interact with the Lord of the Rings API, handling movies and quotes with features like filtering, pagination, and error handling.

## Features
- Access **movies** and **quotes** data from the Lord of the Rings API.
- Support for **filtering**, **pagination**, and **error handling**.
- Built-in **retry mechanism** for network reliability.
- Easy to configure using environment variables.

## Configuration
+ Make sure you have Ruby installed on your system. Follow the instructions below to install Ruby based on your operating system [here](https://www.ruby-lang.org/en/documentation/installation/)
+ Sign up your API key [here](https://the-one-api.dev/sign-up)

### Clone the Repository and installation
```bash
git clone <repository-url>
cd <repository-name>
bundle install
```

### Set Up Environment Variables
+ Rename .env.example to .env
+ Add your API key to the .env file
```bash
API_KEY=your_api_key_here
```

### Usage
```bash
# You can find all of the examples in the main/demo.rb file
ruby main/demo.rb
```

### Running Tests
```bash
bundle exec rspec
```

### Documentation
Generate and view the documentation using YARD
```bash
yard doc
yard server
```
+ Open your browser and navigate to http://localhost:8808 to view the documentation.

### Dependencies 
+ **Faraday**: HTTP client for making API requests.
+ Faraday-**retry**: Handles automatic retries for network errors.
+ **dotenv**: Manages environment variables.
+ **RSpec**: Testing framework.
+ **Yard**: Documentation generator.

### Contact
For questions or issues, please feel free to contact Dinh Nhan Vo (**Nick**) at niick7@gmail.com
