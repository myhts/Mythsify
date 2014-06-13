import csv
from collections import Counter
from collections import OrderedDict
from collections import defaultdict
#my changes
from numpy import zeros
from scipy.linalg import svd
from math import log
from numpy import asarray, sum


datareader = csv.reader(open('C:/Users/Aseem.Pareek/Desktop/hackathon/Export_Jan2014/Export.csv','rb'))
header = datareader.next() #skip the first line

from_counter = Counter()
subject_counter = Counter()
#unique word counter excluding the stopwords
word_counter = Counter()
wdict = {}
dcount = 0 

#grouping by conversation


exclusion_list = ['ragreport@sungard.com','NextGenSupport@sungard.com','sias.sta.auto.notification@sungard.com','AutoEsc@sungard.com',
'GSC.IT.Communications','SunGard, Internal Announcements','Communications, GSC','GSC, HR.Communications','payroll, GSC.in',
'Fradin, Russ - Announcements','GSC, India Referral','Abhyankar, Shailendra','GSC, Travel.Reimbursement','George, Sandhya',
'ADMIN.Communications, GSC','GSC, Infosec','Pillay, Praful','NextGenSupportUSQA@sungard.com','Appraisal, GSC']

exclusion_list_subject = ['CLIENTPROD RAG Report - RAG Status : AMBER','CLIENTPROD RAG Report - RAG Status : RED']
#stopwords and the ignore chars
stopwords = ['','.','i','cc','2014','sent','subject','a', 'about', 'above', 'above', 'across', 'after', 'afterwards', 'again', 'against', 'all', 'almost', 'alone', 'along', 'already', 'also','although','always','am','among', 'amongst', 'amoungst', 'amount',  'an', 'and', 'another', 'any','anyhow','anyone','anything','anyway', 'anywhere', 'are', 'around', 'as',  'at', 'back','be','became', 'because','become','becomes', 'becoming', 'been', 'before', 'beforehand', 'behind', 'being', 'below', 'beside', 'besides', 'between', 'beyond', 'bill', 'both', 'bottom','but', 'by', 'call', 'can', 'cannot', 'cant', 'co', 'con', 'could', 'couldnt', 'cry', 'de', 'describe', 'detail', 'do', 'done', 'down', 'due', 'during', 'each', 'eg', 'eight', 'either', 'eleven','else', 'elsewhere', 'empty', 'enough', 'etc', 'even', 'ever', 'every', 'everyone', 'everything', 'everywhere', 'except', 'few', 'fifteen', 'fify', 'fill', 'find', 'fire', 'first', 'five', 'for', 'former', 'formerly', 'forty', 'found', 'four', 'from', 'front', 'full', 'further', 'get', 'give', 'go', 'had', 'has', 'hasnt', 'have', 'he', 'hence', 'her', 'here', 'hereafter', 'hereby', 'herein', 'hereupon', 'hers', 'herself', 'him', 'himself', 'his', 'how', 'however', 'hundred', 'ie', 'if', 'in', 'inc', 'indeed', 'interest', 'into', 'is', 'it', 'its', 'itself', 'keep', 'last', 'latter', 'latterly', 'least', 'less', 'ltd', 'made', 'many', 'may', 'me', 'meanwhile', 'might', 'mill', 'mine', 'more', 'moreover', 'most', 'mostly', 'move', 'much', 'must', 'my', 'myself', 'name', 'namely', 'neither', 'never', 'nevertheless', 'next', 'nine', 'no', 'nobody', 'none', 'noone', 'nor', 'not', 'nothing', 'now', 'nowhere', 'of', 'off', 'often', 'on', 'once', 'one', 'only', 'onto', 'or', 'other', 'others', 'otherwise', 'our', 'ours', 'ourselves', 'out', 'over', 'own','part', 'per', 'perhaps', 'please', 'put', 'rather', 're', 'same', 'see', 'seem', 'seemed', 'seeming', 'seems', 'serious', 'several', 'she', 'should', 'show', 'side', 'since', 'sincere', 'six', 'sixty', 'so', 'some', 'somehow', 'someone', 'something', 'sometime', 'sometimes', 'somewhere', 'still', 'such', 'system', 'take', 'ten', 'than', 'that', 'the', 'their', 'them', 'themselves', 'then', 'thence', 'there', 'thereafter', 'thereby', 'therefore', 'therein', 'thereupon', 'these', 'they', 'thickv', 'thin', 'third', 'this', 'those', 'though', 'three', 'through', 'throughout', 'thru', 'thus', 'to', 'together', 'too', 'top', 'toward', 'towards', 'twelve', 'twenty', 'two', 'un', 'under', 'until', 'up', 'upon', 'us', 'very', 'via', 'was', 'we', 'well', 'were', 'what', 'whatever', 'when', 'whence', 'whenever', 'where', 'whereafter', 'whereas', 'whereby', 'wherein', 'whereupon', 'wherever', 'whether', 'which', 'while', 'whither', 'who', 'whoever', 'whole', 'whom', 'whose', 'why', 'will', 'with', 'within', 'without', 'would', 'yet', 'you', 'your', 'yours', 'yourself', 'yourselves', 'the']
ignorechars = ''',:'!''''$''-''*''('')'

sum_mails = 0
for data in datareader:
    from_person = str(data[5])
    subject = str(data[0])
    body = str(data[2])
    conversation = str(data[11])
    sum_mails += 1
    if from_person not in exclusion_list:
        from_counter[from_person] += 1
        subject_counter[subject] += 1
    #processing of finding the unique words in the body
    words = subject.split();
    #print subject
    #print words
    for w in words:
        w = w.lower().translate(None, ignorechars)
        if w in stopwords or w in exclusion_list:
            continue
        elif w in wdict:
            #print "inside "+w
            wdict[w].append(dcount)
            word_counter[w] += 1
        else:
            #print "outside "+w
            wdict[w] = [dcount]            
            word_counter[w] += 1
    dcount += 1     
    #processing and building the count matrix
    keys = [k for k in wdict.keys() if len(wdict[k]) > 1]
    keys.sort()
    A = zeros([len(keys), dcount])
    for i, k in enumerate(keys):
        for d in wdict[k]:
            A[i,d] += 1    

#matching important list elements

#print from_counter
#print subject_counter
#for k, v in subject_counter.items():
#    print k
print sum_mails

#print from_counter
#print word_counter
#print wdict
#print keys
#print A