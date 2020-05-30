#include <bits/stdc++.h>
using namespace std;
int main(){
    for (int i=0;i<13;i++){
        for (int j=0;j<13;j++){
            for (int k=0;k<13;k++){
                if ((i+3*j+9*k)%13==2&&(i+5*j+12*k)%13==5&&(i+9*j+3*k)%13==8){
                    printf("%d %d %d\n",i,j,k);
                }
            }
        }
    }
}