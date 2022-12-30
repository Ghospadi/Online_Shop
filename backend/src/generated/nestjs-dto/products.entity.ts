
import {OrderItems} from './orderItems.entity'
import {Categories} from './categories.entity'
import {Reviews} from './reviews.entity'


export class Products {
  id: number ;
name: string ;
description: string ;
price: number  | null;
image: string  | null;
stock: number  | null;
category_id: number ;
order_items?: OrderItems[] ;
categories?: Categories ;
reviews?: Reviews[] ;
}
