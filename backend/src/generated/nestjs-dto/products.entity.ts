
import {OrderItems} from './orderItems.entity'
import {Categories} from './categories.entity'
import {Reviews} from './reviews.entity'


export class Products {
  id: number ;
name: string  | null;
description: string  | null;
price: number  | null;
rating: number  | null;
image: string  | null;
stock: number  | null;
category_id: number  | null;
order_items?: OrderItems[] ;
categories?: Categories  | null;
reviews?: Reviews[] ;
}
