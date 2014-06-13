data(state)
statedata = data.frame(state.x77)
str(statedata)
lmlifeexp = lm(Life.Exp ~ .,data=statedata)
str(lmlifeexp)
summary(lmlifeexp)
pred = predict(lmlifeexp)
lifeexp.sse = sum((statedata$Life.Exp - pred)^2)
lifeexp.sse
lmlifeexp1 = lm(Life.Exp ~ Population + Murder + Frost + HS.Grad,data=statedata)
summary(lmlifeexp)
summary(lmlifeexp1)
pred1 = predict(lmlifeexp1)
lifeexp.sse1 = sum((statedata$Life.Exp - pred)^2)
lifeexp.sse = sum((statedata$Life.Exp - pred1)^2)
lifeexp.sse1 = sum((statedata$Life.Exp - pred)^2)
lifeexp.sse = sum((statedata$Life.Exp - pred)^2)
lifeexp.sse1 = sum((statedata$Life.Exp - pred1)^2)
lifeexp.sse1
library(rpart)
library(rpart.plot)
tree = rpart(Life.Exp ~ .,data=statedata)
prp(tree)
predtree = predict(tree)
tree.sse = sum((statedata.LifeExp-predtree)^2)
tree.sse = sum((statedata$LifeExp-predtree)^2)
tree.sse
predtree
statedata$Life.Exp
tree.sse = sum((statedata$LifeExp-predtree)^2)
tree.sse
sum((statedata$LifeExp-predtree)^2)
(statedata$LifeExp-predtree)
(statedata$Life.Exp-predtree)
tree.sse = sum((statedata$Life.Exp-predtree)^2)
tree.sse
tree1 = rpart(Life.Exp ~ .,data=statedata,minibucket = 5)
tree1 = rpart(Life.Exp ~ .,data=statedata,control=rpart.control(minbucket=25))
prp(tree1)
tree1 = rpart(Life.Exp ~ .,data=statedata,control=rpart.control(minbucket=5))
prp(tree1)
predict(tree1)
pred1 = predict(tree1)
tree.sse2 = sum((statedata$Life.Exp-pred1)^2)
tree.sse2
tree2 = rpart(Life.Exp ~ Area,data=statedata,control=rpart.control(minbucket=1))
pred2 = predict(tree2)
tree.sse3 = sum((statedata$Life.Exp-pred2)^2)
tree.sse3
library(caret)
library(e1071)
set.seed(111)
fitControl = trainControl( method = "cv", number = 10 )
cartGrid = expand.grid( .cp = (1:50)*0.01
)
train(Life.Exp  ~ ., data = statedata, method = "rpart", trControl = fitControl, tuneGrid = cartGrid )
tree3 = rpart(Life.Exp ~ .,data=statedata,control=rpart.control(cp=0.12))
prp(tree3)
predict(tree3)
pred3=predict(tree3)
tree.sse3 = sum((statedata$Life.Exp-pred3)^2)
tree.sse3
set.seed(111)
train(Life.Exp  ~ Area, data = statedata, method = "rpart", trControl = fitControl, tuneGrid = cartGrid )
tree4 = rpart(Life.Exp ~ Area,data=statedata,control=rpart.control(cp=0.02))
prp(tree4)
pred4=predict(tree4)
tree.sse4 = sum((statedata$Life.Exp-pred4)^2)
tree.ss3
tree.sse3
tree.sse4
q()
library(Rserve); 
Rserve()
mail = read.csv("extracted-signals.csv")
mail = read.csv("extracted-signals.csv")
library(tm)
library(SnowballC
)
mail = read.csv("extracted-signals.csv")
corpus = Corpus(VectorSource(mail$Conversation))
str(mail)
mail = read.csv("extracted-signals.csv",stringsAsFactors=FALSE)
str(mail)
mail = read.csv("extracted-signals.csv",stringsAsFactors=FALSE)
str(mail)
mail$creator = as.factor(mail$creator)
mail$importance = as.factor(mail$importance)
mail$start = as.date(mail$start)
mail$start = as.Date(mail$start)
corpus = Corpus(VectorSource(mail$heading))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removePunctuation)
frequencies = DocumentTermMatrix(corpus)
findFreqTerms(frequencies, lowfreq=20)
findFreqTerms(frequencies, lowfreq=10)
mail = read.csv("extracted-signals.csv",stringsAsFactors=FALSE)
str(mail)
mail = read.csv("extracted-signals.csv",stringsAsFactors=FALSE)
str(mail)
mail$creator = as.factor(mail$creator)
mail$importance = as.factor(mail$importance)
corpus = Corpus(VectorSource(mail$thread))
corpus = tm_map(corpus, tolower)
frequencies = DocumentTermMatrix(corpus)
findFreqTerms(frequencies, lowfreq=20)
findFreqTerms(frequencies, lowfreq=2)
findFreqTerms(frequencies)
df = as.data.frame(as.matrix(frequencies))
write.csv("words.csv",df)
write.csv(df,"words.csv")
corpus = tm_map(corpus, removeWords, c("'14","!bb","points","service","views","#55","(10)...","(crp","(odbc","(so","(tng-27021)","(usbsta)","/dump","@stadbg","[jira]","<eom>","1.00172E+14","14th","15th","1628710!","168.162.171.161","195608","195611","195791","195927","2013","2014","21502","2241","27551","2941410!","2tr.018","3.0a","3.0a:","3.0b","86.39,","access","access)","activity.","add","advice","agency","all","also","and","another","any","application","area","asia","available","b&c","back","back-ups","balancing","baml","bank","bbt","been","bob","bond","boxes","bpop","branch","bspruatsta","build","build#55","build(#55)","builds","button","call","called","can","cash","categories","causing","chance","change","clearer","closing","cogencis","column","coming","console","copy","cpu","crossed","crp_log","crt","cst","custom","database","database.","date","dates","days_adv_prin_int_mail_dates","dda","deal","dec","delinquent","demo","demos?","deployment","detail","development","discuss","distribution","documentation","down?","dtc","dump","edit","enhancements","escalation","exclude","executing","existing","expectations","expense","far)","fast","feb","feeling","figure","filesystem","first","fix","for","found","frequency","from","fund","fw:","get","global","greyed","half","half.","has","have","heat","helios","help","holders","holiday","home","hot","hour","how","i'm","image","impact","improvement","in...","india.","inputs","is.","issuances","issue","issuecntrlext","issuecntrls","issues","items","items.","jan","japsersoft","jasper","jira","job","leave","ledger","license","linux","list","load","log","logs","look","lunch","machine","make","marketmap","meeting","memory","message","mode","month","monthly","muthu","need","ngconv3","ngconv3-reports","not","null","odd","off","office","office.","on-boarding","onboarding","opt","optional","oracle","out","overview","patches","payment","post","posting","ppr","pramod","probe","problemusing","processing","prod","prod/uat","prod_umb","production","profile","pub","pubsta","quarterly","question","quickly","ramesh","really","receipt","recon","recorddatefrequency/payment","refresh","refreshed","reg","registration","release","report","report.)","reporting","request","required","resolve","resources","restart","restore","reversal","run","sanity","schedule","schemas","script","scripts","second","section","security","see","sharepoint","signs","sinking","site","solr","someone","space...","spec","sta","staaspuat.sias.corp","stadbg","staref","status","still","stream","sts","subtasks","suport","table","table.","take","taking","tax","team","terminal","test","testing","the","they","this","ticket","time","timesheet","titles","topic","transfer","triggered-software","trying","uat","uat.","ubi","umb","umb.","up.","update","updating","upw","upwsta","urls","usb","usbank","usbsta","usbuatsta","usqa","usqasta","w/sql","warning","week","well","wfh","what","when","while","will","with","wls032","wls150.sias.corp","wls537.sias.corp.disk","work","working","worksheet","year","you","your","zions"))
frequencies = DocumentTermMatrix(corpus)
findFreqTerms(frequencies)
corpus = tm_map(corpus, removeWords, c("tng-24616","tng-24836","tng-26183","tng-26897","tng-27017","tng-27063","tng-27109","tng-27244","tng-27341","tng-27386","tng-27388","tng-27529","tng-27757"))
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736","h#:195788","h#:195789","h#:195804","h#:195939","h#:195982","h#:195991","h#:196177","h#:196179","h#:196191","h#:196399","h#:196400","h#:196401","h#:196465","h#:196476","h#:196519"))
frequencies = DocumentTermMatrix(corpus)
findFreqTerms(frequencies)
df = as.data.frame(as.matrix(frequencies))\
df = as.data.frame(as.matrix(frequencies))
colnames(df) = make.names(colnames(df))
str(df)
str(mails)
str(mail)
df$count = mail$count
df$time=mail$resolvtimesecs
df$importance=mail$importance
df$creator=mail$creator
df$function=mail$function
df$function=mail$function.
df$module=mail$module
df$client=df$client
df$score=df$score
df$function=mail$function
str(df)
write.csv(df,"data.csv")
data = read.csv("data.csv")
lmodel = lm(score ~ ., data=data)
write.csv(df,"data.csv")
data = read.csv("data.csv")
lmodel = lm(score ~ ., data=data)
str(lmodel)
summary(lmodel)
lmodel = lm(score ~ . - creator+module+function, data=data)
lmodel = lm(score ~ . - creator-module-function, data=data)
lmodel = lm(score ~ . -creator, data=data)
lmodel = lm(score ~ . -creator-module-function, data=data)
lmodel = lm(score ~ . -creator-module, data=data)
lmodel = lm(score ~ . -creator-function-module, data=data)
lmodel = lm(score ~ . -creator-function -module, data=data)
lmodel = lm(score ~ . -creator-module, data=data)
summary(lmodel)
lmodel = lm(score ~ count+time+importance, data=data)
summary(lmodel)
jan = read.csv("extracted-signals.csv",stringsAsFactors=FALSE)
jan$creator = as.factor(jan$creator)
jan$importance = as.factor(jan$importance)
corpus = Corpus(VectorSource(jan$heading))
corpus = Corpus(VectorSource(jan$thread))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removeWords, c("'14","!bb","points","service","views","#55","(10)...","(crp","(odbc","(so","(tng-27021)","(usbsta)","/dump","@stadbg","[jira]","<eom>","1.00172E+14","14th","15th","1628710!","168.162.171.161","195608","195611","195791","195927","2013","2014","21502","2241","27551","2941410!","2tr.018","3.0a","3.0a:","3.0b","86.39,","access","access)","activity.","add","advice","agency","all","also","and","another","any","application","area","asia","available","b&c","back","back-ups","balancing","baml","bank","bbt","been","bob","bond","boxes","bpop","branch","bspruatsta","build","build#55","build(#55)","builds","button","call","called","can","cash","categories","causing","chance","change","clearer","closing","cogencis","column","coming","console","copy","cpu","crossed","crp_log","crt","cst","custom","database","database.","date","dates","days_adv_prin_int_mail_dates","dda","deal","dec","delinquent","demo","demos?","deployment","detail","development","discuss","distribution","documentation","down?","dtc","dump","edit","enhancements","escalation","exclude","executing","existing","expectations","expense","far)","fast","feb","feeling","figure","filesystem","first","fix","for","found","frequency","from","fund","fw:","get","global","greyed","half","half.","has","have","heat","helios","help","holders","holiday","home","hot","hour","how","i'm","image","impact","improvement","in...","india.","inputs","is.","issuances","issue","issuecntrlext","issuecntrls","issues","items","items.","jan","japsersoft","jasper","jira","job","leave","ledger","license","linux","list","load","log","logs","look","lunch","machine","make","marketmap","meeting","memory","message","mode","month","monthly","muthu","need","ngconv3","ngconv3-reports","not","null","odd","off","office","office.","on-boarding","onboarding","opt","optional","oracle","out","overview","patches","payment","post","posting","ppr","pramod","probe","problemusing","processing","prod","prod/uat","prod_umb","production","profile","pub","pubsta","quarterly","question","quickly","ramesh","really","receipt","recon","recorddatefrequency/payment","refresh","refreshed","reg","registration","release","report","report.)","reporting","request","required","resolve","resources","restart","restore","reversal","run","sanity","schedule","schemas","script","scripts","second","section","security","see","sharepoint","signs","sinking","site","solr","someone","space...","spec","sta","staaspuat.sias.corp","stadbg","staref","status","still","stream","sts","subtasks","suport","table","table.","take","taking","tax","team","terminal","test","testing","the","they","this","ticket","time","timesheet","titles","topic","transfer","triggered-software","trying","uat","uat.","ubi","umb","umb.","up.","update","updating","upw","upwsta","urls","usb","usbank","usbsta","usbuatsta","usqa","usqasta","w/sql","warning","week","well","wfh","what","when","while","will","with","wls032","wls150.sias.corp","wls537.sias.corp.disk","work","working","worksheet","year","you","your","zions"))
corpus = tm_map(corpus, removeWords, c("tng-24616","tng-24836","tng-26183","tng-26897","tng-27017","tng-27063","tng-27109","tng-27244","tng-27341","tng-27386","tng-27388","tng-27529","tng-27757"))
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736","h#:195788","h#:195789","h#:195804","h#:195939","h#:195982","h#:195991","h#:196177","h#:196179","h#:196191","h#:196399","h#:196400","h#:196401","h#:196465","h#:196476","h#:196519"))
frequencies = DocumentTermMatrix(corpus)
df = as.data.frame(as.matrix(frequencies))
colnames(df) = make.names(colnames(df))
df$count = jan$count
df$time=jan$resolvtimesecs
df$importance=jan$importance
df$creator=jan$creator
df$function=mail$function
df$fname=mail$function
df$fname=jan$function
df$module=mail$module
df$client=df$client
df$module=jan$module
df$client=jan$client
df$score=jan$score
str(df)
write.csv(df,"data_jan.csv")
data_jan=read.csv("data_jan.csv")
str(data_jan)
lmodel = lm(score~.,data=data_jan)
summary(lmodel)
feb = read.csv("feb2014.csv",stringsAsFactors=FALSE)
feb$creator = as.factor(feb$creator)
feb$importance = as.factor(feb$importance)
corpus = Corpus(VectorSource(feb$heading))
corpus = Corpus(VectorSource(feb$thread))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removeWords, c("'14","!bb","points","service","views","#55","(10)...","(crp","(odbc","(so","(tng-27021)","(usbsta)","/dump","@stadbg","[jira]","<eom>","1.00172E+14","14th","15th","1628710!","168.162.171.161","195608","195611","195791","195927","2013","2014","21502","2241","27551","2941410!","2tr.018","3.0a","3.0a:","3.0b","86.39,","access","access)","activity.","add","advice","agency","all","also","and","another","any","application","area","asia","available","b&c","back","back-ups","balancing","baml","bank","bbt","been","bob","bond","boxes","bpop","branch","bspruatsta","build","build#55","build(#55)","builds","button","call","called","can","cash","categories","causing","chance","change","clearer","closing","cogencis","column","coming","console","copy","cpu","crossed","crp_log","crt","cst","custom","database","database.","date","dates","days_adv_prin_int_mail_dates","dda","deal","dec","delinquent","demo","demos?","deployment","detail","development","discuss","distribution","documentation","down?","dtc","dump","edit","enhancements","escalation","exclude","executing","existing","expectations","expense","far)","fast","feb","feeling","figure","filesystem","first","fix","for","found","frequency","from","fund","fw:","get","global","greyed","half","half.","has","have","heat","helios","help","holders","holiday","home","hot","hour","how","i'm","image","impact","improvement","in...","india.","inputs","is.","issuances","issue","issuecntrlext","issuecntrls","issues","items","items.","jan","japsersoft","jasper","jira","job","leave","ledger","license","linux","list","load","log","logs","look","lunch","machine","make","marketmap","meeting","memory","message","mode","month","monthly","muthu","need","ngconv3","ngconv3-reports","not","null","odd","off","office","office.","on-boarding","onboarding","opt","optional","oracle","out","overview","patches","payment","post","posting","ppr","pramod","probe","problemusing","processing","prod","prod/uat","prod_umb","production","profile","pub","pubsta","quarterly","question","quickly","ramesh","really","receipt","recon","recorddatefrequency/payment","refresh","refreshed","reg","registration","release","report","report.)","reporting","request","required","resolve","resources","restart","restore","reversal","run","sanity","schedule","schemas","script","scripts","second","section","security","see","sharepoint","signs","sinking","site","solr","someone","space...","spec","sta","staaspuat.sias.corp","stadbg","staref","status","still","stream","sts","subtasks","suport","table","table.","take","taking","tax","team","terminal","test","testing","the","they","this","ticket","time","timesheet","titles","topic","transfer","triggered-software","trying","uat","uat.","ubi","umb","umb.","up.","update","updating","upw","upwsta","urls","usb","usbank","usbsta","usbuatsta","usqa","usqasta","w/sql","warning","week","well","wfh","what","when","while","will","with","wls032","wls150.sias.corp","wls537.sias.corp.disk","work","working","worksheet","year","you","your","zions"))
corpus = tm_map(corpus, removeWords, c("tng-24616","tng-24836","tng-26183","tng-26897","tng-27017","tng-27063","tng-27109","tng-27244","tng-27341","tng-27386","tng-27388","tng-27529","tng-27757"))
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736","h#:195788","h#:195789","h#:195804","h#:195939","h#:195982","h#:195991","h#:196177","h#:196179","h#:196191","h#:196399","h#:196400","h#:196401","h#:196465","h#:196476","h#:196519"))
frequencies = DocumentTermMatrix(corpus)
df = as.data.frame(as.matrix(frequencies))
colnames(df) = make.names(colnames(df))
df$count = feb$count
df$time=feb$resolvtimesecs
df$importance=feb$importance
df$creator=feb$creator
df$fname=feb$function
df$module=feb$module
df$client=feb$client
df$score=feb$score
write.csv(df,"data_feb.csv")
data_feb=read.csv("data_feb.csv")
str(data_feb)
lmodelfeb = lm(score~.,data=data_feb)
summary(lmodelfeb)
newdf = c(data_jan, data_feb)
str(newdf)
summary(newdf)
write.csv(newdf,"data_janfeb.csv")
janfeb = c(jan, feb)
write.csv(janfeb,"janfeb.csv")
jan=read.csv("jan2014.csv")
feb=read.csv("feb2014.csv")
janfeb = c(jan, feb)
write.csv(janfeb,"janfeb.csv")
janfeb = merge(jan, feb)
write.csv(janfeb,"janfeb.csv")
janfeb = merge(jan, feb, all=TRUE)
write.csv(janfeb,"janfeb.csv")
data_janfeb = merge(data_jan, data_feb, all=TRUE)
write.csv(data_janfeb,"data_janfeb.csv")
str(janfeb)
corpus = Corpus(VectorSource(janfeb$thread))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removeWords, c("'14","!bb","points","service","views","#55","(10)...","(crp","(odbc","(so","(tng-27021)","(usbsta)","/dump","@stadbg","[jira]","<eom>","1.00172E+14","14th","15th","1628710!","168.162.171.161","195608","195611","195791","195927","2013","2014","21502","2241","27551","2941410!","2tr.018","3.0a","3.0a:","3.0b","86.39,","access","access)","activity.","add","advice","agency","all","also","and","another","any","application","area","asia","available","b&c","back","back-ups","balancing","baml","bank","bbt","been","bob","bond","boxes","bpop","branch","bspruatsta","build","build#55","build(#55)","builds","button","call","called","can","cash","categories","causing","chance","change","clearer","closing","cogencis","column","coming","console","copy","cpu","crossed","crp_log","crt","cst","custom","database","database.","date","dates","days_adv_prin_int_mail_dates","dda","deal","dec","delinquent","demo","demos?","deployment","detail","development","discuss","distribution","documentation","down?","dtc","dump","edit","enhancements","escalation","exclude","executing","existing","expectations","expense","far)","fast","janfeb","feeling","figure","filesystem","first","fix","for","found","frequency","from","fund","fw:","get","global","greyed","half","half.","has","have","heat","helios","help","holders","holiday","home","hot","hour","how","i'm","image","impact","improvement","in...","india.","inputs","is.","issuances","issue","issuecntrlext","issuecntrls","issues","items","items.","jan","japsersoft","jasper","jira","job","leave","ledger","license","linux","list","load","log","logs","look","lunch","machine","make","marketmap","meeting","memory","message","mode","month","monthly","muthu","need","ngconv3","ngconv3-reports","not","null","odd","off","office","office.","on-boarding","onboarding","opt","optional","oracle","out","overview","patches","payment","post","posting","ppr","pramod","probe","problemusing","processing","prod","prod/uat","prod_umb","production","profile","pub","pubsta","quarterly","question","quickly","ramesh","really","receipt","recon","recorddatefrequency/payment","refresh","refreshed","reg","registration","release","report","report.)","reporting","request","required","resolve","resources","restart","restore","reversal","run","sanity","schedule","schemas","script","scripts","second","section","security","see","sharepoint","signs","sinking","site","solr","someone","space...","spec","sta","staaspuat.sias.corp","stadbg","staref","status","still","stream","sts","subtasks","suport","table","table.","take","taking","tax","team","terminal","test","testing","the","they","this","ticket","time","timesheet","titles","topic","transfer","triggered-software","trying","uat","uat.","ubi","umb","umb.","up.","update","updating","upw","upwsta","urls","usb","usbank","usbsta","usbuatsta","usqa","usqasta","w/sql","warning","week","well","wfh","what","when","while","will","with","wls032","wls150.sias.corp","wls537.sias.corp.disk","work","working","worksheet","year","you","your","zions"))
corpus = tm_map(corpus, removeWords, c("tng-24616","tng-24836","tng-26183","tng-26897","tng-27017","tng-27063","tng-27109","tng-27244","tng-27341","tng-27386","tng-27388","tng-27529","tng-27757"))
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736","h#:195788","h#:195789","h#:195804","h#:195939","h#:195982","h#:195991","h#:196177","h#:196179","h#:196191","h#:196399","h#:196400","h#:196401","h#:196465","h#:196476","h#:196519"))
corpus = tm_map(corpus, removeWords, c("apple", stopwords("english")))
corpus = tm_map(corpus, stemDocument)
frequencies = DocumentTermMatrix(corpus)
df = as.data.frame(as.matrix(frequencies))
colnames(df) = make.names(colnames(df))
df$count = janfeb$count
df$time=janfeb$resolvtimesecs
df$importance=janfeb$importance
df$creator=janfeb$creator
df$fname=janfeb$function
df$module=janfeb$module
df$client=janfeb$client
df$score=janfeb$score
write.csv(df,"data_janfeb.csv")
df$thread=janfeb$thread
write.csv(df,"data_janfeb.csv")
janfeb=read.csv("janfeb.csv")
janfeb$creator = as.factor(janfeb$creator)
janfeb$importance = as.factor(janfeb$importance)
corpus = Corpus(VectorSource(janfeb$thread))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, c("apple", stopwords("english")))
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, removeWords, c("'14","!bb","points","service","views","#55","(10)...","(crp","(odbc","(so","(tng-27021)","(usbsta)","/dump","@stadbg","[jira]","<eom>","1.00172E+14","14th","15th","1628710!","168.162.171.161","195608","195611","195791","195927","2013","2014","21502","2241","27551","2941410!","2tr.018","3.0a","3.0a:","3.0b","86.39,","access","access)","activity.","add","advice","agency","all","also","and","another","any","application","area","asia","available","b&c","back","back-ups","balancing","baml","bank","bbt","been","bob","bond","boxes","bpop","branch","bspruatsta","build","build#55","build(#55)","builds","button","call","called","can","cash","categories","causing","chance","change","clearer","closing","cogencis","column","coming","console","copy","cpu","crossed","crp_log","crt","cst","custom","database","database.","date","dates","days_adv_prin_int_mail_dates","dda","deal","dec","delinquent","demo","demos?","deployment","detail","development","discuss","distribution","documentation","down?","dtc","dump","edit","enhancements","escalation","exclude","executing","existing","expectations","expense","far)","fast","janfeb","feeling","figure","filesystem","first","fix","for","found","frequency","from","fund","fw:","get","global","greyed","half","half.","has","have","heat","helios","help","holders","holiday","home","hot","hour","how","i'm","image","impact","improvement","in...","india.","inputs","is.","issuances","issue","issuecntrlext","issuecntrls","issues","items","items.","jan","japsersoft","jasper","jira","job","leave","ledger","license","linux","list","load","log","logs","look","lunch","machine","make","marketmap","meeting","memory","message","mode","month","monthly","muthu","need","ngconv3","ngconv3-reports","not","null","odd","off","office","office.","on-boarding","onboarding","opt","optional","oracle","out","overview","patches","payment","post","posting","ppr","pramod","probe","problemusing","processing","prod","prod/uat","prod_umb","production","profile","pub","pubsta","quarterly","question","quickly","ramesh","really","receipt","recon","recorddatefrequency/payment","refresh","refreshed","reg","registration","release","report","report.)","reporting","request","required","resolve","resources","restart","restore","reversal","run","sanity","schedule","schemas","script","scripts","second","section","security","see","sharepoint","signs","sinking","site","solr","someone","space...","spec","sta","staaspuat.sias.corp","stadbg","staref","status","still","stream","sts","subtasks","suport","table","table.","take","taking","tax","team","terminal","test","testing","the","they","this","ticket","time","timesheet","titles","topic","transfer","triggered-software","trying","uat","uat.","ubi","umb","umb.","up.","update","updating","upw","upwsta","urls","usb","usbank","usbsta","usbuatsta","usqa","usqasta","w/sql","warning","week","well","wfh","what","when","while","will","with","wls032","wls150.sias.corp","wls537.sias.corp.disk","work","working","worksheet","year","you","your","zions"))
corpus = tm_map(corpus, removeWords, c("tng-24616","tng-24836","tng-26183","tng-26897","tng-27017","tng-27063","tng-27109","tng-27244","tng-27341","tng-27386","tng-27388","tng-27529","tng-27757"))
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736","
frequencies = DocumentTermMatrix(corpus)
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736")
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736","h#:195788","h#:195789","h#:195804","h#:195939","h#:195982","h#:195991","h#:196177","h#:196179","h#:196191","h#:196399","h#:196400","h#:196401","h#:196465","h#:196476","h#:196519"))
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736","h#:195788","h#:195789","h#:195804","h#:195939","h#:195982","h#:195991","h#:196177","h#:196179","h#:196191","h#:196399","h#:196400","h#:196401","h#:196465","h#:196476","h#:196519"))
frequencies = DocumentTermMatrix(corpus)
df = as.data.frame(as.matrix(frequencies))
colnames(df) = make.names(colnames(df))
df$count = janfeb$count
df$time=janfeb$resolvtimesecs
df$importance=janfeb$importance
df$creator=janfeb$creator
df$fname=janfeb$function
df$module=janfeb$module
df$client=janfeb$client
df$score=janfeb$score
df$stars=janfeb$stars
write.csv(df,"data_janfeb.csv")
corpus = tm_map(corpus, removeWords, c("X100172025008188","X1076410","X119","X1259510","X1281910","X1578210","X1601010","X1628710","X164","X168162171161","X169966","X188","X189","X194","X196459","X196587","X196604","X196861","X196966","X197079","X197117","X1hr","X1st","X200172025008188","X200999999999999","X2052010","X20th","X2557810","X25feb2014","X28662","X2941410","X2nd","X2tr018","X2tr044re","X30a","X30abuild","X30aqa","X30b","X3258510","X3407730","X3day","X3feb2014","X4356","X600168162179230","X600168162179235","X600172025008018","X6150010","X8639","accru","activ","adjust","adptap","advic","agenc","allow","amount","announc","annual","anoth","applic","attent","avail","backup","balanc","board","book","box","bpg","bpopuat","browser","bspr","bspr1tr30a051","bsprsta","bspruat","build55","calibr","calss","capit","caus","center","cep","cert","chanc","chang","check","checkpoint","client","close","cob","code","cogenc","come","compar","complet","compress","comput","config","configur","connect","consum","convcss1j","convcss1sta","convcss2sta","copi","cross","crpepi","crplog","ctd","daili","databas","daysadvprinintmaild","delinqu","deploy","differ","digest","directori","disk","disregard","distribut","embassi","enhanc","env","eom","escal","esw","except","exclud","execut","expens","face","facil","feb","figur","file","final","findbug","floor","follow","free","freita","frequenc","full","function.","generat","georg","grey","group","h195376","h195517","h195557","h195562","h195574","h195576","h195596","h195597","h195638","h195664","h195695","h195696","h195736","h195788","h195789","h195804","h195939","h195982","h195991","h196177","h196179","h196191","h196399","h196400","h196401","h196465","h196476","h196519","h196540","h196549","h196627","h196628","h196629","h196668","h196669","h196672","h196712","h196717","h196725","h196859","h196874","h196885","h196886","h196888","h196889","h196908","h196990","h197048","h197049","h197096","h197102","h197133","h197143","h197149","h197277","h197292","h197346","h197348","h197414","h197431","hei","heiuat","heiuatsa","helio","high","hire","histori","holder","host","icon","imag","imp","impcrp","impfw","implement1","impmultihi","impmultipl","improv","improvemet","imptng19945","imptng28945","includ","increas","instanc","interest","intern","investig","issu","issuanc","issuecntrl","issuecntrlfinalmatslpymtd","issueeom","item","jagadish","januari","june","largest","last","lcb","learn","leav","licens","live","liz","lost","machin","mainten","manag","map","march","media","meet","memori","messag","methodolog","mind","minor","miss","mix","modifi","name","natali","new","next.","nextgenbspr","ngconv3report","ngonv3","non","now","number","occur","old","one","option","oracl","orp","page","payabl","per","pick","pleas","point","pool","popular","popup","posit","power","ppt","princip","print","printcertif","produat","product","produmb","profil","pubdtc","qa4","quarter","queri","queu","ran","rate","realli","receiv","record","recorddatefrequencypay","recoveri","refactor","reformat","registr","reimburs","releas","remov","renam","repli","requir","reschedul","resequ","resolv","resourc","restor","revers","roundup","rtp","sale","sandhya","saniti","santand","save","schedul","schema","scope","search","secur","sharpen","sheet","shortfal","show","sign","similar","sink","size","slablr","slow","smtp","someon","someth","sonar","space","sreehari","staaspuatsiascorp","stabamluathttp","stabsprprodhttp","stademohttp","stan","stapubprodhttp","statrfprodhttp","stazionsprodhttp","step","submit","subtask","suggest","summari","suppissuecntrlshortlongpymtd","support","tabl","tablespac","taken","task","teamfw","tech","technolog","tell","temporarili","termin","terri","testbsta","testt","thank","till","timeout","titl","tmrk","tng","tng14170","tng17461","tng19945","tng24616","tng24836","tng25271","tng26183","tng26420","tng26604","tng26826","tng26897","tng27017","tng27021","tng27063","tng27109","tng27180","tng27222","tng27244","tng27288","tng27291","tng27341","tng27386","tng27388","tng27529","tng27541","tng27558","tng27694","tng27757","tng27883","tng2
7995","tng28043","tng28044","tng28046","tng28053","tng28333","tng28334","tng28382","tng28456","tng28662","tng28742","tng28899","tng28973","tng28975","today","tomorrow","transact","transit","transmiss","trfdemo","trfdemosta","tri","trifecta","triggeredsoftwar","trustmark","twire","unwel","updat","upgrad","upload","upwstaprod","url","usbuat","ustrainsta","valid","view","warn","wayn","welcom","westend","wfo","withhold","wls107","wls107siascorpcpu","wls150","wls150siascorp","wls537","wls537siascorpcpu","wls537siascorpdisk","wpatstac","wrong","wsql","zero","zion"))
frequencies = DocumentTermMatrix(corpus)
df = as.data.frame(as.matrix(frequencies))
colnames(df) = make.names(colnames(df))
df$count = janfeb$count
df$time=janfeb$resolvtimesecs
df$importance=janfeb$importance
df$creator=janfeb$creator
df$fname=janfeb$function
df$module=janfeb$module
df$client=janfeb$client
df$score=janfeb$score
write.csv(df,"data_janfeb.csv")
df$start=janfeb$start
df$end=janfeb$end
write.csv(df,"data_janfeb.csv")
write.csv(df,"data_janfeb.csv")
df$stars=janfeb$stars
write.csv(df,"data_janfeb.csv")
newdata=read.csv("data_janfeb.csv")
lmodel = lm(score~.-start-end,data=data_janfeb)
lmodel = lm(score~.-start-end,data=newdata)
summary(lmodel)
mar=read.csv("mar2014.csv")
mar$creator = as.factor(mar$creator)
mar$importance = as.factor(mar$importance)
mar=read.csv("mar2014.csv",stringsAsFactors=FALSE)
mar$creator = as.factor(mar$creator)
mar$importance = as.factor(mar$importance)
corpus = Corpus(VectorSource(mar$thread))
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, c("apple", stopwords("english")))
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, removeWords, c("'14","!bb","points","service","views","#55","(10)...","(crp","(odbc","(so","(tng-27021)","(usbsta)","/dump","@stadbg","[jira]","<eom>","1.00172E+14","14th","15th","1628710!","168.162.171.161","195608","195611","195791","195927","2013","2014","21502","2241","27551","2941410!","2tr.018","3.0a","3.0a:","3.0b","86.39,","access","access)","activity.","add","advice","agency","all","also","and","another","any","application","area","asia","available","b&c","back","back-ups","balancing","baml","bank","bbt","been","bob","bond","boxes","bpop","branch","bspruatsta","build","build#55","build(#55)","builds","button","call","called","can","cash","categories","causing","chance","change","clearer","closing","cogencis","column","coming","console","copy","cpu","crossed","crp_log","crt","cst","custom","database","database.","date","dates","days_adv_prin_int_mail_dates","dda","deal","dec","delinquent","demo","demos?","deployment","detail","development","discuss","distribution","documentation","down?","dtc","dump","edit","enhancements","escalation","exclude","executing","existing","expectations","expense","far)","fast","mar","feeling","figure","filesystem","first","fix","for","found","frequency","from","fund","fw:","get","global","greyed","half","half.","has","have","heat","helios","help","holders","holiday","home","hot","hour","how","i'm","image","impact","improvement","in...","india.","inputs","is.","issuances","issue","issuecntrlext","issuecntrls","issues","items","items.","jan","japsersoft","jasper","jira","job","leave","ledger","license","linux","list","load","log","logs","look","lunch","machine","make","marketmap","meeting","memory","message","mode","month","monthly","muthu","need","ngconv3","ngconv3-reports","not","null","odd","off","office","office.","on-boarding","onboarding","opt","optional","oracle","out","overview","patches","payment","post","posting","ppr","pramod","probe","problemusing","processing","prod","prod/uat","prod_umb","production","profile","pub","pubsta","quarterly","question","quickly","ramesh","really","receipt","recon","recorddatefrequency/payment","refresh","refreshed","reg","registration","release","report","report.)","reporting","request","required","resolve","resources","restart","restore","reversal","run","sanity","schedule","schemas","script","scripts","second","section","security","see","sharepoint","signs","sinking","site","solr","someone","space...","spec","sta","staaspuat.sias.corp","stadbg","staref","status","still","stream","sts","subtasks","suport","table","table.","take","taking","tax","team","terminal","test","testing","the","they","this","ticket","time","timesheet","titles","topic","transfer","triggered-software","trying","uat","uat.","ubi","umb","umb.","up.","update","updating","upw","upwsta","urls","usb","usbank","usbsta","usbuatsta","usqa","usqasta","w/sql","warning","week","well","wfh","what","when","while","will","with","wls032","wls150.sias.corp","wls537.sias.corp.disk","work","working","worksheet","year","you","your","zions"))
corpus = tm_map(corpus, removeWords, c("tng-24616","tng-24836","tng-26183","tng-26897","tng-27017","tng-27063","tng-27109","tng-27244","tng-27341","tng-27386","tng-27388","tng-27529","tng-27757"))
corpus = tm_map(corpus, removeWords, c("h#:195376","h#:195517","h#:195557","h#:195562","h#:195574","h#:195576","h#:195596","h#:195597","h#:195638","h#:195664","h#:195695","h#:195696","h#:195736","h#:195788","h#:195789","h#:195804","h#:195939","h#:195982","h#:195991","h#:196177","h#:196179","h#:196191","h#:196399","h#:196400","h#:196401","h#:196465","h#:196476","h#:196519"))
corpus = tm_map(corpus, removeWords, c("X100172025008188","X1076410","X119","X1259510","X1281910","X1578210","X1601010","X1628710","X164","X168162171161","X169966","X188","X189","X194","X196459","X196587","X196604","X196861","X196966","X197079","X197117","X1hr","X1st","X200172025008188","X200999999999999","X2052010","X20th","X2557810","X25feb2014","X28662","X2941410","X2nd","X2tr018","X2tr044re","X30a","X30abuild","X30aqa","X30b","X3258510","X3407730","X3day","X3feb2014","X4356","X600168162179230","X600168162179235","X600172025008018","X6150010","X8639","accru","activ","adjust","adptap","advic","agenc","allow","amount","announc","annual","anoth","applic","attent","avail","backup","balanc","board","book","box","bpg","bpopuat","browser","bspr","bspr1tr30a051","bsprsta","bspruat","build55","calibr","calss","capit","caus","center","cep","cert","chanc","chang","check","checkpoint","client","close","cob","code","cogenc","come","compar","complet","compress","comput","config","configur","connect","consum","convcss1j","convcss1sta","convcss2sta","copi","cross","crpepi","crplog","ctd","daili","databas","daysadvprinintmaild","delinqu","deploy","differ","digest","directori","disk","disregard","distribut","embassi","enhanc","env","eom","escal","esw","except","exclud","execut","expens","face","facil","feb","figur","file","final","findbug","floor","follow","free","freita","frequenc","full","function.","generat","georg","grey","group","h195376","h195517","h195557","h195562","h195574","h195576","h195596","h195597","h195638","h195664","h195695","h195696","h195736","h195788","h195789","h195804","h195939","h195982","h195991","h196177","h196179","h196191","h196399","h196400","h196401","h196465","h196476","h196519","h196540","h196549","h196627","h196628","h196629","h196668","h196669","h196672","h196712","h196717","h196725","h196859","h196874","h196885","h196886","h196888","h196889","h196908","h196990","h197048","h197049","h197096","h197102","h197133","h197143","h197149","h197277","h197292","h197346","h197348","h197414","h197431","hei","heiuat","heiuatsa","helio","high","hire","histori","holder","host","icon","imag","imp","impcrp","impfw","implement1","impmultihi","impmultipl","improv","improvemet","imptng19945","imptng28945","includ","increas","instanc","interest","intern","investig","issu","issuanc","issuecntrl","issuecntrlfinalmatslpymtd","issueeom","item","jagadish","januari","june","largest","last","lcb","learn","leav","licens","live","liz","lost","machin","mainten","manag","map","march","media","meet","memori","messag","methodolog","mind","minor","miss","mix","modifi","name","natali","new","next.","nextgenbspr","ngconv3report","ngonv3","non","now","number","occur","old","one","option","oracl","orp","page","payabl","per","pick","pleas","point","pool","popular","popup","posit","power","ppt","princip","print","printcertif","produat","product","produmb","profil","pubdtc","qa4","quarter","queri","queu","ran","rate","realli","receiv","record","recorddatefrequencypay","recoveri","refactor","reformat","registr","reimburs","releas","remov","renam","repli","requir","reschedul","resequ","resolv","resourc","restor","revers","roundup","rtp","sale","sandhya","saniti","santand","save","schedul","schema","scope","search","secur","sharpen","sheet","shortfal","show","sign","similar","sink","size","slablr","slow","smtp","someon","someth","sonar","space","sreehari","staaspuatsiascorp","stabamluathttp","stabsprprodhttp","stademohttp","stan","stapubprodhttp","statrfprodhttp","stazionsprodhttp","step","submit","subtask","suggest","summari","suppissuecntrlshortlongpymtd","support","tabl","tablespac","taken","task","teamfw","tech","technolog","tell","temporarili","termin","terri","testbsta","testt","thank","till","timeout","titl","tmrk","tng","tng14170","tng17461","tng19945","tng24616","tng24836","tng25271","tng26183","tng26420","tng26604","tng26826","tng26897","tng27017","tng27021","tng27063","tng27109","tng27180","tng27222","tng27244","tng27288","tng27291","tng27341","tng27386","tng27388","tng27529","tng27541","tng27558","tng27694","tng27757","tng27883","tng2
7995","tng28043","tng28044","tng28046","tng28053","tng28333","tng28334","tng28382","tng28456","tng28662","tng28742","tng28899","tng28973","tng28975","today","tomorrow","transact","transit","transmiss","trfdemo","trfdemosta","tri","trifecta","triggeredsoftwar","trustmark","twire","unwel","updat","upgrad","upload","upwstaprod","url","usbuat","ustrainsta","valid","view","warn","wayn","welcom","westend","wfo","withhold","wls107","wls107siascorpcpu","wls150","wls150siascorp","wls537","wls537siascorpcpu","wls537siascorpdisk","wpatstac","wrong","wsql","zero","zion"))
frequencies = DocumentTermMatrix(corpus)
df = as.data.frame(as.matrix(frequencies))
colnames(df) = make.names(colnames(df))
df$count = mar$count
df$time=mar$resolvtimesecs
df$importance=mar$importance
df$creator=mar$creator
df$fname=mar$function
df$module=mar$module
df$client=mar$client
df$score=mar$score
write.csv(df,"data_mar.csv")
newdata=read.csv("data_mar.csv")
pred = predict(lmodel,newddata=newdata)
pred
result=as.data.frame(pred)
str(result)
newdata$score=pred
newdata=read.csv("data_mar.csv")
pred = predict(lmodel,newddata=newdata)
newdata$score=pred
