package model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "tbl_dentista")
@Getter
@Setter
public class DentistaJoseJC {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_dentista")
	private int idDentista;
	
	@Column(name = "cop", nullable = false)
	private String cop;
	
	@Column(name = "nombre_completo", nullable = false)
	private String nombre;
	
	@Column(name = "fecha_inicio_contrato", nullable = false)
	private LocalDate fecInicioContrato;
	
	@Column(name = "turno", nullable = false)
	private String turno;
	
	@Column(name = "correo", nullable = false)
	private String correo;
	
	@ManyToOne
	@JoinColumn(name = "id_especialidad", nullable = false)
	private EspecialidadJoseJC idEspecialidad;
	
	@Override
	public String toString() {
	    return nombre; 
	}

}
