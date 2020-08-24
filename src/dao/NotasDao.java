package dao;

import java.util.ArrayList;

import Dominio.Notas;

public interface NotasDao {
	public ArrayList<Notas> readNotas(int id_curso);
	public boolean insert(ArrayList<Notas> notas);
}
