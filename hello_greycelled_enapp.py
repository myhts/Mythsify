import pymongo
import bottle
from pymongo import MongoClient
from py2neo import neo4j
from py2neo import node, rel
from bottle import route, run, debug, template, request, get, response
from array import array
from collections import OrderedDict
import json


@bottle.route('/')
def index():
    return bottle.template('login')

@bottle.route('/login',method='POST')
##@bottle.route('/')
def index():
    username = bottle.request.forms.get("username").strip()
    print username
    response.set_cookie("account", username)
    return bottle.template('index')
##      return bottle.template('welcomeajaxversion')

#This is for welcome.html
@bottle.route('/searchrequest',method='POST')
def lookforuserpreferreddata():
    name = bottle.request.forms.get("smellbar")
    return '<b>Entered function to look for is %s </b>' %name

#This is for ajax version of the welcome html
@bottle.route('/ajax', method='POST')
def ajaxtest():
    searchtext = bottle.request.forms.get("smellbar")
    user = bottle.request.forms.get("userloggedin")
    if searchtext:
        graph_db = neo4j.GraphDatabaseService("http://localhost:7474/db/data/")
        searchtext_db = '\''+searchtext+'\''
        s = "START ee=node(*) MATCH (ee)-[:HASOPERATION]-(operations) WHERE ee.name! = %s RETURN operations" %searchtext_db
        query = neo4j.CypherQuery(graph_db, s)
        nodes_opr = query.execute()
        oprlist = []
        for node in nodes_opr:
            for val in node:
                #If u want meaningful english arrangement of functions and operations, u need to have a property in the node which says whether it is a function
                #node or a operation node. Then using that property u can construct
                #a meaningful english text by placing theem in the right place.
                oprlist.append(val['name'] + ' a ' +searchtext)

        dec_html = ''
        for element in oprlist:
            dec_html = dec_html + '<b>' + element + '</b><br>'
        
        return dec_html
        #return searchtext
    return "You didn't type anything."

@route('/searchUsername', method='GET')
def search_metadata():
    search = request.GET.get('search', '').strip()
    cookieuser = request.get_cookie("account")
    if cookieuser:
        user = cookieuser
        print user
    if search:
        graph_db = neo4j.GraphDatabaseService("http://localhost:7474/db/data/")
        searchtext_db = '\''+search+'\''
        #Changed from latest neo4j version
        s = "START ee=node(*) MATCH (ee)-[:HASOPERATION]-(operations) WHERE ee.name = %s RETURN operations" %searchtext_db
        query = neo4j.CypherQuery(graph_db, s)
        nodes_opr = query.execute()
##        for node in nodes_opr:
##            for val in node:
##                oprlist.append({"label" : val['name'],"value" : val['name']})

        connection = MongoClient("localhost",27017)
        db = connection.test
        userpatterns = db.userpatterns
        username = user.lower()
        user = userpatterns.find_one({"user": username})
        #print user
        #user is a dictionary object.
        usr_functions = user['functions']
        #print usr_functions
        func_opr_dict = dict()
        for function in usr_functions:
            operations = usr_functions[function]
            for operation in operations:
                func_opr_dict[function + 'SPLIT' + operation] = operations[operation] 
                #print operations[operation]
        #print func_opr_dict
        sorted_usropr_freq = OrderedDict(sorted(func_opr_dict.items(), key=lambda t: t[1],reverse=True))
        #print sorted_usropr_freq
        #print sorted_usropr_freq.items()
        usr_func_list = []
        usr_opr_list = []
        for element in sorted_usropr_freq.items():
            spl = element[0].split('SPLIT')
            usr_func_list.append(spl[0])
            usr_opr_list.append(spl[1])
            #print element[0]
            #print element[1]
            
        usr_func_list = set(usr_func_list)
        #print usr_func_list
        #print usr_opr_list
        #print usr_func_list
        #if 'ticket' in usr_func_list:
        #    print "Sort the operations"
        #else:
        #    print "Any order is fine"
        #print usr_opr_list

        #End of user preference module.
        oprlist = []
        for node in nodes_opr:
            for val in node:
                oprlist.append(val['name'].lower())

        usr_opr_list = []
        if search.lower() in usr_func_list:
            for element in sorted_usropr_freq.items():
                if element[0].find(search.lower()) != -1:
                    usr_opr_list.append(((element[0].split("SPLIT"))[1]).lower())

        html_order_fn_opr = []
        if usr_opr_list:
            for usr_opr in usr_opr_list:
                html_order_fn_opr.append(usr_opr+ ' a ' +search)
            for node_opr in oprlist:
                if node_opr not in usr_opr_list:
                    html_order_fn_opr.append(node_opr+ ' a ' +search)
        else:
            for node_opr in oprlist:
                html_order_fn_opr.append(node_opr+ ' a ' +search)

        dec_htmlsend = []
        for element in html_order_fn_opr:
            dec_htmlsend.append({"label" : element,"value" : element})
        
        response.content_type = 'application/json'
        return json.dumps(dec_htmlsend)
    else:
        #Get the Connection
        connection = MongoClient("localhost",27017)
        #Get the connection to the test db
        db = connection.test
        #Get a handle to the "names" collection
        coll_people = db.person
        person = coll_people.find_one()
        #print json.dumps(results:{"label" : person['name'],"value" : person['name']})
        #key shud be results and value shud be the dict.
        print {"results":{"label" : person['name'],"value" : person['name']}}
        data = {"results":{"label" : person['name'],"value" : person['name']}}
        response.content_type = 'application/json'
        return json.dumps(data)

bottle.run(host='localhost',port=8091)
