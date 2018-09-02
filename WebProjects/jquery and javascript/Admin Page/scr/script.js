$(document).ready(function () {
    $('html').css('background-color', 'grey')

    $('.adminPendingContent,.adminMonthPendingContent,.adminWeekPendingContent,.adminYearPendingContent').hide();
    $('.adminConcludedContent,.adminMonthConcludedContent,.adminWeekConcludedContent,.adminYearConcludedContent').hide();
    $('.adminOverallContent,.adminMonthOverallContent,.adminWeekOverallContent,.adminYearOverallContent').hide();
    $('.adminDayContent,.adminMonthContent,.adminWeekContent,.adminYearContent').hide();
    $('.adminDay,.adminMonth,.adminWeek,.adminYear').css('cursor', 'pointer');
    $('.adminPending,.adminMonthPending,.adminWeekPending,.adminYearPending').css('cursor', 'pointer');
    $('.adminConcluded,.adminMonthConcluded,.adminWeekConcluded,.adminYearConcluded').css('cursor', 'pointer');
    $('.adminOverall,.adminMonthOverall,.adminWeekOverall,.adminYearOverall').css('cursor', 'pointer');

    $('.adminDay').click(function () {
        $('.adminMonthContent').slideUp(1000);
        $('.adminWeekContent').slideUp(1000);
        $('.adminYearContent').slideUp(1000);
        $('.adminDayContent').slideToggle(1000);
        $('.adminPendingContent').slideUp();
        $('.adminConcludedContent').slideUp();
        $('.adminOverallContent').slideUp();
    })
    $('.adminMonth').click(function () {
        $('.adminDayContent').slideUp(1000);
        $('.adminWeekContent').slideUp(1000);
        $('.adminYearContent').slideUp(1000);
        $('.adminMonthContent').slideToggle(1000);
        $('.adminMonthPendingContent').slideUp();
        $('.adminMonthConcludedContent').slideUp();
        $('.adminMonthOverallContent').slideUp();
    })
    $('.adminWeek').click(function () {
        $('.adminDayContent').slideUp(1000);
        $('.adminMonthContent').slideUp(1000);
        $('.adminYearContent').slideUp(1000);
        $('.adminWeekContent').slideToggle(1000);
        $('.adminWeekPendingContent').slideUp();
        $('.adminWeekConcludedContent').slideUp();
        $('.adminWeekOverallContent').slideUp();
    })
    $('.adminYear').click(function () {
        $('.adminDayContent').slideUp(1000);
        $('.adminMonthContent').slideUp(1000);
        $('.adminWeekContent').slideUp(1000);
        $('.adminYearContent').slideToggle(1000);
        $('.adminYearPendingContent').slideUp();
        $('.adminYearConcludedContent').slideUp();
        $('.adminYearOverallContent').slideUp();
    })

    $('.adminPending').click(function () {
        $('.adminConcludedContent').slideUp(1000);
        $('.adminOverallContent').slideUp(1000);
        $('.adminPendingContent').slideToggle(1000);
    })
    $('.adminMonthPending').click(function () {
        $('.adminMonthConcludedContent').slideUp(1000);
        $('.adminMonthOverallContent').slideUp(1000);
        $('.adminMonthPendingContent').slideToggle(1000);
    })
    $('.adminWeekPending').click(function () {
        $('.adminWeekConcludedContent').slideUp(1000);
        $('.adminWeekOverallContent').slideUp(1000);
        $('.adminWeekPendingContent').slideToggle(1000);
    })
    $('.adminYearPending').click(function () {
        $('.adminYearConcludedContent').slideUp(1000);
        $('.adminYearOverallContent').slideUp(1000);
        $('.adminYearPendingContent').slideToggle(1000);
    })

    $('.adminConcluded').click(function () {
        $('.adminPendingContent').slideUp(1000);
        $('.adminOverallContent').slideUp(1000);
        $('.adminConcludedContent').slideToggle(1000);
    })
    $('.adminMonthConcluded').click(function () {
        $('.adminMonthPendingContent').slideUp(1000);
        $('.adminMonthOverallContent').slideUp(1000);
        $('.adminMonthConcludedContent').slideToggle(1000);
    })
    $('.adminWeekConcluded').click(function () {
        $('.adminWeekPendingContent').slideUp(1000);
        $('.adminWeekOverallContent').slideUp(1000);
        $('.adminWeekConcludedContent').slideToggle(1000);
    })
    $('.adminYearConcluded').click(function () {
        $('.adminYearPendingContent').slideUp(1000);
        $('.adminYearOverallContent').slideUp(1000);
        $('.adminYearConcludedContent').slideToggle(1000);
    })

    $('.adminOverall').click(function () {
        $('.adminPendingContent').slideUp(1000);
        $('.adminConcludedContent').slideUp(1000);
        $('.adminOverallContent').slideToggle(1000);
    })
    $('.adminMonthOverall').click(function () {
        $('.adminMonthPendingContent').slideUp(1000);
        $('.adminMonthConcludedContent').slideUp(1000);
        $('.adminMonthOverallContent').slideToggle(1000);
    })
    $('.adminWeekOverall').click(function () {
        $('.adminWeekPendingContent').slideUp(1000);
        $('.adminWeekConcludedContent').slideUp(1000);
        $('.adminWeekOverallContent').slideToggle(1000);
    })
    $('.adminYearOverall').click(function () {
        $('.adminYearPendingContent').slideUp(1000);
        $('.adminYearConcludedContent').slideUp(1000);
        $('.adminYearOverallContent').slideToggle(1000);
    })


    $('.chooseUser').hide();
    
    $('#chooseFirst').on('change',function(){
        $('.overallFirstContent').hide();
        $('.chooseUser').hide();
        $('.' + $(this).val()).show();
    })

});