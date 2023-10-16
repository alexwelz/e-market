using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;

namespace Managers
{
    public class CartManager
    {
        public Item findItem(string itemCode, List<Item> aux)
        {
            Item item = new Item();
            foreach (Item current in aux)
            {
                if (current.ItemCode == itemCode)
                {
                    item = current;
                    break;
                }
            }
            return item;

        }

        public ShoppingCart AddItemToCart(Item item, ShoppingCart cart, int amount)
        {
            bool exist = false;

            for (int i = 0; i < cart.itemList.Count(); i++)
            {
                if (cart.itemList[i].item.Id == item.Id)
                {
                    cart.itemList[i].Amount += amount; 
                    cart.itemList[i].SubTotal = cart.itemList[i].item.Price * cart.itemList[i].Amount;
                    exist = true;
                }
            }

            if (exist == false)
            {
                AuxItem aux = new AuxItem();
                aux.item = item;
                aux.Amount += amount;
                aux.SubTotal = item.Price * aux.Amount;
                cart.itemList.Add(aux);
            }

            cart.Total = cart.itemList.Sum(aux => aux.Amount * aux.item.Price);
            cart.TotalProducts = cart.itemList.Sum(aux => aux.Amount);
            return cart;
        }
    }
}
