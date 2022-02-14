#!/usr/bin/env python3
import sys
from flask import Flask, render_template

# This check and everything above must remain compatible with Python 2.7.
if sys.version_info[0] < 3:
    sys.stderr.write("""
==========================
Unsupported Python version
==========================
This script requires Python 3, but you're trying to
install it on Python 2.
""")
    sys.exit(1)


app = Flask(__name__)

@app.route("/")
def main():
   return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)