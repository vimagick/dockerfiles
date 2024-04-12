#!/usr/bin/env python

import gradio as gr

def greet(name):
    return "Hello " + name + "!"

demo = gr.Interface(fn=greet, inputs="text", outputs="text", allow_flagging="never")
demo.launch()
