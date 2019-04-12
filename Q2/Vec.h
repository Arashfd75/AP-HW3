#include<iostream>

class Vec{
    public:
    Vec(size_t size);
    Vec(const Vec &temp);
    Vec(int a[],size_t sizeOfArray);
    Vec(Vec&& v);
    ~Vec();
    void pop_back();
    void push_back(int input);
    int showSize(){return size;}
    void show();
    void show(size_t index);
    int operator*(Vec v);
    bool operator<(Vec v);
    bool operator>(Vec v);
    private:
    int* arr;
    size_t size;
    size_t p_index{};
};