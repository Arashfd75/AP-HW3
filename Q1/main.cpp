#include "MaxHeap.h"

int main()
{
    MaxHeap h1{};
    h1.add(25);
    h1.add(32);
    h1.add(17);
    h1.add(23);
    h1.add(101);

    std::vector<int>testVec = {23, 1, 7, 52, 11, 10, 57};
    MaxHeap h2(testVec);

    h2.Heapsort();
    std::cout << h2.LeftChild(57) << std::endl;

    MaxHeap h3{h2};
    std::cout << h3.Max() <<std::endl;
    h3.Delete();
    std::cout << h3.Max() <<std::endl;

    //std::cout << h1 << std::endl;
    
    /*
    h1.show();
    std::cout << h1.Parent(2) << std::endl;

    std::vector<int>testVec = {8,5,2,1,9,3,7,4,6,10};
    MaxHeap h(testVec);
    std::cout<<"h.show"<<std::endl;
    h.show();
    std::cout<<h.data[0]<<std::endl;
    {
        
        std::vector<int>::iterator i;
        for (i = h.data.begin(); i<h.data.end(); i++)
        std::cout << ' ' << *i;
    std::cout << '\n';
    
        for(int i = 0; i <= 10; ++i)
        {
            h.add(rand() % 100);
        }
        
        h.add(5);
        while(!h.empty())
        {
            int top = h.top(); h.Delete();
            std::cout<<top<<std::endl;

    }
        
    
    MaxHeap h1(h);
    std::cout<<"top: "<<h1.top()<<std::endl;
    std::cout<<"height : "<<h.getHeight()<<std::endl;
    std::cout<<"parent: "<<h.Parent(2)<<std::endl;
    h.Heapsort();
    h.show();
    std::cout << h[1] <<std::endl;
    std::cout << h[12] <<std::endl;
    */
    return 0;
}