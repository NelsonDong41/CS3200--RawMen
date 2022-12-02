from flask import Blueprint, request, jsonify, make_response
import json
from src import db

CriticCreateReview = Blueprint('CriticCreateReview', __name__)