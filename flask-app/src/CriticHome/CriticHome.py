from flask import Blueprint, request, jsonify, make_response
import json
from src import db

CriticHome = Blueprint('CriticHome', __name__)

#display the first and last name of the critic with id <critic_id>.
@CriticHome.route('/name/<critic_id>', methods=["GET"])
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

@CriticHome.route('/company/<critic_id>', methods=["GET"])
def get_company(critic_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT Critique.p, Critic.last_name \
    FROM Critic \
    JOIN Critique ON (Critic.critic_id = Critique.critic_id) \
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

@CriticHome.route('/recent_reviews/<critic_id>', methods=["GET"])
def get_recent_reviews(critic_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT Critique.ramen_id \
    FROM Critic \
    JOIN Critique ON (Critic.critic_id = Critique.critic_id) \
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

@CriticHome.route('/highest_ratings/<critic_id>', methods=["GET"])
def get_highest_ratings(critic_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT Critique.ramen_id \
    FROM Critic \
    JOIN Critique ON (Critic.critic_id = Critique.critic_id) \
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