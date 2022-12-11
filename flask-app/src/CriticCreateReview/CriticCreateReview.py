from flask import Blueprint, request, jsonify, make_response
import json
from src import db

CriticCreateReview = Blueprint('CriticCreateReview', __name__)

@CriticCreateReview.route('/')
def test_work():
    return ('<h1> hello there </h1>')


@CriticCreateReview.route('/numReviews/<critic_id>')
def num_reviews(critic_id):
    cursor = db.get_db().cursor()
    cursor.execute(f'SELECT critique_id \
    FROM Critique c \
    WHERE c.critic_id = {critic_id} \
    ORDER BY c.critique_id DESC \
    LIMIT 1')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@CriticCreateReview.route('/form', methods=['POST'])
def add_review():
    critique_id = int(request.form['critique_id']) + 1
    ramen_id = request.form['ramen_id']
    rating = request.form['rating']
    critic_id = request.form['critic_id']
    publication_company = request.form['publication_company']
    review = request.form['review']
    cursor = db.get_db().cursor()
    cursor.execute(f'INSERT INTO Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) VALUES ({critique_id}, {rating}, "{review}", "{publication_company}", {critic_id}, {ramen_id})')
    cursor.connection.commit()
    return "successfully posted"

@CriticCreateReview.route('/noCritiques', methods=['POST'])
def no_crit():
    ramen_id = request.form['ramen_id']
    rating = request.form['rating']
    critic_id = request.form['critic_id']
    publication_company = request.form['publication_company']
    review = request.form['review']
    cursor = db.get_db().cursor()
    cursor.execute(f'INSERT INTO Critique (critique_id, rating, review, publication_company, critic_id, ramen_id) VALUES (1, {rating}, "{review}", "{publication_company}", {critic_id}, {ramen_id})')
    cursor.connection.commit()
    return "posted successfully"

