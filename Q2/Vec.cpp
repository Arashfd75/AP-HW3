#include "Vec.h"

Vec::Vec(size_t size){
    std::cout << "constructor" << std::endl;
    this->size = size;
    arr = new int[size];
}


Vec::Vec(int a[], size_t sizeOfArray ):Vec(1){
    std::cout << "array constructor" << std::endl;
    for(size_t i = 0; i < sizeOfArray; i++)
    {
        this->push_back(a[i]);
    }
}

Vec::Vec(const Vec &temp){
    std::cout << "copy constructor" << std::endl;
    size = temp.size;
    p_index = temp.p_index;
    arr = new int[size];
    for(size_t i = 0; i < p_index; i++)
    {
        arr[i] = temp.arr[i];
    }
}
Vec::Vec(Vec&& v)
{
    std::cout << "move constructor" << std::endl;
    p_index = v.p_index;
    size = v.size;
    arr = v.arr;
    v.arr = nullptr;
}
Vec::~Vec(){
    std::cout << "destructor"  <<std::endl;
    delete arr;
}

void Vec::push_back(int input){
    if(p_index == size)
    {
        std::cout << "array size increase in p_index = " << p_index  << std::endl;
        int* temp = new int[size];
        for(size_t i = 0; i < size; i++)
        {
            temp[i] = arr[i];
        }
        delete arr;
        
        arr = new int[size * 2];
        for(size_t i = 0; i < size; i++)
        {
            arr[i] = temp[i];
        }
        size = size * 2;
        delete temp;
        std::cout << "new size : " << size << std::endl;
    }
    arr[p_index] = input;
    p_index++;
}

void Vec::pop_back(){
    p_index--;
    if(p_index == size / 2)
        {
        std::cout << "array size decrease in p_index = " << p_index  << std::endl;
        int* temp = new int[p_index];
        for(size_t i = 0; i < p_index; i++)
        {
            temp[i] = arr[i];
        }
        delete arr;
        size = size / 2;
        arr = new int[size];
        for(size_t i = 0; i < size; i++)
        {
            arr[i] = temp[i];
        }
        delete temp;
        std::cout << "new size : " << size << std::endl;
        }
}

void Vec::show(){
    for(size_t i = 0; i <= p_index; i++)
        std::cout << arr[i] << " " << std::endl;
}

void Vec::show(size_t index){
    if(index <= p_index)
        std::cout << arr[index] << std::endl;
    else
        std::cout << "out of range" << std::endl;
}
int Vec::operator*(Vec v){
    int result{};
    if(p_index == v.p_index)
    {
        for(size_t i = 0; i < p_index; i++)
        {
            result += arr[i] * v.arr[i];
        }
    }
    else
        std::cout << "the lenght of arrays are not equal" << std::endl;
    return result;
}


    bool Vec::operator<(Vec v){
        return p_index < v.p_index;
    }

    bool Vec::operator>(Vec v){
        return p_index > v.p_index;
    }