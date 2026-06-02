using namespace std;
#include <iostream>
#include <vector>

int main(){
    //We create out dinamic vector
    vector<int> lista;
    vector <int> lista_final;
    //We have a for cycle to fill the vector
    int n;
    int total = 0;
    cout << "Escribe el valor mas grande de la lista" << endl;
    cin >> n;
    //We fill the list from 1 to n
    for (int i = 1; i <= n; i++){
        lista.push_back(i);
    }

    for(int i = 0; i < lista.size(); i++){
        int num = lista[i];
        int digitSum = 0;
        while (num > 0){
            digitSum += num % 10;
            num /= 10;
        }
        lista_final.push_back(digitSum);
    }

    for(int j = 0; j < lista_final.size(); j++){
        total += lista_final[j];
    }
    cout << "Resultado final: " << total;
}

