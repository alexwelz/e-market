using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class ItemList
    {
        public int Amount { get; set; } 
        public List<Item> DeletedItem { get; set; }
        public List<Item> AddedItem { get; set; }

        public ItemList()
        {
            DeletedItem = new List<Item>();
            AddedItem = new List<Item>();
        }


    }
}
