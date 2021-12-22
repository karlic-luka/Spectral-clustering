# Multiclass spectral clustering
### K. Grozdanić, M. Jelašić, L. Karlić

![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)

Naša implementacija problema multiklasnog spektralnog klasteriranja, MATLAB.

## Features

- Računanje matrice težina za problem 2d točaka ili slika
- Algoritami: n-cut i DACA
- Prikaz završnih klustera



> Just because you can do something, doesn’t mean 
> it’s a good use of anyone’s time. We humans fall 
> in love with what we have poured effort into… 
> even if it is a pile of poisonous rubbish.

## Instalacija

Za korištenje OKLab color space-a potrebno je pokrenuti:

Matlab:
```sh
installGPT
```
Octave:
```sh
addpath(strjoin(strcat(['/Users/ajx/Repos/gptoolbox/'],{'external','imageprocessing', 'images', 'matrix', 'mesh', 'mex', 'quat','utility','wrappers'}),':'))
```
Pogledati: https://github.com/alecjacobson/gptoolbox



## Pokretanje
#### 2d primjeri:
```sh
primjer
```

#### primjeri slika
```sh
primjer_slike
```



## Funkcije i pozivi

### multiclass spectral clustering
- ***NC*** - n-cut clustering algoritam
    -  W (*matrica*) - težinska matrica W
    -  k (*int*) - broj clustera
    ***output***: (*matrica*) X - matrica particije
- ***DACA*** - DACA algoritam
    -  W (*matrica*) - težinska matrica W
    -  k (*int*) - broj clustera
    -  knn (*int*) - broj najbližih susjeda u konstrukciji W*
    ***output***: (*matrica*) X - matrica particije
- ***Iter*** - iterativni postupak u rješavanju danog problema
    - ***output***: (*matrica*) X - matrica particije



### funkcije za računanje težinske matrice W
- ***BrightnessDist*** - računa W za danu sliku, uzima u obzir i udaljenost i razliku u boji
    - image (*matrica*) - slika proizvoljne dimenzije
    - sigmaf (*double*) - skalirajući faktor za razliku boja
    - sigmax (*double*) - skalirajući faktor za razliku boja
    - radius (*int*) - radijus u konstrukciji matrice W
    - improvement (*0 ili 1*) - 0 - rgb, 1 - oklab color space
    ***output***: (*matrica*) W - težinska matrica
- ***Dist*** - računa W za 2d točke
    - A (*matrica*) - matrica 2d točaka
    - sigma (*double*) - skalirajući faktor sigma
    ***output***: (*matrica*) W - težinska matrica
- ***ImageDist*** - računa W za danu sliku, uzima u obzir samo razliku u boji
    - image (*matrica*) - slika proizvoljne dimenzije
    - sigma (*double*) - skalirajući faktor za razliku boja
    - radius (*int*) - radijus u konstrukciji matrice W
    - improvement (*0, 1, 2*) - 0 - rgb, 1 - oklab color space, 2 - grayspace
    ***output***: (*matrica*) W - težinska matrica


    
### pomoćne funkcije
- ***Draw*** - grafički prikaz 2d clusteriranja
    - X (*matrica*) - matrica particije
    - A (*matrica*) - početna matrica 2d točaka
    - s (*string*) - naslov grafa
- ***DrawImg*** - grafički prikaz clusteriranja slika
    - X (*matrica*) - matrica particije
    - A (*matrica*) - početna matrica slike
    - s (*string*) - naslov grafa
- ***GenerateX*** - generira 2d primjera za buduće clusteriranje
    - m (*int*) - broj točaka u clusteru
    - k (*int*) - broj clustera
    - rk, ck (*int*) - broj redaka / stupaca clustera
    - r1, r2 (*double*) - radijusi krugova točaka
    ***output***: (*matrica*) A - matrica točaka u ravnini
- ***GetW_z*** - generira matricu susjedstva W'
    - W (*matrica*) - težinska matrica W
    - k (*int*) - broj susjeda
    ***output***: (*matrica*) W' - matrica susjedstva W'



## License
MIT
