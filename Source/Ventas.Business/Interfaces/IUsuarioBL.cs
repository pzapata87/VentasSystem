using Ventas.Entity;

namespace Ventas.Business.Interfaces
{
    public interface IUsuarioBL
    {
        Usuario GetByUsername(string username);
    }
}