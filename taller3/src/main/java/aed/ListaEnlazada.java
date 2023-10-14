package aed;

import java.util.*;

public class ListaEnlazada<T> implements Secuencia<T> {
    // Completar atributos privados
    private Nodo primero;
    private class Nodo {
        Nodo siguiente;
        T data;
        Nodo(T d) { data = d;}

    }

    //métodos hechos por mi
    private Nodo ultimoNodo(){
        Nodo nodoActual = primero;
        while (nodoActual.siguiente != null){
            nodoActual = nodoActual.siguiente;
        }
        return nodoActual;
    }

    private Nodo siguienteNodo(){
        Nodo nodoActual = primero;

        nodoActual = nodoActual.siguiente;

        return nodoActual;
    }

    private Nodo obtenerNodo(int i) {
        Nodo nodoActual = primero;
        int j;
        j = 0;

        while(j != i){
            nodoActual = siguienteNodo();
            j += 1;
        }

        return nodoActual;
    }
    //fin métodos hechos por mi


    public ListaEnlazada() {
        primero = null;
    }

    public int longitud() {
        int res;
        res = 0;
        Nodo nodoActual = primero;

        while(nodoActual != null){
            res += 1;
            nodoActual = nodoActual.siguiente;
        }

        return res;
    }

    public void agregarAdelante(T elem) {
        Nodo insertar = new Nodo(elem);

        insertar.siguiente = primero;
        primero = insertar;

    }

    public void agregarAtras(T elem) {
        Nodo insertar = new Nodo(elem);

        if (primero == null){
            primero = insertar;
            return;
        }

        Nodo ultimo = ultimoNodo();
        ultimo.siguiente = insertar;
    }

    public T obtener(int i) {
        Nodo nodoActual = primero;
        int j;
        j = 0;

        while(j != i){
            nodoActual = siguienteNodo();
            j += 1;
        }

        return nodoActual.data;
    }

    public void eliminar(int indice) {
        Nodo nodo = primero;

        if(indice == 0){
            nodo = nodo.siguiente;
        } else {
            Nodo antes = obtenerNodo(indice - 1);
            Nodo objetivo = antes.siguiente;
            antes.siguiente = objetivo.siguiente;
        }
    }

    public void modificarPosicion(int indice, T elem) {
        Nodo nodo = primero;
        int j = 0;
        while(j != indice){
            nodo = nodo.siguiente;
            j += 1;
        }

        nodo.data = elem;
    }

    public ListaEnlazada<T> copiar() {
        throw new UnsupportedOperationException("No implementada aun");
    }

    public ListaEnlazada(ListaEnlazada<T> lista) {
        throw new UnsupportedOperationException("No implementada aun");
    }
    
    @Override
    public String toString() {
        throw new UnsupportedOperationException("No implementada aun");
    }

    private class ListaIterador implements Iterador<T> {
    	int iterador;

        public boolean haySiguiente() {
	        throw new UnsupportedOperationException("No implementada aun");
        }
        
        public boolean hayAnterior() {
	        throw new UnsupportedOperationException("No implementada aun");
        }

        public T siguiente() {
	        throw new UnsupportedOperationException("No implementada aun");
        }
        

        public T anterior() {
	        throw new UnsupportedOperationException("No implementada aun");
        }
    }

    public Iterador<T> iterador() {
        throw new UnsupportedOperationException("No implementada aun");
    }

}
