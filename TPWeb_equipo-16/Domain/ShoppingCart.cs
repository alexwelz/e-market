
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
                    Total += itemList[i].Amount * itemList[i].item.Price;
                    TotalProducts++;                      
                    exist = true;                 
                }
            }

            if (exist==false)
            {
                AuxItem aux = new AuxItem();
                aux.item = item;
                aux.Amount++;
                TotalProducts++;
                Total += item.Price;
                itemList.Add(aux);
            }
                   
                       

        }

        /*
        public void RemoveItemFromCart(Item item)
        {
            for (int i = 0; i < itemList.Count()-1;  i++)
            {
                if (itemList[i].itemCode == item.ItemCode)
                {
                    if (itemList[i].Amount > 1)
                    {
                        // Si hay más de un ítem en el ItemList, disminuye la cantidad                     
                        itemList[i].DeletedItem.Add(item);
                        itemList[i].AddedItem.RemoveAt(itemList[i].AddedItem.Count - 1);
                        itemList[i].Amount--;
                    }
                    else
                    {
                        // Si solo hay uno, elimina completamente el ItemList
                        itemList.RemoveAt(i);

                    }

                    // Rompe el bucle ya que hemos encontrado y manejado el artículo.
                    break;
                }
            }

            reloadCartPropertys();
        }
        public void ClearCart()
        {
            itemList.Clear();
        }
        public void reloadCartPropertys()
        {
            TotalProducts = GetTotalItemCount();
            Total = GetTotalPrice();
        }

        public int GetTotalItemCount()
        {
            // Suma la cantidad de todos los ítems en el carrito
            return itemList.Sum(item => item.Amount);
        }

        public decimal GetTotalPrice()
        {
            // Calcula el precio total de todos los ítems en el carrito
            decimal totalPrice = itemList.Sum(item => item.AddedItem.Sum(other => other.Price));


            return totalPrice;
        }

        */
    }
}