# BymUpSideDownBtn
BymUpSideDownBtn

# Requirements
- iOS 8.0+

# description
这是一个自定义子控件的按钮

# Install
`pod 'BymUpSideDownBtn', '~> 0.0.1'`

# Warning
### 当然,如果你使用我的控件,请赋予他图片和文字两个属性.

# Usage

### 两个属性轻松搞定,按钮排布问题~~

  1. distributing 决定按钮的分布
  
       ``` 
       public enum distributing : Int {
          //水平排布 从左往右排开  没有间隙 图片文字
          case h_l_img_Label
          //水平排布 从左往右排开  没有间隙 文字图片
          case h_l_label_Img
          //水平排布 内容整体居中排开  文字-间距-图片
          case h_c_label_margin_img
          //水平排布 内容整体居中排开  图片-间距-文字
          case h_c_img_margin_label
          //垂直排布 居中排开    图片-间距-文字
          case v_c_img_margin_label
          //垂直排布 居中排开    文字-间距-图片
          case v_c_label_margin_img
          //垂直排布 从上往下排开 图片置顶端
          case v_t_img_margin_Label
          //垂直排布 从下往上排开 图片置底端
          case v_b_img_margin_Label
      }
      ```
       
  2. margin 决定按钮的间距
      ```
      ///文字和按钮的默认间距是10
      var margin:CGFloat = 10
      ```

# License
BymUpSideDownBtn is released under the Apache license. See LICENSE for details.
