pragma solidity ^0.4.18;

/**
 * @title EvmStack
 * @author Nathanael Esayeas (github.com/nathane)
 * @dev Stack implementation written in solidity.
 */

contract EvmStack {
    
    /**
     * @dev The contract owners address
     */
    address public owner;
    
    /**
     * @dev The stack
     */
    string[] public stack;
    
    /**
     * @dev EvmStack constructor
     */
    function EvmStack() public payable{
        owner = msg.sender;
    }
    
    /**
     * @dev Removes all elements from the stack.
     * @return bool
     */
    function clear() public returns(bool success){
        require(stack.length > 0);
        delete stack;
        stack.length=0;
        return true;
    }
    
    
    /**
     * @dev Returns the top most elements in the stack, but doesn’t delete it.
     * @return string
     */
    function peek() constant public returns (string){
        require(stack.length > 0);
        return stack[stack.length-1];
    }
    
    
    /**
     * @dev Returns and deletes the top most element in the stack.
     * @return string
     */
    function pop() public returns (string) {
        require(stack.length > 0);
        string memory value = stack[stack.length-1];
        delete stack[stack.length-1];
        stack.length -=1;
        return value;
    }
    
    
    /**
     * @dev Adds an element at the top the stack.
     * @param value added to stack
     * @return bool
     */
    function push(string value) public returns(bool success){
        stack.push(value);
        return true;
    }
    
    
    /**
     * @dev Returns the number of elements in the stack.
     * @return uint
     */
    function size() constant public returns (uint) {
        return stack.length;
    }
    
    
    /**
     * @dev Returns whether the stack has any elements.
     * @return bool
     */
    function isEmpty() constant public returns (bool) {
        return stack.length == 0;
    }
    
    
    /**
     * @dev Kills the contract and returns remaining funds back to the creator
     * @return bool
     */
    function rip() public returns(bool success){
        require(msg.sender == owner);
        selfdestruct(owner);
        return true;
    }
    
    
    /**
     * @dev Fallback function
     */
    function () public payable{}
    
}