from flask import Blueprint, request, jsonify, make_response
import json
from src import db

CustomerHome = Blueprint('CustomerHome', __name__)

# Customer's Dashboard

#Favorites
@CustomerHome.route('/Dashboard/Favorites<id>', methods=['GET'])
def get_favorites(id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT p.Name, p.price \
    FROM Customer c \
    JOIN Favorites f ON c.id = f.customer_id \
    JOIN Product p ON f.ramen_id = p.ramen_id \
    WHERE c.id = {id}')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#Already Tried
@CustomerHome.route('/Dashboard/AlreadyTried<id>', methods=['GET'])
def get_tried(id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT  p.Name, p.price \
    FROM Customer c \
    JOIN AlreadyTried a ON c.id = a.customer_id \
    JOIN Product p ON a.ramen_id = p.ramen_id \
    WHERE c.id = {id}')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

