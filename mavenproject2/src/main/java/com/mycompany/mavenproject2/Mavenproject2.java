package com.mycompany.mavenproject2;

import java.util.*;

public class Mavenproject2 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int[] candidaturas = {63, 56, 34, 87, 90, 97, 29, 49, 78, 96,
            68, 69, 77, 89, 33, 24, 89, 77, 99, 71};

        int i;
        int opcion, peorResultado = 101;
        double suma1 = 0, suma2 = 0;
        boolean encontrado;
        int candi = 0, valor;

        do {
            System.out.println("0 – Salir");
            System.out.println("1 – Listar los resultados ambas candidaturas");
            System.out.println("2 – Calcular la media de ambas candidaturas");
            System.out.println("3 – Buscar el peor resultado de todos los tests");
            System.out.println("4 – Buscar el primer test que supere un valor dado");
            System.out.println("5 – Mostrar los resultados de una candidatura que superen un valor dado");

            System.out.print("Intruce la opcion: ");
            opcion = sc.nextInt();

            switch (opcion) {
                case 1:

                    for (i = 0; i < 10; i++) {
                        System.out.println("Candidatura 1: " + candidaturas[i]);
                    }

                    for (i = 10; i < candidaturas.length; i++) {
                        System.out.println("Candidatura 2: " + candidaturas[i]);
                    }

                    break;

                case 2:

                    for (i = 0; i < 10; i++) {
                        suma1 += candidaturas[i];
                    }

                    for (i = 10; i < candidaturas.length; i++) {
                        suma2 += candidaturas[i];
                    }

                    System.out.println("Media candidatura 1: " + suma1 / 10);
                    System.out.println("Media candidatura 2: " + suma2 / 10);

                    break;

                case 3:

                    for (i = 0; i < candidaturas.length; i++) {
                        if (candidaturas[i] < peorResultado) {
                            peorResultado = candidaturas[i];
                            if (i <= 9) {
                                candi = 1;
                            } else {
                                candi = 2;
                            }
                        }
                    }

                    break;

                case 4:
                    encontrado = false;

                    do {
                        System.out.println("Dime un numero entre 0 y 100");
                        valor = sc.nextInt();
                    } while (valor < 0 || valor > 100);

                    for (i = 0; i < candidaturas.length; i++) {
                        if (candidaturas[i] > valor) {
                            if (i <= 9) {
                                candi = 1;
                            } else {
                                candi = 2;
                            }

                            // candi = i <= 9 ? 1 : 2;
                            System.out.println("Encontrado resultado con puntuación" + candidaturas[i] + "de la candidatura" + candi);
                        }
                        encontrado = true;
                    }

                    if (!encontrado) {
                        System.out.println("Ningún resultado supera los" + valor + "puntos");
                    }

                    break;

                case 5:
                    do {
                        System.out.println("Dime la candidatura sobre la que desea hacer la consulta (1 o 2):");
                        candi = sc.nextInt();
                    } while (candi != 1 && candi != 2);

                    do {
                        System.out.println("Dime un numero entre 0 y 100");
                        valor = sc.nextInt();
                    } while (valor < 0 || valor > 100);

                    System.out.println("Resultados de la candidatura 2 que superan el valor 80:");
                    for (i = (candi == 1 ? 0 : 10); (candi == 1 && i < 10) || (candi == 2 && i < candidaturas.length); i++) {
                        if (candidaturas[i] > valor) {
                            System.out.println(candidaturas[i]);
                        }
                        
                        
                        /*(candi == 1 ? 0 : 10);
                            (candi == 1 && i < 10) || (candi == 2 && i < array.length);
                            i++   */
                    }

                    break;

                default:
                    System.out.println("Opcion incorrecta");
            }

        } while (opcion != 0);
    }
}
