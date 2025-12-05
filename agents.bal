import ballerina/ai;

# Define a function
@ai:AgentTool
@display {label: "", iconPath: ""}
isolated function sumTool(int num1, int num2) returns int {
    int result = sum(num1, num2);
    return result;
}

# Define a function
@ai:AgentTool
@display {label: "", iconPath: ""}
isolated function subtractTool(int num1, int num2) returns int {
    int result = subtract(num1, num2);
    return result;
}

# Define a function
@ai:AgentTool
@display {label: "", iconPath: ""}
isolated function multTool(int num1, int num2) returns int {
    int result = multiply(num1, num2);
    return result;
}
