Hackathon 2014
------------------
Team Name : JAAM

Hackathon Project: Real Time Customer Relationship Monitoring through Customer Sentiment Analysis on SunGard Customer Support Systems including 
		   daily product support contact emails.

Why this Project: Customer Pulse is tracked at the real time. The wholistic experience of the product features, professional services and SLA Support
	          are reflected in the daily communication the customer has with the respective product support team. 
		  By measuring and analyzing it, the customer relationship score is estimated.

extract-customer-sentiment-from-daily-support-emails.py
	This program performs the chunk of work of converting the raw data of e-mails into quantized format which is suitable for analysis.
	The signals are extracted in the order of importance reletive role in measuring customer sentiment reflection on feature/bug/service on any
	of the SunGard Financial Systems Product.
	This program produces the data in the format which can be consumed by any statistical package like R, scikit, vowpalwabbit for
	further data analysis purposes.
	In the Hackathon 2014, we used R to perform learning of weights for the extracted features using Multivariate Linear Regression
	and Lasso Regression (regression with regularization)

SGHack.R
	This program loads the preprocess data, does the count vectorization model of the customer mail's subject and builds 
	a multivariate regression model from the training set and estimates the
	relationship experience scores for the customer's future support points in time.

Hackaton_14_1.twbx
	Loads the training and test data from R and generates multiple visualizations that 
	can be generated and then those can be displayed across the
	different platform like the web and tableau desktop.
	Visualizations are designed to cater to diferent stakeholders including CEO and SunGard Corporate(at client level), 
	Segment Directors (at product level), Project Directors and Managers (at Module level) and individual developers (at function level)
	
