package Negocio;

import java.util.ArrayList;

import Dominio.Notas;

public interface NotasNegocio {
	public ArrayList<Notas> readNotas(int id_curso);
	public boolean insert(ArrayList<Notas> listaNotas);
}
