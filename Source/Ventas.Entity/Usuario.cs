namespace Ventas.Entity
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
    }

    public class Producto
    {
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int UnidadMedidaId { get; set; }
        public decimal Cantidad { get; set; }
        public decimal CantidadReserva { get; set; }
    }
}