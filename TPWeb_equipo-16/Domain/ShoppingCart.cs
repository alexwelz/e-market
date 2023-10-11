
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
            // Busca la ItemList con el mismo itemCode que el del producto que deseas agregar
            var itemListContainingItem = itemList.FirstOrDefault(il => il.itemCode.Equals(item.ItemCode, StringComparison.OrdinalIgnoreCase));

            if (itemListContainingItem != null)
            {

                itemListContainingItem.AddedItem.Add(item);
                itemListContainingItem.Amount++;



            }
            else
            {
                // Si el ítem no existe en ninguna ItemList, crea una nueva ItemList con el itemCode del producto
                var newItemList = new ItemList { itemCode = item.ItemCode, Amount = 1 };

                // Agrega el producto a la lista AddedItem de la nueva ItemList
                newItemList.AddedItem.Add(item);

                // Agrega la nueva ItemList al carrito
                itemList.Add(newItemList);
            }


        }
        public void RemoveItemFromCart(Item item)
        {
            // Busca el ItemList que contiene el ítem
            var itemListContainingItem = itemList.FirstOrDefault(il => il.itemCode.Equals(item.ItemCode, StringComparison.OrdinalIgnoreCase));

            if (itemListContainingItem != null)
            {
                if (itemListContainingItem.Amount > 1)
                {
                    // Si hay más de un ítem en el ItemList, disminuye la cantidad
                    itemListContainingItem.Amount--;
                }
                else
                {
                    // Si solo hay uno, elimina completamente el ItemList
                    itemList.Remove(itemListContainingItem);
                }

                // Agrega el ítem a la lista DeletedItem del ItemList
                itemListContainingItem.DeletedItem.Add(item);

                // Remueve el ítem de la lista AddedItem del ItemList, si existe
                itemListContainingItem.AddedItem.Remove(item);
            }
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