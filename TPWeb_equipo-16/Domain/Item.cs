using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Item
    {
        public int Id { get; set; }
        public string ItemCode { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Brand Brand { get; set; }
        public Category Category { get; set; }
        public decimal Price { get; set; }
        public List <UrlImage> Images { get; set; }
        public int ID() { return Id; }


        public Item()
        {
            Brand = new Brand();
            Category = new Category();
        }
        public Item(string artCode, string name, string description, Brand brand, Category category, decimal price)
        {
            Brand = new Brand();
            Category = new Category();
            ItemCode = ItemCode;
            Name = name;
            Description = description;
            Brand = brand;
            Category = category;
            Price = price;
            Images = new List <UrlImage>();

        }

    }
    
}
