#include "nodes.h"

Node* createNode(NodeType type, char* value) {
  Node* newNode = (Node*)malloc(sizeof(Node));
  newNode->type = type;
  newNode->value = strdup(value);
  newNode->next = NULL;
  return newNode;
}

Node* addNode(Node* root, Node* newNode) {
  newNode->next = root;
  return newNode;
}

void printTree(Node* root, int depth) {
  for(int i=0; i < depth; ++i)
    printf("  ");
  if (root->type == TYPE_IDENTIFIER)
    printf("IDENTIFIER: %s\n", root->value);
  else if (root->type == TYPE_NUMBER)
    printf("NUMBER: %s\n", root->value);
  else if (root->type == TYPE_INSTRUCTION)
    printf("INSTRUCTION: %s\n", root->value);
  else if (root->type == TYPE_LABEL)
    printf("LABEL: %s\n", root->value);
  if(root->next != NULL)
    printTree(root->next, depth+1);
}

