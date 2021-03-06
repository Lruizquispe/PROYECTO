<?php
require_once('../DAL/DBAccess.php');
require_once('../BOL/Matricula.php');

class MatriculaDAO
{
	private $pdo;

	public function __CONSTRUCT()
	{
			$dba = new DBAccess();
			$this->pdo = $dba->get_connection();
	}

	public function Registrar(Matricula $Ma)
	{
		try
		{
		$statement = $this->pdo->prepare("CALL registrar_matriculas(?,?,?,?,?,?,?,?,?,?,?,?,?)");
   		$statement->bindParam(1,$Ma->__GET('CodPersona'));
		$statement->bindParam(2,$Ma->__GET('FecMatricula'));
		$statement->bindParam(3,$Ma->__GET('RepGrado'));
		$statement->bindParam(4,$Ma->__GET('ConMatricula'));
		$statement->bindParam(5,$Ma->__GET('SitMatricula'));
		$statement->bindParam(6,$Ma->__GET('TipProcedencia'));
		$statement->bindParam(7,$Ma->__GET('Observaciones'));
		$statement->bindParam(8,$Ma->__GET('CodEstudiante'));
		$statement->bindParam(9,$Ma->__GET('CodMatricula'));
		$statement->bindParam(10,$Ma->__GET('EstMatricula'));
		$statement->bindParam(11,$Ma->__GET('DesIE'));
		$statement->bindParam(12,$Ma->__GET('CodSecciones'));
		$statement->bindParam(13,$Ma->__GET('CodGrados'));
	    $statement -> execute();

		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Listar(Persona $persona)
	{
		try
		{
			$result = array();

			$statement = $this->pdo->prepare("call up_buscar_persona(?)");
			$statement->bindParam(1,$persona->__GET('dni'));
			$statement->execute();

			foreach($statement->fetchAll(PDO::FETCH_OBJ) as $r)
			{
				$per = new Persona();

				$per->__SET('id', $r->idpersona);
				$per->__SET('nombres', $r->nombres);
				$per->__SET('apellidos', $r->apellidos);
				$per->__SET('dni', $r->dni);

				$result[] = $per;
			}

			return $result;
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}
}

?>
