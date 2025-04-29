/*
 Author: Armando Fernandez   
 Date: 04/08/2025
 Learning Solidity Smart Contract Development.

Description: 
    This smart contract will update the message.
    The workflow is as follows: message => update message => view message.
    If noone ever updates the message, its value lives on the blockchain forever.
    One key thing, to note is when viewing the message by calling viewMessage function, 
    the message is copied into memory (specified in the return type), which is cheaper (less gas fee)
    and returns the value to the requestor. 
*/

pragma solidity ^0.8.20;

contract SignInSheet {
    string message;

    constructor() {
        message = "This is the very first message, deployed on this smart contract!";
    }

    function viewMessage() public view returns(string memory) {
        return message;
    }

    function updateMessage(string memory newMessage) public {
        message = newMessage;
    }
}


/*
DEV NOTES:
1. Solidity Syntax and Structure
    How smart contracts are structured:

    pragma statement

    contract keyword

    Variables, functions, constructors

    Semicolons are required at the end of statements (just like C#).

2. Variables and Data Storage
    Difference between storage and memory:

    storage = permanent blockchain storage (e.g., message)

    memory = temporary, function-call lifespan storage (e.g., newMessage parameter)

    How function parameters use memory to pass values cheaply and safely.

3. Functions
    Proper function definitions:

    Correct order of keywords: public view returns (string memory)

    Parentheses () are always needed after function names.

    Getter functions vs. direct public variable access:

    Solidity automatically creates a getter for public variables.

4. Strings and String Handling
    No string interpolation in Solidity (unlike C#).

    Use abi.encodePacked() + string() to concatenate strings.

    Memory cost awareness: String operations are more expensive than primitive types (like uint).

5. Contract Deployment and Initialization
    Constructor behavior:

    Runs once, during deployment.

    Used to set up initial states (e.g., setting the starting message).

    State variables default to empty if not initialized explicitly.

6. Gas Efficiency Principles
    You have a basic understanding that:

    Writing to storage costs gas (expensive).

    Reading from storage in view functions is free (when called externally).

    Using memory saves gas for temporary data.

7. Code Corrections and Debugging
    Fixing logical and syntax errors:

    Correct use of semicolons.

    Fixing wrong function signatures.

    Correct placement of visibility (public) and mutability (view) modifiers.

    Understanding function behavior flow:

    Where data moves between memory and storage during reads and updates.

8. Solidity Thinking Mindset
    Blockchain mental model:

    Understanding that permanent changes must be explicit.

    Realizing functions can read from storage but must copy for returns.

    Comparisons to C#:

    memory is like byVal parameter passing.

    Solidity variables act like a mix of C# class fields (storage) and method-local variables (memory).
*/