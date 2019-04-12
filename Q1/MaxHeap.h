#include <iostream>
#include <vector>
#include <cstdlib>
#include <math.h>
#include <utility>

class MaxHeap{
public:
MaxHeap();
MaxHeap(std::vector<int> input);
MaxHeap(const MaxHeap &temp);
int Max();
int getHeight();
int Parent(int i);
int RightChild(int i);
int LeftChild(int i);
void show();
void add(int value);
void Delete();
int top();
bool empty();
void Heapsort();
void max_heapify(size_t index);
int operator[](size_t i);
std::vector<int> data;
};