using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unique.EcommGroceryStore.Core.Interfaces
{
    public interface ICustomInterface<T>
    {
        T Get(int id);
        T Get(string value);
        IEnumerable<T> GetList(int id);
        T Delete(int id);
        T Add(T model);
        void Update();
    }
}
