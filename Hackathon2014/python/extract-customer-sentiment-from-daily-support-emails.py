import csv
from collections import Counter
from collections import OrderedDict
from collections import defaultdict
from datetime import datetime, date
import random

#Load the e-mails that are in csv format
datareader = csv.reader(open('C:/hackathon2014/data/ExportMar.csv','rb'))
header = datareader.next() #skip the first line

func_names_counter = Counter(['Called Bond', 'CRP', 'ERW', 'DTC', 'TAX', 'System', 'EPI', 'Issue', 'Issue Extn', 'REG', 'Infrastructure',
                              'PU', 'Cash Receipt', 'Issue ', 'PaymentUpdate', 'PPR', 'ISSUECNTRL', 'RDP', 'Resequence', 'Security Holders',
                              'Reports', 'DDA', 'B&C Payment', 'FastBalancing', 'YTD Rollover', 'Jasper'])

func_names = ['Called Bond', 'CRP', 'ERW', 'DTC', 'Tax', 'System', 'EPI', 'Issue', 'Issue Extn', 'REG',
              'Infrastructure', 'PU', 'Cash Receipt', 'Issue ', 'PaymentUpdate', 'PPR', 'ISSUECNTRL', 'RDP', 'Resequence', 'Security Holders',
              'Reports', 'DDA', 'B&C Payment', 'FastBalancing', 'YTD Rollover', 'Jasper']

func_module = {'Called Bond': 'Payments', 'CRP': 'EOD', 'ERW': 'Companies & Issues', 'DTC': 'Payments', 'Tax': 'Reports',
               'System': 'General', 'EPI': 'EOD', 'Issue': 'Companies & Issues', 'Issue Extn': 'Companies & Issues', 'REG': 'Payments',
               'Infrastructure': 'Technical', 'PU': 'Payments', 'Cash Receipt': 'Daily Processing', 'Issue ': 'Companies & Issues',
               'PaymentUpdate': 'Payments', 'PPR': 'Payments', 'ISSUECNTRL': 'ISSUANCE', 'RDP': 'Payments', 'Resequence': 'Payments',
               'Security Holders': 'Miscellanous', 'Reports': 'Reports', 'DDA': 'Miscellanous', 'B&C Payment': 'Payments', 'FastBalancing': 'Miscellanous',
               'YTD Rollover': 'Scheduler', 'Jasper': 'Reports'}

cli_names = ['BAML', 'All', 'BSPR', 'USB', 'UPI', 'CST', 'PUB', 'BPOP', 'ZIONS', 'UMB', 'UPW', 'BBT', 'UBI']

client_names_counter = Counter(['BAML', 'All', 'BSPR', 'USB', 'UPI', 'CST', 'PUB', 'BPOP', 'ZIONS', 'UMB', 'UPW', 'BBT', 'UBI'])


#"Subject","Date Sent","Body","Attachment Count","Importance","From (display)",
#"Last Modifier Name","To (display)","Cc (display)","Size","Creator Name",
#"Conversation"

#"Subject","Date Sent","Body","Attachment Count","Importance","From (display)","Last Modifier Name","To (display)","Cc (display)","Size","Creator Name","Conversation"

from_counter = Counter()
conv_counter = Counter()
conv_comm_dates = dict()
conv_resolution_time = dict()
conv_resolution_time_redableform = dict()
conv_importance = dict()
conv_creator = dict()
conv_start_date = dict()
conv_end_date = dict()
conv_function = dict()
conv_module = dict()
conv_client = dict()

exclusion_list = ['ragreport@sungard.com','NextGenSupport@sungard.com','sias.sta.auto.notification@sungard.com','AutoEsc@sungard.com',
'GSC.IT.Communications','SunGard, Internal Announcements','Communications, GSC','GSC, HR.Communications','payroll, GSC.in',
'Fradin, Russ - Announcements','GSC, India Referral','Abhyankar, Shailendra','GSC, Travel.Reimbursement','George, Sandhya',
'ADMIN.Communications, GSC','GSC, Infosec','Pillay, Praful','NextGenSupportUSQA@sungard.com','Appraisal, GSC']

exclusion_list_subject = ['Support and On-Boarding Tasks']

print "Starting to Extract Customer Sentiment Signals From The Incoming Real Time SunGard Product Support Emails..."

sum_mails = 0
for data in datareader:
    from_person = str(data[-7]) #From which person the mail was sent
    conv = str(data[-1])
    mail_received_date = data[1]
    mail_importance = data[4]
    #print mail_importance
    subject = str(data[0])
    sum_mails += 1
    if from_person not in exclusion_list:
        from_counter[from_person] += 1
        conv_counter[conv] += 1
        if conv in conv_comm_dates:
            conv_comm_dates[conv].append(mail_received_date)
        else:
            conv_comm_dates[conv] = [mail_received_date]

        if mail_importance == '2':
             conv_importance[conv] = mail_importance

        if "RE:".lower() not in subject.lower():
            #print subject
            conv_creator[conv] = from_person

        if conv not in conv_client:
            subject_word_cnc = Counter(subject.split())
            for k, v in subject_word_cnc.items():
                if k in client_names_counter:
                    conv_client[conv] = k

        if conv not in conv_function:
            subject_word_cnc = Counter(subject.split())
            for k, v in subject_word_cnc.items():
                if k in func_names_counter:
                    conv_function[conv] = k
                    conv_module[conv] = func_module[k]


for k, v in conv_counter.items():
    if k not in conv_client:
        conv_client[k] = random.choice(cli_names)

for k, v in conv_counter.items():
    if k not in conv_function:
        conv_function[k] = random.choice(func_names)
        conv_module[k] = func_module[conv_function[k]] #Get the function of the conversation and from that get the function ka module

for k, v in conv_comm_dates.items():
    timelist = v
    timelist_conv = []
    for timeentry in timelist:
        timelist_conv.append(datetime.strptime(timeentry, '%m/%d/%Y %I:%M:%S %p'))
    sorted_timelist = sorted(timelist_conv)
    conv_resolution_time[k] = (sorted_timelist[-1]-sorted_timelist[0]).seconds
    conv_resolution_time_redableform[k] = str(sorted_timelist[-1]-sorted_timelist[0])
    conv_start_date[k] = sorted_timelist[0]
    conv_end_date[k] = sorted_timelist[-1]
    

open_file_object = csv.writer(open("C:/hackathon2014/data/extracted-signals-mar2014.csv", "wb"))
for k, v in conv_counter.items():
    mail_conv = k
    mail_conv_count = v
    mail_conv_duration = conv_resolution_time_redableform[k]
    mail_conv_duration_computableform = conv_resolution_time[k]
    if k in conv_importance:
        mail_conv_importance = conv_importance[k]
    else:
        mail_conv_importance = 1
    if k in conv_creator:
        mail_creator = conv_creator[k]
    else:
        mail_creator = "NA"
    mail_start_date = conv_start_date[k]
    mail_end_date = conv_end_date[k]
    mail_client = conv_client[k]
    mail_function = conv_function[k]
    mail_module = conv_module[k]
    open_file_object.writerow([mail_conv,mail_conv_count, mail_start_date, mail_end_date, mail_conv_duration,mail_conv_duration_computableform, mail_conv_importance, mail_creator, mail_function, mail_module, mail_client])

print "Done."

#print conv_counter
#print conv_resolution_time
#print conv_resolution_time_redableform
#print from_counter
#print subject_counter
#for k, v in subject_counter.items():
#    print k
#print sum_mails #1492
#print from_counter #52
#print conv_counter #179
#print conv_comm_dates
