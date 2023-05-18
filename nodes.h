#ifndef NODES_H
#define NODES_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Node Types
typedef enum { TYPE_IDENTIFIER, TYPE_NUMBER, TYPE_INSTRUCTION, TYPE_LABEL } NodeType;

// Node structure
typedef struct Node {
  NodeType type;
  char* value;
  struct Node* next;
} Node;

Node* createNode(NodeType type, char* value);
Node* addNode(Node* root, Node* newNode);
void printTree(Node* root, int depth);

#endif /* NODES_H */

