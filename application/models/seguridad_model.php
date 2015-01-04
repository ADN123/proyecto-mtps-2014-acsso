<?php
class Seguridad_model extends CI_Model {
    
    //constructor de la clase
    function __construct() {
        //LLamar al constructor del Modelo
        parent::__construct();
    }
    
    function consultar_seccion_usuario($nr=0)
    {
        
        $sentencia="SELECT id_empleado FROM sir_empleado WHERE nr like '".$nr."'";
        $query=$this->db->query($sentencia);
        
        $datos=(array)$query->row();
                
        $sentencia="SELECT
            sir_empleado_informacion_laboral.id_empleado_informacion_laboral,
            sir_empleado_informacion_laboral.id_empleado,
            sir_empleado_informacion_laboral.id_seccion,
            sir_empleado_informacion_laboral.fecha_inicio
            FROM sir_empleado_informacion_laboral
            WHERE sir_empleado_informacion_laboral.id_empleado=".$datos['id_empleado']."
            GROUP BY sir_empleado_informacion_laboral.id_empleado_informacion_laboral
            HAVING sir_empleado_informacion_laboral.fecha_inicio >= ALL(SELECT
                    sir_empleado_informacion_laboral.fecha_inicio
                    FROM sir_empleado_informacion_laboral
                    WHERE sir_empleado_informacion_laboral.id_empleado=".$datos['id_empleado']."
                    GROUP BY sir_empleado_informacion_laboral.id_empleado,sir_empleado_informacion_laboral.fecha_inicio) 
        ";
        $query=$this->db->query($sentencia);
        
        if($query->num_rows>0) {
            return (array)$query->row();
        }
        else {
            return array(
                'id_nivel_1' => 0
            );
        }
    }
    
    function consultar_usuario($login,$clave)
    {   
        $sentencia="SELECT 
                    org_usuario.id_usuario, 
                    org_usuario.usuario, 
                    org_usuario.nombre_completo, 
                    org_usuario.NR , 
                    org_usuario.id_seccion, 
                    org_usuario.sexo
                    FROM org_usuario
                    INNER JOIN org_usuario_rol ON org_usuario_rol.id_usuario = org_usuario.id_usuario
                    INNER JOIN org_rol ON org_rol.id_rol = org_usuario_rol.id_rol
                    INNER JOIN org_rol_modulo_permiso ON org_rol_modulo_permiso.id_rol = org_rol.id_rol
                    INNER JOIN org_modulo ON org_rol_modulo_permiso.id_modulo = org_modulo.id_modulo
                    WHERE org_usuario.usuario='$login' AND org_usuario.password=MD5('$clave') AND org_usuario.estado=1 AND org_modulo.id_sistema=7
                    LIMIT 0,1";
        $query=$this->db->query($sentencia);
    
        if($query->num_rows>0) {
            return (array)$query->row();
        }
        else {
            return array(
                'id_usuario' => 0
            );
        }
    }
    public function sexoUsuario($id_usuario='')
    {
            $sentencia="SELECT
                        CASE 1
                    WHEN sexo = 'F' THEN
                        'Bienvenida'
                    WHEN sexo = 'M' THEN
                        'Bienvenido'
                    ELSE
                        'Bienvenido/a'
                    END AS msj
                    FROM
                        org_usuario
                    WHERE
                        id_usuario =".$id_usuario;
            $query=$this->db->query($sentencia);
            return (array)$query->result_array();
    }
        
    function buscar_menus($id)
    {
        $sentencia="SELECT DISTINCT
                    m2.orden AS orden_padre,
                    m2.id_modulo AS id_padre,
                    m2.nombre_modulo AS nombre_padre,
                    
                    org_modulo.id_modulo,
                    org_modulo.orden,
                    org_modulo.nombre_modulo,
                    org_modulo.descripcion_modulo,
                    org_modulo.dependencia,
                    org_modulo.url_modulo,
                    org_modulo.img_modulo
                    FROM org_rol
                    INNER JOIN org_usuario_rol ON org_rol.id_rol = org_usuario_rol.id_rol
                    INNER JOIN org_rol_modulo_permiso ON org_rol_modulo_permiso.id_rol = org_rol.id_rol
                    INNER JOIN org_modulo ON org_modulo.id_modulo = org_rol_modulo_permiso.id_modulo
                    LEFT JOIN org_modulo AS m2 ON m2.id_modulo = org_modulo.dependencia
                    WHERE org_usuario_rol.id_usuario=".$id." AND org_modulo.id_sistema=7 AND org_rol_modulo_permiso.estado=1
                    ORDER BY m2.id_modulo, org_modulo.orden";
        $query=$this->db->query($sentencia);
        
        $result=(array)$query->result_array();
        
        $new_menu=array();
        foreach($result as $r) {
            if(!in_array($r[id_padre], $new_menu)){
                $new_menu[$r[id_padre]]=array(
                    "orden_padre"=>$r[orden_padre],
                    "id_padre"=>$r[id_padre],
                    "nombre_padre"=>$r[nombre_padre],
                    "id_modulo"=>$this->buscar_submenus($r[id_padre],$result,"id_modulo"),
                    "orden"=>$this->buscar_submenus($r[id_padre],$result,"orden"),
                    "nombre_modulo"=>$this->buscar_submenus($r[id_padre],$result,"nombre_modulo"),
                    "descripcion_modulo"=>$this->buscar_submenus($r[id_padre],$result,"descripcion_modulo"),
                    "dependencia"=>$this->buscar_submenus($r[id_padre],$result,"dependencia"),
                    "url_modulo"=>$this->buscar_submenus($r[id_padre],$result,"url_modulo"),
                    "img_modulo"=>$this->buscar_submenus($r[id_padre],$result,"img_modulo")
                );
            }           
        }
        
        if($query->num_rows>0) {
            return $result;
        }
        else {
            return 0;
        }
    }   
    
    function buscar_submenus($id_modulo,$result,$campo) 
    {
        $valores='';
        foreach($result as $r) {
            if($r[dependencia]==$id_modulo) {
                if($r[$campo]!="" && $r[$campo]!=NULL)
                    $valores.=$r[$campo].',';
            }
        }
        return substr($valores, 0, -1);
    }
    
    function consultar_permiso($id_usuario,$id_modulo)
    {
        $sentencia="SELECT
                    org_rol_modulo_permiso.id_permiso
                    FROM
                    org_usuario_rol
                    INNER JOIN org_rol_modulo_permiso ON org_usuario_rol.id_rol = org_rol_modulo_permiso.id_rol
                    WHERE org_usuario_rol.id_usuario=".$id_usuario." AND org_rol_modulo_permiso.id_modulo=".$id_modulo."";
        $query=$this->db->query($sentencia);
            
        if($query->num_rows>0) {
            return (array)$query->row();
        }
        else {
            return array(
                'id_usuario' => 0
            );
        }
    }
    
    function descripcion_menu($id_modulo) 
    {
        $sentencia="SELECT padre.id_modulo AS id_modulo_padre, padre.img_modulo AS img_modulo_padre, padre.nombre_modulo AS nombre_modulo_padre, org_modulo.url_modulo AS url_modulo_padre, org_modulo.id_modulo, org_modulo.nombre_modulo, org_modulo.url_modulo, org_modulo.img_modulo, org_modulo.descripcion_modulo
                    FROM org_modulo
                    LEFT JOIN org_modulo AS padre ON padre.id_modulo = org_modulo.dependencia
                    WHERE org_modulo.id_modulo=".$id_modulo."";
        $query=$this->db->query($sentencia);
        return (array)$query->row();
    }
    
    function info_empleado($id_empleado=NULL, $select="*", $id_usuario=NULL, $usuario="")
    {
        $where="";
        if($id_empleado!=NULL)
            $where.=" AND id_empleado=".$id_empleado;
        if($id_usuario!=NULL)
            $where.=" AND id_usuario=".$id_usuario;
        if($id_usuario!=NULL)
            $where.=" AND usuario LIKE '".$usuario."'";
        $sentencia="SELECT ".$select." FROM tcm_empleado WHERE TRUE ".$where;
        $query=$this->db->query($sentencia);
        return (array)$query->row();
    }
	
	function guardar_caso($formuInfo)
	{
		extract($formuInfo);
        $sentencia="INSERT INTO sac_caso
                    (id_usuario, fecha_caso, nuevo_pass, codigo_caso) 
                    VALUES 
                    ($id_usuario, '$fecha_caso', '$nuevo_pass', '$codigo_caso')";
        $this->db->query($sentencia);
	}
	
	function buscar_caso($codigo_caso)
	{
		$sentencia="SELECT
                    id_usuario, nuevo_pass
                    FROM sac_caso
                    WHERE estado_caso=1 AND DATEDIFF(CURDATE(),fecha_caso)<=3 AND codigo_caso LIKE '".$codigo_caso."'";
        $query=$this->db->query($sentencia);
		$caso=(array)$query->row();
		if($query->num_rows>0) {
			$sentencia="UPDATE sac_caso SET estado_caso=0 WHERE codigo_caso LIKE '".$codigo_caso."'";
			$this->db->query($sentencia);
		}
	}
}
?>