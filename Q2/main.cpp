#include "Vec.h"

int main(){
    /*
    Vec a1{3};
    a1.arr[0] = 0;
    a1.arr[1] = 1;
    a1.arr[2] = 2;
    */
    int a[6]{0,1,2,3,4,5};
    //Vec a2{a,4};
    //a2.show();
    /*
    a2.push_back(4);
    a2.push_back(5);
    a2.push_back(6);
    a2.push_back(7);
    a2.show();
    */
    Vec test{a,6};
    Vec test1{test};
    //Vec test1{std::move(test)};
    /*
    test1.pop_back();
    std::cout << test*test1 << std::endl;
    if(test>test1)
        std::cout<<"bozorgtar"<<std::endl;
        */
    //test.showSize();
    /*
    std::cout<<test.p_index<< " " << test.showSize() << std::endl; 
    test.push_back(1);
    test.pop_back();
    test.pop_back();
    test.pop_back();
    test.push_back(8);
    */

    //std::cout << a2.showSize() << std::endl;
    return 0;
}
