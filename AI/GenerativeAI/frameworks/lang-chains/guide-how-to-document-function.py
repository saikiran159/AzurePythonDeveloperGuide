"""
Let's learn how to document functions in python.

This is very important because we want our LLM models to figure out which function to call based on the chat context

a better documented function always makes sure the right function invoked by LLM model
"""

# Lets explore different ways we create function

# function with no default parameters
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

# function with optional values
from typing import Optional
def calculate_emi(cost:int,interest:float,months:Optional[int] = 3,discount:Optional[int]=0) -> float:
    """
    Calculates EMI that needs to be paid monthly

    Args:
        cost (int): total cost of the product
        interest (float): interest in percentage
        months (int,optional): Total number of months the EMI has to be paid. By default this is 3 months.
        discount (int,optional): discount applied to the cost in amount. by default this is 0 meaning no discount.
    
    Returns:
        float: EMI that needs to be paid per month
    
    Examples:
        >>> calculate(100000,3.5)
        34500.0
    """

    cost_of_product = cost - discount
    cost_after_interest = cost_of_product + (cost_of_product * (interest/100))
    return round(cost_after_interest / months,0)

# A function that returns None
from typing import Union
def submit_data(method:str,url:str,headers:dict,payload:Union[dict,str]) -> None:
    """
    submits data to a database

    Args:
        method (str): type of RESTAPI Request. example POST, GET, UPDATE etc.
        url (str): remote url of the database
        headers (dict): headers of the request
        payload (dict | str): data that needs to be saved to the database
    
    Returns:
        None
    
    Examples: 
        >>> submit_data("POST","https://domainname.in/db/lake/update",{"content-type":"json"},"hi my name is mikey, i want to find out why my orca portal is not wotking")
    """
    return None

# A Function with no arguments
def get_UTC_time() -> str:
    """
    get current time in UTC format

    Args:
        None
    
    Returns:
        str: Returns time in UTC format
    """
    return "09-02-2025 10:06:43"