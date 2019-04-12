#include"MaxHeap.h"

using namespace std::rel_ops;

    MaxHeap::MaxHeap(){
        data.push_back(0);
    }
    MaxHeap::MaxHeap(std::vector<int> input){
        data.push_back(0);
        data.insert(data.end(), input.begin(), input.end());
        for(int i = data.size() / 2; i > 0; --i)
            max_heapify(i);
    }
    MaxHeap::MaxHeap(const MaxHeap &temp){
        for(size_t i = 0; i < temp.data.size(); i++)
            data.push_back(temp.data[i]);
    }

    int MaxHeap::Max(){
        return data[1];
    }

    int MaxHeap::getHeight(){
        return floor(log2(data.size() - 1));
    }
    int MaxHeap::Parent(int i){
        if(i > 1)
            return data[i / 2];
        else
            return 0;
        
    }
    int MaxHeap::RightChild(int i){
        return data[(i << 2) + 1];
    }
    int MaxHeap::LeftChild(int i){
        return data[i << 2];
    }
    void MaxHeap::show(){
        for(size_t i = 1; i < data.size(); i++)
        {
            std::cout<<data[i]<<"  ";
        }
        std::cout<<std::endl;
    }
    void MaxHeap::add(int value){ // insert function for maxheap dataType
        data.push_back(value);
        int current = data.size()-1;
        while(current != 1)
        {
            if(data[current] > data[current >> 1])
            {
                std::swap(data[current], data[current >> 1]);
                current >>= 1;
            }
            else break;
        }
    }
    void MaxHeap::Delete(){
        if(data.size() == 1) return; //just zero is existed
        std::swap(data[1], data[data.size() - 1]);
        data.pop_back();
        size_t current = 1;
        while(current < data.size())
        {
            size_t largest = current;
            if((current << 1) < data.size() && data[current << 1] > data[largest])
            {
                largest = current << 1;
            }
            if((current << 1) + 1 < data.size() && data[(current << 1) + 1] > data[largest])
            {
                largest = (current << 1) + 1;
            }
            if(largest != current)
            {
                std::swap(data[current], data[largest]);
                current = largest;
            }
            else break;
        }
    }
    int MaxHeap::top(){
        return data[1];
    }
    bool MaxHeap::empty(){
        return data.size() <= 1;
    }
    void MaxHeap::Heapsort(){
        MaxHeap temp(this->data);
        while(temp.data.size() > 1)
        {
        std::cout << temp.data[1] << std::endl;
        temp.Delete();
        }
    }
    int MaxHeap::operator[](size_t i){
        if(i < data.size() - 1) 
            return data[i + 1];
        else{
            std::cout<< "out of range" << std::endl;
            return 0;
        }
    }

    void MaxHeap::max_heapify(size_t index){
        size_t largest = index;
        if((index << 1) < data.size() && data[largest] < data[index << 1])
        {
            largest = index << 1;
        }
        if((index << 1) + 1 < data.size() && data[largest] < data[(index << 1) + 1])
        {
            largest = (index << 1) + 1;
        }
        if(index != largest)
        {
            std::swap(data[index], data[largest]);
            max_heapify(largest);
        }
    }