libx86ASM
X86 ASM Library

Introduction
libx86ASM is a comprehensive library designed to facilitate x86 Assembly programming. The library includes a variety of functions and utilities implemented in both C and Assembly to help developers perform complex tasks efficiently.

Features
Paranthesinator: Validates the correct usage and placement of parentheses in a given string.
Quick Sort: Implements the Quick Sort algorithm.
Binary Search: Performs a binary search on a sorted array.
Depth-First Search (DFS): Implements DFS for graph traversal.
Installation
To use libx86ASM, clone the repository and follow the instructions below:

git clone https://github.com/prusu01/libx86ASM.git
cd libx86ASM
make
Usage
Paranthesinator
Validates parentheses in a string:

; Example usage in Assembly
call check_parantheses
Quick Sort
Sorts an array using the Quick Sort algorithm:

void quick_sort(int32_t *buff, uint32_t start, uint32_t end);
Binary Search
Performs a binary search on a sorted array:

int32_t __attribute__((fastcall)) binary_search(int32_t *buff, uint32_t needle, uint32_t start, uint32_t end);
Depth-First Search (DFS)
Traverses a graph using DFS:

; Example usage in Assembly
call dfs
Contributing
We welcome contributions! Please follow these steps to contribute:

Fork the repository.
Create a new branch.
Make your changes.
Submit a pull request.
License
This project is licensed under the MIT License.

Contact
For any inquiries, please contact prusu01.

You can review and modify the above content to better suit your project's needs. Let me know if there are any specific sections you would like to add or change.
