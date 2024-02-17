library(shiny)
library(readxl) # 用于读取Excel文件
library(writexl) # 用于写入Excel文件
library(readr) # 用于读取和写入CSV文件

# 定义用户界面
ui <- fluidPage(
  titlePanel("合并两个表"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "column_name",
        "请选择要用于合并的列名：",
        choices = NULL # 初始时没有选项
      ),
      fileInput(
        "input_path1",
        "选择第一个表文件：",
        accept = c(".xlsx", ".csv", ".txt")
      ),
      fileInput(
        "input_path2",
        "选择第二个表文件：",
        accept = c(".xlsx", ".csv", ".txt")
      ),
      actionButton("submit", "合并"),
      downloadButton("downloadData", "下载合并后的表格")
    ),
    mainPanel(
      tableOutput("output") # 修改为tableOutput以显示表格
    )
  )
)

# 定义服务器端逻辑
server <- function(input, output, session) {
  
  # 监听文件输入，更新列名选择器
  observe({
    req(input$input_path1) # 确保用户已上传文件
    table1 <- read_excel(input$input_path1$datapath)
    updateSelectInput(session, "column_name", choices = names(table1))
  })
  
  # 用于存储合并后的表格
  mergedData <- reactiveVal()
  
  # 合并表格的逻辑移到这里
  output$output <- renderTable({
    req(input$submit) # 确保用户点击了合并按钮
    req(input$column_name) # 确保列名已选择
    table1 <- read_excel(input$input_path1$datapath)
    table2 <- read_excel(input$input_path2$datapath)
    
    # 检查列名是否在两个表中
    if (!input$column_name %in% names(table1) || !input$column_name %in% names(table2)) {
      stop("两张表中至少有一张表不包含指定的列名！")
    }
    
    # 合并两个表
    merged_table <- merge(table1, table2, by = input$column_name)
    mergedData(merged_table) # 存储合并后的数据以便下载
    merged_table
  })
  
  # 定义下载功能
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("merged-data-", Sys.Date(), ".xlsx", sep = "")
    },
    content = function(file) {
      req(mergedData()) # 确保有数据可下载
      ext <- tools::file_ext(file)
      switch(ext,
             xlsx = write_xlsx(mergedData(), file),
             csv = write_csv(mergedData(), file),
             txt = write.table(mergedData(), file, row.names = FALSE, col.names = NA, sep = "\t"),
             tsv = write_delim(mergedData(), file, delim = "\t"),
             stop("不支持的文件格式")
      )
    }
  )
}

# 运行 Shiny 应用
shinyApp(ui = ui, server = server)
