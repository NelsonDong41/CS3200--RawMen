from flask import Blueprint, request, jsonify, make_response
import json
from src import db

CriticHome = Blueprint('CriticHome', __name__)

@CriticHome.route('/', methods=["GET"])
def get_all ():
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT Critic.critic_id as label, Critic.critic_id as value \
    FROM Critic')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#display the first and last name of the critic with id <critic_id>.
@CriticHome.route('/<critic_id>/name', methods=["GET"])
def get_name(critic_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT Critic.first_name, Critic.last_name \
    FROM Critic \
    WHERE Critic.critic_id = {critic_id}')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# gets the publication company under which this reviewer has written the most reviews
@CriticHome.route('/<critic_id>/company', methods=["GET"])
def get_company(critic_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT publication_company \
                    FROM (SELECT publication_company, MAX(n) \
                            FROM (SELECT publication_company, COUNT(Critique.critique_id) as n \
                                    FROM Critic JOIN Critique ON (Critic.critic_id = Critique.critic_id) \
                                    WHERE Critic.critic_id = {critic_id} \
                                    GROUP BY publication_company))')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# gets all past reviews
@CriticHome.route('/<critic_id>/past_reviews', methods=["GET"])
def get_past_reviews(critic_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT Critique.publication_company, Critique.ramen_id, Product.name, Critique.review \
    FROM Critic \
    JOIN Critique ON (Critic.critic_id = Critique.critic_id) \
    JOIN Product on (Critique.ramen_id = Product.ramen_id) \
    WHERE Critic.critic_id = {critic_id}')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# gets the highest reviews this critic has given
@CriticHome.route('/<critic_id>/highest_reviews', methods=["GET"])
def get_highest_reviews(critic_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT Critique.ramen_id, Critique.rating, Critique.ramen_id, Product.name \
    FROM Critic \
    JOIN Critique ON (Critic.critic_id = Critique.critic_id) \
    JOIN Product on (Product.ramen_id = Critique.ramen_id) \
    WHERE Critic.critic_id = {critic_id} \
    ORDER BY Critique.rating DESC')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
