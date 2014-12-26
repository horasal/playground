use vamos
import vamos/graphics/Label
import vamos/Entity
import structs/ArrayList

MessageList: class extends Entity{
    font: Label
    msg: ArrayList<String> = ArrayList<String> new()
    counter: ArrayList<Double> = ArrayList<Double> new()

    hlimit: Int = -1

    duration: Double = 1.0

    init: func(filename: String, w, h: Int){
        font = Label new(filename, w, h, "")
        graphic = font
    }

    add: func(m: String){
        msg add(m)
        counter add(0.)
        while(hlimit > 0 && msg size * font frameHeight * font scale > hlimit){
            counter removeAt(0)
            msg removeAt(0)
        }
    }

    update: func(dt: Double){
        if(!msg empty?()){
            for(i in 0..counter size){
                counter[i] = counter[i] + dt
                if(counter[i] > duration){
                    msg removeAt(i)
                    counter removeAt(i)
                }
            }
            tm := ""
            for(m in msg){
                tm += m+"\n"
            }
            font text = tm
        }
        super(dt)
    }
}
