1. paranthesinator.asm
Function: check_parantheses
Implementation Analysis:

Purpose: To validate the correct usage and placement of parentheses in a given string.
Stack Frame Setup:
push ebp and mov ebp, esp are used to set up the stack frame.
pusha is used to save all general-purpose registers.
Register Initialization:
ebx holds the pointer to the input string.
edi is used to store the initial value of esp.
ecx is initialized to 0 to serve as the string index.
edx is used to hold the current character.
Loop for Processing Characters:
The loop iterates through each character of the string.
If a character is '(', '[', or '{', it is pushed onto the stack.
If a character is ')', ']', or '}', the corresponding opening character is popped from the stack and compared.
Mismatch Handling:
If a mismatch is found (incorrect pairing), the function resets the stack pointer and sets the return value to 1 (indicating unbalanced parentheses).
End of String Handling:
If the end of the string is reached (dl is 0), the function checks if the stack is empty.
If the stack is not empty, the function indicates unbalanced parentheses.
Function Clean Up:
Registers are restored using popa.
The stack frame is cleaned up with leave and ret.

Function: quick_sort
Implementation Analysis:

Purpose: Implements the Quick Sort algorithm.
Stack Frame Setup:
enter 0, 0 sets up the stack frame.
pusha saves all general-purpose registers.
Function Components:
quick_sort: Main function that initiates the sorting process.
partition: Helper function to partition the array around a pivot.
swap: Helper function to swap two elements in the array.
Quick Sort Logic:
The quick_sort function checks the base condition (start >= end).
Calls the partition function to get the pivot index.
Recursively sorts the subarrays before and after the pivot.
Function Clean Up:
Registers are restored using popa.
The stack frame is cleaned up with leave and ret.

Function: binary_search
Implementation Analysis:

Purpose: Performs a binary search on a sorted array.
Stack Frame Setup:
enter 0, 0 sets up the stack frame.
pusha saves all general-purpose registers.
Function Components:
binary_search: Main function to perform binary search.
Binary Search Logic:
The function compares the middle element with the target value.
Recursively searches in the left or right subarray based on the comparison.
Function Clean Up:
Registers are restored using popa.
The stack frame is cleaned up with leave and ret.

Function: dfs
Implementation Analysis:

Purpose: Implements Depth-First Search (DFS) for graph traversal.
Stack Frame Setup:
push ebp and mov ebp, esp set up the stack frame.
pusha saves all general-purpose registers.
Function Components:
dfs: Main function for DFS traversal.
DFS Logic:
Checks if the node is already visited.
Marks the node as visited.
Prints the node.
Expands the node to get its neighbors.
Recursively visits each neighbor.
Function Clean Up:
Registers are restored using popa.
The stack frame is cleaned up with leave and ret.

Functions bonus
implementation is directly from pseudocode, documented by coments in the code
sanatate!
