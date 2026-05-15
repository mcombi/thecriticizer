# thecriticizer

A bash script that criticizes everything, randomly and without remorse.

## Usage

**Criticize a specific thing:**
```bash
./the_tool.sh "your architecture"
./the_tool.sh "tabs vs spaces" "the metaverse" "your last PR"
```

**Pipe things in:**
```bash
echo "microservices" | ./the_tool.sh
ls | ./the_tool.sh
```

**Criticize something random:**
```bash
./the_tool.sh
```

## Example output

```
  Hot take: "your git history" is a cry for help.
  It peaked years ago and has been in decline since. I said what I said.
```

## How it works

Each critique is assembled from four randomly selected components: an opener, a verdict, a reason, and a closer. The result is delivered with full confidence and zero accountability.
