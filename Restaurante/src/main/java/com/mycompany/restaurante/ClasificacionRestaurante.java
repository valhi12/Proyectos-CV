package com.mycompany.restaurante;

import java.util.*;

public class ClasificacionRestaurante {

    public static void main(String[] args) {
        
        

        Restaurante r = new Restaurante();
        Scanner sc = new Scanner(System.in);

        System.out.println("Se hace reserva (true/false)?: ");
        r.setHacerReservas(sc.nextBoolean());
        System.out.println("Hay comida vegetaliana (true/false)?: ");
        r.setComidaVegetanaria(sc.nextBoolean());
        System.out.println("Numero de plazas: ");
        r.setNumeroPlazas(sc.nextInt());
        System.out.println("Numero de empleado: ");
        r.setNumeroEmpleados(sc.nextInt());

        if (r.isHacerReservas() && r.isComidaVegetanaria() && r.getNumeroPlazas() >= 100) {
            r.setNumeroEstrellas(4);
        } else {
            if (r.getNumeroPlazas() >= 50 && r.getNumeroPlazas() <= 100 && (r.isComidaVegetanaria() || r.isHacerReservas())) {
                r.setNumeroEstrellas(3);
            } else {
                if (r.getNumeroPlazas() < 50 && r.isHacerReservas()) {
                    r.setNumeroEstrellas(2);
                } else {
                    r.setNumeroEstrellas(1);
                }
            }
        }
        r.setNumeroEstrellas(r.getNumeroEstrellas() + r.getRatioEmpleadosPlaza());

        if (r.getNumeroEstrellas() > 5) {
            r.setNumeroEstrellas(5);
        }

        System.out.println("El restaurante tiene una valoracion de " + r.getNumeroEstrellas() + " estrellas");
    }

    /*if (r.isHacerReservas() && r.isComidaVegetanaria() && r.getNumeroPlazas() >= 100) {
            r.setNumeroEstrellas(4);
        } else if (r.getNumeroPlazas() >= 500 && r.getNumeroPlazas() <= 100 && (r.isComidaVegetanaria() || r.isHacerReservas())){
            r.setNumeroEstrellas(3);
        } else if (r.getNumeroPlazas() < 50 && r.isHacerReservas()) {
             r.setNumeroEstrellas(2);
        } else {
            r.setNumeroEstrellas(1);
        }
    }*/
}
