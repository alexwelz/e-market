using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Cart
    {
        public int TotalProducts { get; set; }

        public float Total {get; set;}
        public List<ItemList> itemList { get; set; }

        public Cart()
        {
            itemList = new List<ItemList>();  
 
        }

    }
}
