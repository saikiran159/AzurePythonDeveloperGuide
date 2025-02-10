from langchain.chat_models import init_chat_model
from langchain_core.tools import tool
from dotenv import load_dotenv

load_dotenv() # i am using groqai here. so i have created .env file with groqai endpoint key in it. which is used here as an environment variable

llm = init_chat_model("llama3-8b-8192",model_provider="groq")

@tool # tools calling in LLM models means, we are giving capability for the LLM model to choose which function it needs to call (along with parameters) based on the context
def division(numerator:int,denominator:int) -> float:
    """
    divides a number with another number and returns result

    Args:
        numerator (int): number that has to be divided
        denominator (int): number that is used to divide numerator with
    
    Raises:
        ZeroDivisionError: if denominator is 0

    Returns:
        float: the result of dividing numerator and denominator

    Examples:
        >>> division(5,2)
        2.5
        >>> division(2,2)
        1.0
        >>> division(1,0)
        ZeroDivisionError
    """
    return numerator / denominator

llm_tools = llm.bind_tools([division])
response = llm_tools.invoke("divide 9 with 2. Also divide 5012 by 12 and give me both results")
tool_calls = response.tool_calls # here we can see our function called two times. once with 9/2 and 5012/12
for each_tool in tool_calls:
    tool_id = each_tool["id"]
    tool_name = each_tool["name"]
    function_response = round(eval(tool_name).invoke(each_tool["args"]),3) # we can only invoke a tool using tool.invoke. eval("division") wont return normal function, it will return tool class in langchain. so it can only be invoked with eval("division").invoke(args)
    print(f"Tool {tool_name}:{tool_id} response is: {function_response}")
