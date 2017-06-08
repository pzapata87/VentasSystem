using Core.Singleton;
using Ventas.Business.Interfaces;
using Ventas.Data;
using Ventas.Entity;

namespace Ventas.Business
{
    public class UsuarioBL : Singleton<UsuarioBL>, IUsuarioBL
    {
        public Usuario GetByUsername(string username)
        {
            return UsuarioRepository.GetInstance().GetByUsername(username);
        }
    }
}