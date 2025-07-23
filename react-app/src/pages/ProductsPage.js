import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import Product from '../components/Product';
import '../css/products.css';

export default function ProductsPage(props) {
const [products, setProducts] = useState([]);

const fetchProducts = () => {
  axios.get('http://localhost:5247/api/products')
    .then(res => setProducts(res.data))
    .catch(err => console.error('Failed to fetch products:', err));
};

useEffect(() => {
  fetchProducts();
}, []);

// Mock data for testing purposes
// const [products, setProducts] = useState([
//     {
//         stockno: "EG334",
//         description: "Firefox Twin Turbo",
//         price: 600.00,
//         qtyinstock: 20
//     },
//     {
//         stockno: "GD500",
//         description: "Ladies Monoski",
//         price: 250.00,
//         qtyinstock: 40
//     },
//     {
//         stockno: "GD550",
//         description: "Ladies Monoski II",
//         price: 300.00,
//         qtyinstock: 40
//     },
//     {
//         stockno: "HG602",
//         description: "Life Jackets Mk4",
//         price: 35.00,
//         qtyinstock: 100
//     },
//     {
//         stockno: "SH990",
//         description: "Waterproof Shoes",
//         price: 500.00,
//         qtyinstock: 50
//     },
//     {
//         stockno: "SP120",
//         description: "Galaxy Open Topped",
//         price: 200.00,
//         qtyinstock: 3
//     },
//     {
//         stockno: "WS980",
//         description: "5mm Long Sleeved Nordic",
//         price: 350.00,
//         qtyinstock: 40
//     }
// ]);

  return (
    <div className="container">
        <h5>Number of products: {products.length}</h5>
        {products.map(product => (
            <Product key={product.stockno} {...product} />
            ))}
        {
            props.isLoggedIn ? (
                <form
                  id="orderform"
                  className="mb-5"
                  onSubmit={ async e => {
                    e.preventDefault();
                    const form = e.target;

                    // Filter out products with zero amount
                    const ordered = products.map(product => {
                      const amount = Number(form[product.stockno].value);
                      return amount > 0 ? { stockno: product.stockno, amount } : null;
                    }).filter(Boolean); 

                    if (ordered.length === 0) {
                      alert("You must select at least one product");
                      return;
                    } 

                    //try to send the order to the server
                    try {
                      const token = localStorage.getItem("token"); 

                      const res = await axios.post("http://localhost:5247/api/orders", 
                        ordered, {
                            headers: {
                            Authorization: `Bearer ${token}`
                          }
                        }
                      );
                     alert("Order placed!");
                     fetchProducts();
                     form.reset();  
                    } catch (err) {
                      console.error("Order failed", err);
                      alert("Order failed");
                    }
                  }}
                >
                  <input type="submit" value="Add to basket" className="btn btn-primary" />
                </form>
            ) : (
                <p>You need to <Link to="login">Login</Link> or <Link to="register">Register</Link> to add products to your basket.</p>
            )
        }
    </div>
  );
}
