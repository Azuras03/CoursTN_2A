#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>     // offsetof

#define SIZETABLE 50000000
#define UNEVALEURQUELCONQUE 1234567890

void getrusageStart(void);
void getrusageStop(void);

typedef struct {
  int	unInt;
  short	unShort;
  short	unShort2;
} tableElement;

// volatile pour éviter que le compilateur n'élimine les accès mémoire
static volatile tableElement t[SIZETABLE];

static void printTableInfo(void) {
    const size_t szElem   = sizeof(tableElement);
    const size_t offInt   = offsetof(tableElement, unInt);
    const size_t offShort = offsetof(tableElement, unShort);
    const size_t offShort2= offsetof(tableElement, unShort2);

    printf("Taille d'un element (sizeof tableElement) = %zu octets\n", szElem);
    printf("Offset t[0].unInt    = %2zu (sizeof = %zu)\n", offInt,   sizeof(((tableElement*)0)->unInt));
    printf("Offset t[0].unShort  = %2zu (sizeof = %zu)\n", offShort, sizeof(((tableElement*)0)->unShort));
    printf("Offset t[0].unShort2 = %2zu (sizeof = %zu)\n", offShort2,sizeof(((tableElement*)0)->unShort2));

}

int main(void) {
    printTableInfo();
    getrusageStart();

    for (size_t i = 0; i < SIZETABLE; i++) {
        t[i].unInt = UNEVALEURQUELCONQUE;
        (void)t[i].unInt; // lecture pour forcer la matérialisation
    }

    getrusageStop();
    return 0;
}


