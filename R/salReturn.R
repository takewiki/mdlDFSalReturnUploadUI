#' 销售订单数据同步任务生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' salReturnUI()
salReturnUI <- function(tabTitle ='BYD销售退货上传模板',
                       colTitles =c('操作区域','操作区域','显示区域'),
                       widthRates =c(6,6,12),
                       func_left = salReturnUI_left,
                       func_right =salReturnUI_right,
                       func_bottom = salReturnUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' salReturnUI_left()
salReturnUI_left <- function() {


  res <- tagList(


    tsui::uiTemplate(templateName = 'BYD销售退货上传模板'),
    tsui::mdl_file(id = 'text_salReturn_upload',label ='上传文件' ),


    shiny::actionButton(inputId = 'btn_salReturn_upload',label = '上传文件')



  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' salReturnUI_bottom()
salReturnUI_right <- function() {
  res <- tagList(

    tsui::mdl_dateRange(id ='text_salReturn_daterange' ,label = '要求日期-日期范围'),

    shiny::actionButton(inputId = 'btn_salReturn_view',label = '按日期查询'),
    #
    tsui::mdl_download_button(id = 'dl_salReturn',label = '下载查询记录到EXCEL'),


  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' salReturnUI_bottom()
salReturnUI_bottom <- function() {
  res <- tagList(

    tsui::uiScrollX(tsui::mdl_dataTable(id = 'salReturn_resultView',label ='结果显示' ))

  )
  return(res)

}
