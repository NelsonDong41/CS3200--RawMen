from flask import Blueprint, request, jsonify, make_response
import json
from src import db

Cart = Blueprint('Cart', __name__)

# gets all past reviews
@Cart.route('/<customer_id>', methods=["GET"])
def get_cart(customer_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT * \
    FROM Cart \
    JOIN Product ON Cart.ramen_id = Product.ramen_id \
    WHERE Cart.customer_id = {customer_id}')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response