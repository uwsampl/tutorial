import tvm
from tvm import relay
import tvm.relay.testing
from tvm.relay.expr_functor import ExprMutator

class ScheduleConv2d(ExprMutator):
    def __init__(self, device):
        self.device = device
        super().__init__()

    def visit_call(self, expr):
        visit = super().visit_call(expr)
        if expr.op == tvm.relay.op.get("nn.conv2d"):
            return relay.annotation.on_device(visit, self.device)
        else:
            return visit

def schedule_conv2d_on_gpu(expr):
    sched = ScheduleConv2d(tvm.gpu(0))
    return sched.visit(expr)

resnet, params = relay.testing.resnet.get_workload()
print(resnet)
resnet = schedule_conv2d_on_gpu(resnet)
print(resnet)
resnet = relay.ir_pass.rewrite_annotated_ops(resnet, 0)
print(resnet)
