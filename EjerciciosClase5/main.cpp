#include <functional>
#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>

using namespace std;


int main(){
  int x = 1;
  bool found = false;
  // while(!found){
  // [](int a){
  //   if(a%2==0){
  //     cout << a;
  //     return true;
  //   }}(x);
  //   if(x==100)
  //     found=true;
  //   x++;
  // }
  // cout << endl;

  vector<int> mults;
  vector<int> digits;
  int number = 2;
  int numDig = 0;

  // Sacar su multiplicaciones
  while (x!=5){
    [&](){
      mults.push_back(number*pow(2,x));
      cout << number*pow(2,x) << endl;
      x++;
    }();
  }





  [&](int x){
    while (x) {
        digits.push_back(x%10);
        x /= 10;
        numDig++;
    }
  }(number);

}
