
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
        public List<ItemList> itemList { get; set; }

        public ShoppingCart()
        {
            itemList = new List<ItemList>();
            Total = 0;
            TotalProducts = 0;

        }
        public void AddItemToCart(Item item)
        {

            bool exist = false;
            if (itemList != null)
            {
                for (int i = 0; i < itemList.Count() - 1; i++)
                {
                    if (itemList[i].itemCode == item.ItemCode)
                    {
                        if (itemList[i].Amount > 1)
                        {
                           
                            itemList[i].AddedItem.Add(item);
                            itemList[i].Amount++;
                            exist = true;
                        }

                    }
                }
                if (!exist)
                {
                    ItemList newList = new ItemList();


                    newList.itemCode = item.ItemCode;

                    newList.AddedItem.Add(item);
                    itemList.Add(newList);
                }


                reloadCartPropertys();
            }

        }
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
    }
}