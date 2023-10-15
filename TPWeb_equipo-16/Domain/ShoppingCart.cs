
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class ShoppingCart
    {
        public int TotalProducts { get; set; }

        public decimal Total { get; set; }
        public List<AuxItem> itemList { get; set; }

        public ShoppingCart()
        {
            itemList = new List<AuxItem>();
            Total = 0;
            TotalProducts = 0;

        }
        public void AddItemToCart(Item item)
        {
            bool exist = false;

            for (int i = 0; i < itemList.Count(); i++)
            {
                if (itemList[i].item.Id == item.Id)
                {
                    itemList[i].Amount++;
                    itemList[i].SubTotal = itemList[i].item.Price * itemList[i].Amount;
                    exist = true;
                }
            }

            if (exist == false)
            {
                AuxItem aux = new AuxItem();
                aux.item = item;
                aux.Amount++;
                aux.SubTotal = item.Price;
                itemList.Add(aux);
            }

            Total = itemList.Sum(aux => aux.Amount * aux.item.Price);
            TotalProducts = itemList.Sum(aux => aux.Amount);
        }

    }


}