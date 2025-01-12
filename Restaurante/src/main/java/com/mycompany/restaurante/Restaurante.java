package com.mycompany.restaurante;

public class Restaurante {

    int numeroEstrellas, numeroPlazas, numeroEmpleados;
    boolean hacerReservas, comidaVegetanaria;

    public int getNumeroEstrellas() {
        return numeroEstrellas;
    }

    public int getNumeroPlazas() {
        return numeroPlazas;
    }

    public int getNumeroEmpleados() {
        return numeroEmpleados;
    }

    public int getRatioEmpleadosPlaza() {
        return numeroEmpleados / numeroPlazas;
    }

    public boolean isHacerReservas() {
        return hacerReservas;
    }

    public boolean isComidaVegetanaria() {
        return comidaVegetanaria;
    }

    public void setNumeroEstrellas(int numeroEstrellas) {
        this.numeroEstrellas = numeroEstrellas;
    }

    public void setNumeroPlazas(int numeroPlazas) {
        this.numeroPlazas = numeroPlazas;
    }

    public void setNumeroEmpleados(int numeroEmpleados) {
        this.numeroEmpleados = numeroEmpleados;
    }

    public void setHacerReservas(boolean hacerReservas) {
        this.hacerReservas = hacerReservas;
    }

    public void setComidaVegetanaria(boolean comidaVegetanaria) {
        this.comidaVegetanaria = comidaVegetanaria;
    }

}
