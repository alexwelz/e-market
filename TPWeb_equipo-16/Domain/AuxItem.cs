using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class AuxItem
    {
        
        public Item item { get; set; }       
                                                
        public int Amount { get; set; } 

        public decimal SubTotal { get; set; }


        public AuxItem()
        {
           
            Amount = 0;
            SubTotal = 0;

          
        }


    }
}
