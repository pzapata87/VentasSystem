using Ventas.Entity;

namespace Ventas.Data.Interfaces
{
    public interface IUsuarioRepository
    {
        Usuario GetByUsername(string username);
    }
}