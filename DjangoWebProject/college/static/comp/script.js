$(document).ready(function () {
    $('.hide').hide();
    $('.reporting').hide();
    $('.reMeeting').hide();
    $('.postReMeetingForm').hide();
    $('.postMeeting').hide();
    $('.onTouchComp').hide();
    $('.onTouchPost').hide();
    $('.mainPage').hide();
    $('#addCom').hide();
    $('.postMeetingForm').hide();
    $('.red').hide();
    $('#hello').focus(function () {
        $('#load').load('help.html');
    })
    $('.passwordContent input[type=password]').focus(function(){
        $('.forget').hide();
    })
    $('.passwordContent input[type=password]').blur(function(){
        $('.forget').show();
    })

    $('body').css('background-color', 'hsl(0, 16%, 84%)');

    $('.resetPasswordMainContent').hide();

    $('#forgetPassword').click(function () {
        $(".loginpageMainContent").hide();
        $('.resetPasswordMainContent').show();
    });

    $('.sendClick').click(function () {
        $(".loginpageMainContent").show();
        $('.resetPasswordMainContent').hide();
    })

    $('#submit').on('click', function () {
        $('.onTouchComp').hide();
        $(".loginpageMainContent").hide();
        $('.mainPage').show();
    })
    $('.panel').css('border-radius', '5%');
    $('.panel').hover(function () {
        $(this).css({
            'cursor': 'pointer',
            'box-shadow': '3px 4px 5px grey'
        })
    })

    $('.panel').mouseleave(function () {
        $(this).css({
            'box-shadow': 'none'
        })
    })

    /*Dynamic panel*/
    $('.getInto').on('mouseover', '.panel', function () {
        $(this).css({
            'cursor': 'pointer',
            'border-radius': '5%',
            'z-index' : '100',
        })
    })
    $('.getInto').on('mouseleave', '.panel', function () {
        $(this).css({
            'cursor': 'pointer',
            'border-radius': '5%',
        })
    })
    $('.onTouchComp').on('click', function () {
        $(this).hide();
        $('.mainPage').show();
        $('.UpcomingAppointments').show();
        $('.postMeetingForm').hide();
        $('.reporting').hide();
    });
    $('.onTouchComp').hover(function () {
        $(this).css({
            'cursor': 'pointer'
        })
    })


    $('.add').on('click', function () {
        $('#companyName').val("");
        $('#typeOfCompany').val("Choose");
        $('#companyDate').val("");
        $('#companyTime').val("")
        $('#pinCode').val("");
        $('#doorNo').val("");
        $('#street1').val("");
        $('#street2').val("");
        $('#city').val("");
        $('#state').val("");
        $('#companyRequirementsContent').val("");
        $('#jobDescriptionContent').val("");
        $('#contactName').val("");
        $('#designation').val("");
        $('#phoneNumber').val("");
        $('#mailId').val("");

        $('.onTouchComp').hide();
        $('.onTouchPost').hide();
        $('.UpcomingAppointments').hide();
        $('#addCom').show();
        $('.postMeeting').hide();
        $('.reMeeting').hide();
        $('.postMeetingForm').hide();
        $('.postReMeetingForm').hide();
        $('.rcom').hide();
        $('.reporting').hide();
    })

    /*form validation*/
    $('#companyNameRes').hide();
    $('#companyTypeRes').hide();
    $('#companyDateRes').hide();
    $('#companyTimeRes').hide();
    $('#companyDoorNoRes').hide();
    $('#companyStreet1Res').hide();
    $('#companyStreet2Res').hide();
    $('#companyCityRes').hide();
    $('#companyStateRes').hide();
    $('#companyPincodeRes').hide();
    $('#companyContactPersonRes').hide();
    $('#companyDesignationRes').hide();
    $('#companyPhNumberRes').hide();
    $('#companyMailIdRes').hide();
    $('#companyJobRes').hide();
    $('#companyReqRes').hide();

    $('.companySubmit').on('click', function () {
        var responce = "<div class='red'><hr><div class='col-lg-4 col-md-4 col-sm-0 col-xs-0'></div><div class='col-lg-4 col-md-4 col-sm-12 col-xs-12 addCompany'><hr><hr><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6' > Company Name: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyName}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> Type of company: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyType}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6' > Date: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyDate}}</label ><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> Time: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyTime}}</label><hr class = 'col-lg-11 col-md-11 col-sm-12 col-xs-12'><div id = 'tcompanyLocation' class = 'container-fluid' ><div class = 'row'>\<div class = 'col-lg-1 col-md-1 col-sm-0 col-xs-0'></div><div class = 'col-lg-10 col-md-10 col-sm-12 col-xs-12'><div class = 'col-lg-1 col-md-1 col-sm-0 col-xs-0'></div><fieldset id = 'tcompanyLocationField' class = 'col-lg-10 col-md-10 col-sm-12 col-xs-12'><center><legend> Company location </legend> </center><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> Door no: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyDoorNo}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> Street1: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyStreet1}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> Street2: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyStreet2}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> City: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyCity}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> State: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyState}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> Pincode: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyPincode}}</label></fieldset><div class = 'col-lg-1 col-md-1 col-sm-0 col-xs-0' ></div></div><div class = 'col-lg-1 col-md-1 col-sm-0 col-xs-0' ></div></div></div><br><div id = 'tcontactDetails' class = 'container-fluid' ><div class = 'row' ><div class = 'col-lg-1 col-md-1 col-sm-0 col-xs-0' > </div><div class = 'col-lg-10 col-md-10 col-sm-12 col-xs-12'><div class = 'col-lg-1 col-md-1 col-sm-0 col-xs-0' > </div><fieldset id = 'tcompanyLocationField' class = 'col-lg-10 col-md-10 col-sm-12 col-xs-12'><center><legend > Contact Details </legend></center><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> Name: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyContactName}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6'> Designation: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyDesignation}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6' > Ph Number: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyPhno}}</label><label class = 'col-lg-6 col-md-6 col-sm-6 col-xs-6' > MailId: </label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{companyMailId}}</label></fieldset><div class = 'col-lg-1 col-md-1 col-sm-0 col-xs-0'></div></div><div class = 'col-lg-1 col-md-1 col-sm-0 col-xs-0'></div></div></div><br><div><label class = 'col-lg-12 col-md-12 col-sm-12 col-xs-12' > Job Description: </label><div class = 'onTouchJobDescriptionContent col-lg-12 col-md-12 col-sm-12 col-xs-12'>{{companyJobDescription}}</div></div><div class = 'companyRequirements'><label class = ' col-lg-12 col-md-12 col-sm-12 col-xs-12' > Company Requirements: </label><div class = 'onTouchCompanyDescriptionContent col-lg-12 col-md-12 col-sm-12 col-xs-12'>{{companyRequirements}}</div></div></div><div class = 'col-lg-4 col-md-4 col-sm-0 col-xs-0'></div><div class = 'col-lg-12 col-md-12 col-sm-12 col-xs-12'><br></div></div></div></div>"
        var Add = "<div class='col-lg-4 col-md-4 col-sm-6 col-xs-12'><div class='panel'><div class='panel-header'><center><b>{{companyName}}</b></center></div><div class='panel-body'><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>Date</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{Date}}</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>Time</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{Time}}</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>Contact person</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{contactPerson}}</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>Contact number</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{contactNumber}}</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>Contact mail Id</label><label class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>{{contactMail}}</label><div class='btn btn-success col-lg-4 col-md-4 col-sm-4 col-xs-4 btn-sm'>Finish</div><div class='col-lg-4 col-md-4 col-sm-4 col-xs-4'></div><div class='btn btn-success col-lg-4 col-md-4 col-sm-4 col-xs-4 btn-sm'>Change</div></div>"
        var cName = $('#companyName').val();
        if (cName == "") {
            $('#companyNameRes').show();
        } else {
            $('#companyNameRes').hide();
        }
        var cType = $('#typeOfCompany').val();
        if (cType == 'Choose') {
            $('#companyTypeRes').show();
        } else {
            $('#companyTypeRes').hide();
        }

        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        var cgetDate = new Date($('#companyDate').val());
        var cDate = cgetDate.getDate() + '-' + months[cgetDate.getMonth()] + '-' + cgetDate.getFullYear();
        if (cDate == "NaN-undefined-NaN") {
            flag = 1;
            $('#companyDateRes').show();
        } else {
            $('#companyDateRes').hide();
        }

        var cTime = $('#companyTime').val();
        if (cTime == "") {
            $('#companyTimeRes').show();
        } else {
            $('#companyTimeRes').hide();
        }
        var cDoorNo = $('#doorNo').val();
        if (cDoorNo == "" ) {
            $('#companyDoorNoRes').show();
        } else {
            $('#companyDoorNoRes').hide();
        }
        var street1 = $('#street1').val();
        if (street1 == "" ) {
            $('#companyStreet1Res').show();
        } else {
            $('#companyStreet1Res').hide();
        }

        var street2 = $('#street2').val();
        if (street2 == "") {
            $('#companyStreet2Res').show();
        } else {
            $('#companyStreet2Res').hide();
        }
        var city = $('#city').val();
        if (city == "") {
            $('#companyCityRes').show();
        } else {
            $('#companyCityRes').hide();
        }
        var state = $('#state').val();
        if (state == "") {
            $('#companyStateRes').show();
        } else {
            $('#companyStateRes').hide();
        }
        var pinCode = $('#pinCode').val();
        if (pinCode == "") {
            $('#companyPincodeRes').show();
        } else {
            $('#companyPincodeRes').hide();
        }

        var cPerson = $('#contactName').val();
        if (cPerson == "") {
            $('#companyContactPersonRes').show();
            flag = 1;
        } else {
            flag = 0;
            $('#companyContactPersonRes').hide();
        }
        var designation = $('#designation').val();
        if (designation == "") {
            $('#companyDesignationRes').show();
            flag = 1;
        } else {
            flag = 0;
            $('#companyDesignationRes').hide();
        }
        var cNumber = $('#phoneNumber').val();
        if (cNumber == "" ) {
            $('#companyPhNumberRes').show();
            flag = 1;
        } else {
            flag = 0;
            $('#companyPhNumberRes').hide();
        }
        var cMail = $('#mailId').val();
        if (cMail == "" || /^[a-z0-9][a-z0-9_]+@[a-z]+.[a-z]{2,}$/.test(cMail) == false) {
            $('#companyMailIdRes').show();
            flag = 1;
        } else {
            flag = 0;
            $('#companyMailIdRes').hide();
        }
        var cjob = $('#jobDescriptionContent').val();
        if (cjob == "") {
            flag = 1;
            $('#companyJobRes').show();

        } else {
            flag = 0;
            $('#companyJobRes').hide();
        }
        var creq = $('#companyRequirementsContent').val();
        if (creq == "") {
            flag = 1;
            $('#companyReqRes').show();

        } else {
            flag = 0;
            $('#companyReqRes').hide();
        }


        if (cName == "" || cType == 'Choose' || cDate == "NaN-undefined-NaN" || cTime == "" || cDoorNo == "" || street1 == "" || street2 == ""|| city == ""|| state == "" || pinCode == "" || cPerson == "" || designation == "" || cNumber == "" || cMail == "" || /^[a-z0-9][a-z0-9_]+@[a-z]+.[a-z]{2,}$/.test(cMail) == false || cjob == ""|| creq == "" ) {
            alert("Please Fill the Required Files");
        } else {
            var res = Add.replace('{{companyName}}', cName).replace('{{Date}}', cDate).replace('{{Time}}', cTime).replace('{{contactPerson}}', cPerson).replace('{{contactNumber}}', cNumber).replace('{{contactMail}}', cMail);
            var addInfo=responce.replace('{{companyName}}',cName).replace('{{companyType}}',cType).replace('{{companyDate}}',cDate).replace('{{companyTime}}',cTime).replace('{{companyDoorNo}}',cDoorNo).replace('{{companyStreet1}}',street1).replace('{{companyStreet2}}',street2).replace('{{companyCity}}',city).replace('{{companyState}}',state).replace('{{companyPincode}}',pinCode).replace('{{companyContactName}}',cPerson).replace('{{companyDesignation}}',designation).replace('{{companyPhno}}',cNumber).replace('{{companyMailId}}',cMail).replace('{{companyJobDescription}}',cjob).replace('{{companyRequirements}}', creq);
            var let=res+addInfo;
            $('.getInto').append(let);
            $('.UpcomingAppointments').show();
            $('.onTouchComp').hide();
            $('.onTouchPost').hide();
            $('#addCom').hide();
            $('.postMeetingForm').hide();
            $('.reporting').hide();
            $('.red').hide();
        }
    })

    $('#logo').on('click',function(){
        $('#addCom').hide();
        $('.onTouchComp').hide();
        $('.postMeetingForm').hide();
        $('.mainPage').show();
        $('.UpcomingAppointments').show();
        $('.reporting').hide();
        $('.onTouchPost').hide();
        $('.rcom').hide();

    })

    $('.clickReMeeting').on('click', function () {
        $('.postReMeetingForm').hide();
        $('#addCom').hide();
        $('.panel').hide();
        $('.UpcomingAppointments').hide();
        $('.onTouchComp').hide();
        $('.onTouchPost').hide();
        $('.reMeeting').show();
        $('.postMeeting').hide();
        $('.postMeetingForm').hide();
        $('.rcom').show();
        $('.reporting').hide();
    })

    $('.clickPostMeeting').on('click', function () {
        $('#addCom').hide();
        $('.UpcomingAppointments').hide();
        $('.UpcomingAppointments').hide();
        $('.onTouchComp').hide();
        $('.onTouchPost').hide();
        $('.postMeeting').show();
        $('.reMeeting').hide();
        $('.postMeetingForm').hide();
        $('.reporting').hide();
    })

    $('.com').on('click', function () {
        $('.postMeetingDescriptionContent').val("");
        $('#addCom').hide();
        $('.onTouchComp').hide();
        $('.UpcomingAppointments').hide();
        $('.postMeeting').hide();
        $('.reMeeting').hide();
        $('.postMeetingForm').show();
        $('.reporting').hide();
    })

    $('.postMeetingDescription').click(function () {
        $('#addCom').hide();
        $('.onTouchComp').hide();
        $('.postMeetingForm').hide();
        $('.onTouchPost').show();
        $('.reporting').hide();
    })

    $('.onTouchPost').on('click', function () {
        $('#addCom').hide();
        $('.onTouchComp').hide();
        $(this).hide();
        $('.mainPage').show();
        $('.postMeetingForm').show();
        $('.reporting').hide();
    });

    $('.acceptPostButton').click(function () {
        $('#addCom').hide();
        $('.onTouchComp').hide();
        $('.postMeetingForm').hide();
        $('.mainPage').show();
        $('.UpcomingAppointments').show();
        $('.reporting').hide();
    });

    $('.reMeetingPostButton').click(function () {
        $('.remeetTime').val("");
        $('.remeetDate').val("");
        $('.remeetRequirements').val("");
        $('#addCom').hide();
        $('.onTouchComp').hide();
        $('.postMeetingForm').hide();
        $('.postReMeetingForm').show();
        $('.reporting').hide();
    });

    $('.makeAnAppointments').click(function () {
        $('#addCom').hide();
        $('.onTouchComp').hide();
        $('.postMeetingForm').hide();
        $('.postReMeetingForm').hide();
        $('.rcom').hide();
        $('.reporting').hide();
        $('.mainPage').show();
        $('.UpcomingAppointments').show();
        $('.panel').show();
    })

    $('.rcom').on('click', function () {
        $('.remeetTime').val("");
        $('.remeetDate').val("");
        $('.remeetRequirements').val("");
        $('#addCom').hide();
        $('.rcom').hide();
        $('.postReMeetingForm').show();
        $('.reporting').hide();
    })

    $('.reportPendingContent,.reportMonthPendingContent,.reportWeekPendingContent,.reportYearPendingContent').hide();
    $('.reportConcludedContent,.reportMonthConcludedContent,.reportWeekConcludedContent,.reportYearConcludedContent').hide();
    $('.reportOverallContent,.reportMonthOverallContent,.reportWeekOverallContent,.reportYearOverallContent').hide();
    $('.reportDayContent,.reportMonthContent,.reportWeekContent,.reportYearContent').hide();
    $('.reportDay,.reportMonth,.reportWeek,.reportYear').css('cursor', 'pointer');
    $('.reportPending,.reportMonthPending,.reportWeekPending,.reportYearPending').css('cursor', 'pointer');
    $('.reportConcluded,.reportMonthConcluded,.reportWeekConcluded,.reportYearConcluded').css('cursor', 'pointer');
    $('.reportOverall,.reportMonthOverall,.reportWeekOverall,.reportYearOverall').css('cursor', 'pointer');

    $('.reportDay').click(function () {
        $('.reportMonthContent').slideUp(1000);
        $('.reportWeekContent').slideUp(1000);
        $('.reportYearContent').slideUp(1000);
        $('.reportDayContent').slideToggle(1000);
        $('.reportPendingContent').slideUp();
        $('.reportConcludedContent').slideUp();
        $('.reportOverallContent').slideUp();
    })
    $('.reportMonth').click(function () {
        $('.reportDayContent').slideUp(1000);
        $('.reportWeekContent').slideUp(1000);
        $('.reportYearContent').slideUp(1000);
        $('.reportMonthContent').slideToggle(1000);
        $('.reportMonthPendingContent').slideUp();
        $('.reportMonthConcludedContent').slideUp();
        $('.reportMonthOverallContent').slideUp();
    })
    $('.reportWeek').click(function () {
        $('.reportDayContent').slideUp(1000);
        $('.reportMonthContent').slideUp(1000);
        $('.reportYearContent').slideUp(1000);
        $('.reportWeekContent').slideToggle(1000);
        $('.reportWeekPendingContent').slideUp();
        $('.reportWeekConcludedContent').slideUp();
        $('.reportWeekOverallContent').slideUp();
    })
    $('.reportYear').click(function () {
        $('.reportDayContent').slideUp(1000);
        $('.reportMonthContent').slideUp(1000);
        $('.reportWeekContent').slideUp(1000);
        $('.reportYearContent').slideToggle(1000);
        $('.reportYearPendingContent').slideUp();
        $('.reportYearConcludedContent').slideUp();
        $('.reportYearOverallContent').slideUp();
    })

    $('.reportPending').click(function () {
        $('.reportConcludedContent').slideUp(1000);
        $('.reportOverallContent').slideUp(1000);
        $('.reportPendingContent').slideToggle(1000);
    })
    $('.reportMonthPending').click(function () {
        $('.reportMonthConcludedContent').slideUp(1000);
        $('.reportMonthOverallContent').slideUp(1000);
        $('.reportMonthPendingContent').slideToggle(1000);
    })
    $('.reportWeekPending').click(function () {
        $('.reportWeekConcludedContent').slideUp(1000);
        $('.reportWeekOverallContent').slideUp(1000);
        $('.reportWeekPendingContent').slideToggle(1000);
    })
    $('.reportYearPending').click(function () {
        $('.reportYearConcludedContent').slideUp(1000);
        $('.reportYearOverallContent').slideUp(1000);
        $('.reportYearPendingContent').slideToggle(1000);
    })

    $('.reportConcluded').click(function () {
        $('.reportPendingContent').slideUp(1000);
        $('.reportOverallContent').slideUp(1000);
        $('.reportConcludedContent').slideToggle(1000);
    })
    $('.reportMonthConcluded').click(function () {
        $('.reportMonthPendingContent').slideUp(1000);
        $('.reportMonthOverallContent').slideUp(1000);
        $('.reportMonthConcludedContent').slideToggle(1000);
    })
    $('.reportWeekConcluded').click(function () {
        $('.reportWeekPendingContent').slideUp(1000);
        $('.reportWeekOverallContent').slideUp(1000);
        $('.reportWeekConcludedContent').slideToggle(1000);
    })
    $('.reportYearConcluded').click(function () {
        $('.reportYearPendingContent').slideUp(1000);
        $('.reportYearOverallContent').slideUp(1000);
        $('.reportYearConcludedContent').slideToggle(1000);
    })

    $('.reportOverall').click(function () {
        $('.reportPendingContent').slideUp(1000);
        $('.reportConcludedContent').slideUp(1000);
        $('.reportOverallContent').slideToggle(1000);
    })
    $('.reportMonthOverall').click(function () {
        $('.reportMonthPendingContent').slideUp(1000);
        $('.reportMonthConcludedContent').slideUp(1000);
        $('.reportMonthOverallContent').slideToggle(1000);
    })
    $('.reportWeekOverall').click(function () {
        $('.reportWeekPendingContent').slideUp(1000);
        $('.reportWeekConcludedContent').slideUp(1000);
        $('.reportWeekOverallContent').slideToggle(1000);
    })
    $('.reportYearOverall').click(function () {
        $('.reportYearPendingContent').slideUp(1000);
        $('.reportYearConcludedContent').slideUp(1000);
        $('.reportYearOverallContent').slideToggle(1000);
    })

    $('.report').on('click', function () {
        $('#from').val("");
        $('#to').val("");
        $('.postMeeting').hide();
        $('.reMeeting').hide();
        $('#addCom').hide();
        $('.postReMeetingForm').hide();
        $('.rcom').hide();
        $('.postMeetingForm').hide();
        $('.mainPage').show();
        $('.UpcomingAppointments').hide();
        $('.reporting').show();
    })


})