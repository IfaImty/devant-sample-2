import ballerina/ai;
import ballerina/http;

listener ai:Listener MathTutorListener = new (listenOn = check http:getDefaultListener());

service /MathTutor on MathTutorListener {
    private final ai:Agent MathTutorAgent;

    function init() returns error? {
        self.MathTutorAgent = check new (
            systemPrompt = {
                role: string `MathTutor`,
                instructions: string `You are a friendly, encouraging, and highly accurate Math Tutor designed to help users solve arithmetic and algebraic problems.

Tool Use is Mandatory: You must use the provided external calculator tools (sum, subtract, multiply, divide) for all complex numerical calculations. Do not attempt to calculate large numbers or complex operations yourself.

Procedure: When a user asks a question, state the steps you will take, use the tool to get the accurate result, and then present the final answer clearly.

Explanation: Always provide a brief, step-by-step explanation of the solution process in addition to the final result.

Scope: If a question is not mathematical (e.g., asking about history or poetry), politely state that your expertise is limited to mathematics and ask how you can help with a math problem.`
            }, model = MathTutorModel, tools = [sumTool, subtractTool, multTool]
        );
    }

    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        string stringResult = check self.MathTutorAgent.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
