# Import the dependencies.
import numpy as np
import pandas as pd
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify


#################################################
# Database Setup
#################################################

engine = create_engine("sqlite:///Resources/hawaii.sqlite")

# reflect an existing database into a new model
base = automap_base()
# reflect the tables
base.prepare(engine, reflect=True)

# Save references to each table
measurement = base.classes.measurement 
station = base.classes.station

# Create our session (link) from Python to the DB

session = Session(engine)

#################################################
# Flask Setup
#################################################

app = Flask(__name__)

#################################################
# Flask Routes
#################################################


@app.route("/")
def home():

    print("Server requested climate app home page...")   
    return(
        f"Welcome to the Hawaii_Climate_App API!<br/>"
        f"Available Routes:<br/>"
        f"/api/v1.0/precipitation:</br/>"
        f"/api/v1.0/stations:</br/>"
        f"/api/v1.0/tobs:</br/>"
        f"/api/v1.0/<start>:</br/>"  
        f"/api/v1.0/<start>/<end>:</br/>"
        f"/Specified start date or end data (YYYY-MM-DD), calculates the TMIN/TAVG/TMAX temperature for all dates greater than and equal to the start date<br/>"
        f"/api/v1.0/start/end<br/>"
        f"/Specified start and the end date (YYYY-MM-DD), calculate the TMIN/TAVG/TMAX temperature for dates between the start and end date inclusive<br/>"
        )
#Return a JSON list of the minimum temperature, the average temperature, and the maximum temperature for a specified start or start-end range.
#For a specified start, calculate `TMIN`, `TAVG`, and `TMAX` for all the dates greater than or equal to the start date.
#For a specified start date and end date, calculate `TMIN`, `TAVG`, and `TMAX` for the dates from the start date to the end date, inclusive.

####################################################
@app.route("/api/v1.0/stations")
def stations():
    
    stations = session.query(measurement.stations,func.count(measurement.id)).group_by(measurement.stations).order_by(func.count(measurement.id).desc()).all()
    stations = pd.read_sql(stations.statement, stations.session.bind)
    return jsonify(stations.to_dict())
###################################################

@app.route("/api/v1.0/<Date>")
def startDateOnly(date):
    temp_reading = session.query(func.min(measurement.tobs), func.avg(measurement.tobs), func.max(measurement.tobs)).filter(measurement.date >= date).all()
    
    return jsonify(temp_reading)


if __name__ == "__main__":
    app.run(debug=True)