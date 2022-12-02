from flask import Blueprint, request, jsonify, make_response
import json
from src import db

brands = Blueprint('brands', __name__)

# Brand's Dashboard

#Total Profits and Average Ratings
@brands.route('/brandsTop<id>', methods=['GET'])
def get_total_avg(id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT * \
    FROM Invoice i\
    JOIN InvoiceLine i1 on i.invoice_id = i1.invoice_id \
    JOIN Product p on i1.ramen_id = p.ramen_id \
    WHERE p.brand_id = {id}')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#top 3 highest selling
@brands.route('/brandsSelling<id>', methods=['GET'])
def get_bottom_selling(id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT p.name \
    FROM Invoice i\
    JOIN InvoiceLine i1 on i.invoice_id = i1.invoice_id \
    JOIN Product p on i1.ramen_id = p.ramen_id \
    WHERE p.brand_id = {id} \
    ORDER BY i1.quantity \
    LIMIT 3')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#top 3 popular locations
@brands.route('/brandsLocation<id>', methods=['GET'])
def get_bottom_location(id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT i.order_country \
    FROM Invoice i\
    JOIN InvoiceLine i1 on i.invoice_id = i1.invoice_id \
    JOIN Product p on i1.ramen_id = p.ramen_id \
    WHERE p.brand_id = {id} \
    ORDER BY i1.quantity \
    LIMIT 3')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#top 3 best rated
@brands.route('/brandsRating<id>', methods=['GET'])
def get_bottom_rating(id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT p.name \
    FROM Invoice i\
    JOIN InvoiceLine i1 on i.invoice_id = i1.invoice_id \
    JOIN Product p on i1.ramen_id = p.ramen_id \
    WHERE p.brand_id = {id} \
    ORDER BY i1.quantity \
    LIMIT 3')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#top 3 best rated
@brands.route('/', methods=['GET'])
def get_brands():
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT * FROM Competes')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


