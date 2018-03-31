#include <stdio.h>
#include <string.h>
#include <stdlib.h>
struct node {
   char * data;
   int key;
   struct node *next;
};

struct node *head = NULL;
struct node *current = NULL;
int count = 0;
void printList() {
   struct node *ptr = head;
  
   //start from the beginning
   while(ptr != NULL) {
      printf("Token %d    >  %s\n", ptr->key, ptr->data);
      ptr = ptr->next;
   }
}

//insert link at the first location
void insertFirst(int key, char * data) {

   char * value = malloc(strlen(data) + 1);
   strcpy(value, data);
   //create a link
   struct node * link = (struct node*) malloc(sizeof(struct node));
	
   link->key = key;
   link->data = value;
	
   //point it to old first node
   link->next =  head;
	
   //point first to new first node
   head = link;
   count++;
}

//delete first item
struct node* deleteFirst() {

   //save reference to first link
   struct node *tempLink = head;
	
   //mark next to first link as first 
   head = head->next;
   count--;
   //return the deleted link
   return tempLink;
}

int length() {
   return count;
}

//find a link with given key
struct node* find(int key) {

   //start from the first link
   struct node* current = head;

   //if list is empty
   if(head == NULL) {
      return NULL;
   }

   //navigate through list
   while(current->key != key) {
	
      //if it is last node
      if(current->next == NULL) {
         return NULL;
      } else {
         //go to next link
         current = current->next;
      }
   }      
	
   //if data found, return the current Link
   return current;
}

//delete a link with given key
struct node* delete(int key) {

   //start from the first link
   struct node* current = head;
   struct node* previous = NULL;
	
   //if list is empty
   if(head == NULL) {
      return NULL;
   }

   //navigate through list
   while(current->key != key) {

      //if it is last node
      if(current->next == NULL) {
         return NULL;
      } else {
         //store reference to current link
         previous = current;
         //move to next link
         current = current->next;
      }
   }

   //found a match, update the link
   if(current == head) {
      //change first to point to next link
      head = head->next;
   } else {
      //bypass the current link
      previous->next = current->next;
   }    
	
   return current;
}

void reverse(struct node** head_ref) {
   struct node* prev   = NULL;
   struct node* current = *head_ref;
   struct node* next;
	
   while (current != NULL) {
      next  = current->next;
      current->next = prev;   
      prev = current;
      current = next;
   }
	
   *head_ref = prev;
}
