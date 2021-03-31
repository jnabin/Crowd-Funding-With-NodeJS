const express 	= require('express');
const router 	= express.Router();
const userModel = require.main.require('./models/userModel')
const {body, validationResult} = require('express-validator');
const fs = require("fs");
const multer = require('multer');
const path = require('path');

router.get('*', (req, res, next)=>{
	if(req.session.uname){
		next();
	}else{
		res.redirect('/login')
	}
});

router.get('/create', (req, res)=>{
	var s = req.session.errors;
	req.session.errors = "";
	res.render('organization/create', {msg1: s, msg : req.query.msg});
	
});

router.post('/create', [body('target_fund').isLength({min: 1}).withMessage('target fund required').isFloat().withMessage('target_fund should be numeric'), body('campaigntype', 'campaign type required').isLength({min: 1}), body('description', 'description should be at lest 20 character').isLength({min: 20}), body('enddate', 'end date required').isLength({min: 1}), body('title', 'title should be at lest 4 character').isLength({min: 4})], (req, res)=>{
	const errors = validationResult(req);
	if(!errors.isEmpty()){
		req.session.errors = errors.array();
		res.redirect('/organization/create');
	}else{
	var campaign = {
		number : req.cookies['uid'],
		target_fund : req.body.target_fund,
		campaigntype : req.body.campaigntype,
		description : req.body.description,
		publishdDate: req.body.publishdDate,
		enddate : req.body.enddate,
		title : req.body.title
	}
	userModel.checkcampaigns(campaign, function(status){
		if(status){
		userModel.insert(campaign, function(status){
		if(status){
			res.redirect('/home/campaignlist');
		}else{
			res.redirect('/organization/create');
		}
	});
		}else{
			var mg = encodeURIComponent("**Campaigns title already exist!!");
			res.redirect('/organization/create?msg='+mg);
		}
	});}
});

router.get('/edit/:id/:target_fund/:ctype/:description/:image/:endDate/:title', (req, res)=>{
	var currentCampaign = {
		target_fund : req.params.target_fund,
		ctype: req.params.ctype,
		description: req.params.description,
		image: req.params.image,
		endDate: req.params.endDate,
		title: req.params.title
	};
	req.session.currentCampaign = currentCampaign;
	var s = req.session.errors;
	res.render('organization/edit', {currentCampaign, msg1: s});
});

router.post('/edit/:id/:target_fund/:ctype/:description/:image/:endDate/:title', [body('target_fund').isLength({min: 1}).withMessage('target fund required').isFloat().withMessage('target_fund should be numeric'), body('campaigntype', 'campaign type required').isLength({min: 1}), body('description', 'description should be at lest 20 character').isLength({min: 20}), body('enddate', 'end date required').isLength({min: 1}), body('title', 'title should be at lest 4 character').isLength({min: 4})], (req, res)=>{
	const errors = validationResult(req);
	if(!errors.isEmpty()){
		req.session.errors = errors.array();
		var currentCampaign = req.session.currentCampaign;
		res.render('organization/edit', {currentCampaign, msg1: req.session.errors});
	}else{

		var Campaigns = {
		id : req.params.id,
		target_fund : req.body.target_fund,
		campaigntype : req.body.campaigntype,
		description : req.body.description,
		enddate : req.body.enddate,
		title : req.body.title
	};
	userModel.update(Campaigns, function(status){
		if(status){
			res.redirect('/home/campaignlist');
		}else{
			res.redirect('/organization/edit');
		}
	});
	}
	
});

router.get('/view/:id/:uid/:target_fund/:raised_fund/:ctype/:description/:image/:publishDate/:endDate/:title', (req, res)=>{
	var currentCampaign = {
		uid : req.params.uid,
		target_fund : req.params.target_fund,
		raised_fund : req.params.raised_fund,
		ctype: req.params.ctype,
		description: req.params.description,
		image: req.params.image,
		publishDate: req.params.publishDate,
		endDate: req.params.endDate,
		title: req.params.title
	};
	res.render('organization/view', currentCampaign);
});

router.get('/deletebookmarks/:id', (req, res)=>{
	var currentCampaign = {
		id : req.params.id
	};
	userModel.deletebookmarks(currentCampaign, function(status){
		if(status){
			var mg = encodeURIComponent('**deleted!!');
			res.redirect('/home/bookmarkslist?msg=' + mg );
		}
	});
});

router.get('/report/:id/:uid', (req, res)=>{
	req.session.rid = req.params.id;
	req.session.ruid = req.params.uid;
	var s = req.session.errors;
	req.session.errors = "";
	res.render('organization/description', {msg1:s});
	
});

router.post('/report/:id/:uid', [body('Description', 'description should be at least 10 characters').isLength({min: 10})], (req, res)=>{
	const errors = validationResult(req);
	if(!errors.isEmpty()){
		req.session.errors = errors.array();
		res.redirect('/organization/report/id/uid');
	}else{

		var currentCampaign = {
		id : req.session.rid,
		uid : req.session.ruid,
		description : req.body.Description
	};
	userModel.report(currentCampaign, function(status){
		if(status){
			var mg = encodeURIComponent('*reported!');
			res.redirect('/home/campaignlist?msg='+mg);
		}else{
			console.log("djgdjsgsjgds");	
		}
	});
	}
	
});

router.get('/bookmark/:id/:uid', (req, res)=>{
	
	var currentCampaign = {
		id : req.params.id,
		uid : req.params.uid
	};
	userModel.check(currentCampaign, function(status){
		if(status){
			userModel.bookmarks(currentCampaign, function(status){
			if(status){
				var mg = encodeURIComponent('**bookmarked!');
				res.redirect('/home/campaignlist?msg='+mg);
			}else{
				console.log("djgdjsgsjgds");	
			}
		});
		}else{
			var mg = encodeURIComponent('**already bookmarked!');
			res.redirect('/home/bookmarkslist?msg='+mg);
		}
	});
	
});
router.get('/delete/:id/:uid/:target_fund/:raised_fund/:ctype/:description/:image/:publisedDate/:endDate/:status/:title', (req, res)=>{
	var currentCampaign = {
		uid : req.params.uid,
		target_fund : req.params.target_fund,
		raised_fund : req.params.raised_fund,
		ctype: req.params.ctype,
		description: req.params.description,
		image: req.params.image,
		publisedDate: req.params.publisedDate,
		endDate: req.params.endDate,
		status: req.params.status,
		title: req.params.title
	};
	res.render('organization/delete', currentCampaign);
});

router.post('/delete/:id/:uid/:target_fund/:raised_fund/:ctype/:description/:image/:publisedDate/:endDate/:status/:title', (req, res)=>{

	var campaign = {
		id : req.params.id
	};
	userModel.delete(campaign, function(status){
		if(status){
			res.redirect('/home/campaignlist');
		}else{
			res.redirect('/organization/delete');
		}
	});
});

router.post('/uploadimage', (req, res)=>{
	res.render('organization/uploadimage');
});

router.get('/donate/:cid/:uid/:title', (req, res)=>{
	var data = {
		cid : req.params.cid,
		uid : req.params.uid,
		title : req.params.title
	}
	res.render('organization/donate', {data, msg : req.query.msg});
});

router.post('/donate/:cid/:uid/:title', [body('amount', 'amount must be numeric').isFloat().isLength({min:1}).withMessage("amount required")], (req, res)=>{
	
	const errors = validationResult(req);
	if(!errors.isEmpty()){
		var data = {
		cid : req.params.cid,
		uid : req.params.uid,
		title : req.params.title
	}
		req.session.errors = errors.array();
		var s = req.session.errors;
		req.session.errors = "";
		res.render('organization/donate', {msg:s, data});
	}else{
	var data = {
		cid : req.params.cid,
		uid : req.params.uid,
		amount : req.body.amount
	}
	var t = req.params.title;
	var mg = "donate added to "+t;
	userModel.enterDonation(data, function(status){
		if(status){
		userModel.getAll(function(results){
		res.render('home/campaignlist', {users: results, msg : mg});
	});
		}else{

		}
	});}
});

router.get('/generate', (req, res)=>{
	res.render('organization/generate');
});

router.post('/generate',(req,res)=>{
	var amount = req.body.amount;
	var table = req.body.ucount;
	if(req.body.select == 1){
		console.log("kshfjshfdj");
		console.log("kshfjshfdj");
		userModel.getTop10Donation(function(results){
			var body = [['User Name','Campaign Title', 'Donation Amount']];
			results.forEach(element => {
				body.push([element.uname,element.title.trim(),element.amount]);
			});
			console.log(body);
			var table = {
				headerRows : 1,
				widths : ['auto','auto'],
				body : body
			};
			var documentDefinition = {
				info: {
					title: 'Report Document',
					author: 'Md. Nur Islam',
					subject: 'Top 10 Donation of this Website',
					keywords: 'top 10',
				},
				content:[
					{
						text: 'Top 10 Donation Of the Website', style: 'header'
					},
					{
					  layout: 'lightHorizontalLines',
					  table: table
					}
				  ],
				  styles: {
					header: {
					  fontSize: 22,
					  bold: true
					}
				  }
			};
			const pdfDoc = pdfMake.createPdf(documentDefinition);
			pdfDoc.getBase64((data)=>{
				res.writeHead(200, 
				{
					'Content-Type': 'application/pdf',
					'Content-Disposition':'attachment;filename="filename.pdf"'
				});
		
				const download = Buffer.from(data.toString('utf-8'), 'base64');
				res.end(download);
			});
		});
	}
	if(req.body.select == 2){
		userModel.getTop10Donator(function(results){
			var body = [['User Name','Total Donation']];
			results.forEach(element => {
				body.push([element.uname,element.totalDonation]);
			});
			console.log(body);
			var table = {
				headerRows : 1,
				widths : ['auto','auto'],
				body : body
			};
			var documentDefinition = {
				info: {
					title: 'Report Document',
					author: 'Md. Nur Islam',
					subject: 'Top 10 Donator of this Website',
					keywords: 'top 10',
				},
				content:[
					{
						text: 'Top 10 Donator Of the Website', style: 'header'
					},
					{
					  layout: 'lightHorizontalLines', 
					  table: table
					}
				  ],
				  styles: {
					header: {
					  fontSize: 22,
					  bold: true
					}
				  }
			};
			const pdfDoc = pdfMake.createPdf(documentDefinition);
			pdfDoc.getBase64((data)=>{
				res.writeHead(200, 
				{
					'Content-Type': 'application/pdf',
					'Content-Disposition':'attachment;filename="filename.pdf"'
				});
		
				const download = Buffer.from(data.toString('utf-8'), 'base64');
				res.end(download);
			});
		});
	}
});


module.exports = router;