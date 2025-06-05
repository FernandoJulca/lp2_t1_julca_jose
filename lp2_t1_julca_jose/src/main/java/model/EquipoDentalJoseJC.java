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

import org.hibernate.annotations.DynamicInsert;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Table(name = "tbl_equipo_dental")
@Getter
@Setter
@DynamicInsert
@NoArgsConstructor
@AllArgsConstructor
public class EquipoDentalJoseJC {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "nro_equipo")
	private int nroEquipo;
	
	@Column(name = "nombre", nullable = false)
	private String nombre;
	
	@Column(name = "costo", nullable = false)
	private double costo;
	
	@Column(name = "fecha_adquisicion", columnDefinition = "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP")
	private LocalDate fecAdquisicion;
	
	@Column(name = "estado", nullable = false)
	private String estado;
	
	@ManyToOne
	@JoinColumn(name = "id_dentista", nullable = false)
	private DentistaJoseJC idDentista;
}
