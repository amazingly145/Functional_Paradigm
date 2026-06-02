using namespace std;
#include <iostream>
#include <vector>

int main(){
    // Creamos nuestro vector dinamico
    vector<int> lista;
    // Hacemos un ciclo for para llenar el vector
    for (int i = 0; i < lista.size(); i++){
        lista[i] = i;
    }
    return 0;
}

