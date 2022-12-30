
import {Orders} from './orders.entity'
import {Products} from './products.entity'


export class OrderItems {
  id: number ;
order_id: number ;
product_id: number ;
quantity: number  | null;
price: number  | null;
orders?: Orders ;
products?: Products ;
}
