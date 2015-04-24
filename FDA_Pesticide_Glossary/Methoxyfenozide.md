---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.212944, -0.08945275, -2.816409, 1, 0, 0, 1,
-2.78741, 0.3520813, -2.069356, 1, 0.007843138, 0, 1,
-2.671708, 0.006075799, -2.995341, 1, 0.01176471, 0, 1,
-2.645169, 0.1944067, -2.556276, 1, 0.01960784, 0, 1,
-2.633992, -0.481585, -1.521354, 1, 0.02352941, 0, 1,
-2.554476, -0.5316831, -2.149707, 1, 0.03137255, 0, 1,
-2.464981, -2.094048, -1.581211, 1, 0.03529412, 0, 1,
-2.464355, -1.143454, -2.795548, 1, 0.04313726, 0, 1,
-2.424274, 0.3843857, -0.5341303, 1, 0.04705882, 0, 1,
-2.411687, -0.02163679, -0.01789661, 1, 0.05490196, 0, 1,
-2.364473, 0.7041276, -2.402686, 1, 0.05882353, 0, 1,
-2.357625, 0.99376, -0.5300052, 1, 0.06666667, 0, 1,
-2.307605, -0.8769906, -2.027907, 1, 0.07058824, 0, 1,
-2.281775, -2.037063, -2.997412, 1, 0.07843138, 0, 1,
-2.252829, 0.2161979, -1.536688, 1, 0.08235294, 0, 1,
-2.218639, -0.6623557, -1.587669, 1, 0.09019608, 0, 1,
-2.191493, 0.4572226, -1.679038, 1, 0.09411765, 0, 1,
-2.177244, 1.047731, -0.4426773, 1, 0.1019608, 0, 1,
-2.162374, 1.287136, -1.584976, 1, 0.1098039, 0, 1,
-2.160414, -0.3740274, -2.18871, 1, 0.1137255, 0, 1,
-2.075163, 0.4050728, -1.423937, 1, 0.1215686, 0, 1,
-2.068964, 1.363356, 0.8305478, 1, 0.1254902, 0, 1,
-2.068541, -0.3357119, -1.07733, 1, 0.1333333, 0, 1,
-2.044062, -1.637481, -1.972687, 1, 0.1372549, 0, 1,
-2.012482, -1.36319, -0.6254352, 1, 0.145098, 0, 1,
-1.999424, -0.4930166, -3.007183, 1, 0.1490196, 0, 1,
-1.991473, 1.372847, -2.159241, 1, 0.1568628, 0, 1,
-1.940106, 0.8010531, -1.333891, 1, 0.1607843, 0, 1,
-1.920229, -0.6565474, -2.236274, 1, 0.1686275, 0, 1,
-1.867263, 0.8175802, -0.5347441, 1, 0.172549, 0, 1,
-1.818262, -0.5979443, -2.373827, 1, 0.1803922, 0, 1,
-1.809731, -1.230512, -4.531975, 1, 0.1843137, 0, 1,
-1.807571, -0.4237994, -1.656671, 1, 0.1921569, 0, 1,
-1.804657, -0.1971996, -2.009517, 1, 0.1960784, 0, 1,
-1.797666, 0.2925541, -1.664396, 1, 0.2039216, 0, 1,
-1.787476, 2.039514, 0.1769162, 1, 0.2117647, 0, 1,
-1.773236, -0.6832278, -1.870035, 1, 0.2156863, 0, 1,
-1.7369, 1.404767, -0.3640521, 1, 0.2235294, 0, 1,
-1.730909, -0.6907421, -3.185192, 1, 0.227451, 0, 1,
-1.677222, 1.785355, -0.4571524, 1, 0.2352941, 0, 1,
-1.665173, -0.371116, -1.07349, 1, 0.2392157, 0, 1,
-1.659751, -0.8605821, -1.393971, 1, 0.2470588, 0, 1,
-1.659356, -1.720197, -2.981683, 1, 0.2509804, 0, 1,
-1.653551, 0.2899675, -1.447816, 1, 0.2588235, 0, 1,
-1.652419, 0.8427609, 1.49703, 1, 0.2627451, 0, 1,
-1.648498, -0.3019624, -0.7702505, 1, 0.2705882, 0, 1,
-1.640941, 0.790957, -3.45038, 1, 0.2745098, 0, 1,
-1.639771, 1.11791, -2.387805, 1, 0.282353, 0, 1,
-1.639213, -0.71618, -1.480474, 1, 0.2862745, 0, 1,
-1.629247, -0.02356071, -1.314635, 1, 0.2941177, 0, 1,
-1.624902, -1.080146, -1.27804, 1, 0.3019608, 0, 1,
-1.602026, -0.0986264, -1.913669, 1, 0.3058824, 0, 1,
-1.594839, -0.0442611, -1.476965, 1, 0.3137255, 0, 1,
-1.584258, -0.3399882, -1.787565, 1, 0.3176471, 0, 1,
-1.577863, 1.529738, -2.138923, 1, 0.3254902, 0, 1,
-1.566019, 1.906905, -1.761178, 1, 0.3294118, 0, 1,
-1.552, 0.07597888, -2.091874, 1, 0.3372549, 0, 1,
-1.549942, -1.382228, -3.0082, 1, 0.3411765, 0, 1,
-1.543471, 1.034638, 0.401908, 1, 0.3490196, 0, 1,
-1.540091, 0.09715118, -3.57992, 1, 0.3529412, 0, 1,
-1.538343, 0.5496218, -4.275982, 1, 0.3607843, 0, 1,
-1.511248, 0.1780081, -3.119309, 1, 0.3647059, 0, 1,
-1.505846, -0.0993072, -0.4806013, 1, 0.372549, 0, 1,
-1.501401, 0.5377661, -0.9407587, 1, 0.3764706, 0, 1,
-1.497681, -0.7378522, -2.344051, 1, 0.3843137, 0, 1,
-1.495577, 0.1967364, -2.545529, 1, 0.3882353, 0, 1,
-1.493286, 0.4200957, -1.247121, 1, 0.3960784, 0, 1,
-1.486714, -0.392581, -0.914327, 1, 0.4039216, 0, 1,
-1.483135, 1.927445, -1.85336, 1, 0.4078431, 0, 1,
-1.478677, 0.3865676, -1.59356, 1, 0.4156863, 0, 1,
-1.471846, 0.0355273, -0.5347489, 1, 0.4196078, 0, 1,
-1.449138, -0.5881343, -2.189804, 1, 0.427451, 0, 1,
-1.442566, 0.07663222, 0.120603, 1, 0.4313726, 0, 1,
-1.429839, -0.6452973, -1.48104, 1, 0.4392157, 0, 1,
-1.429197, 1.069729, -2.000621, 1, 0.4431373, 0, 1,
-1.415337, 0.7256287, 0.2842112, 1, 0.4509804, 0, 1,
-1.411965, -1.774433, -2.448646, 1, 0.454902, 0, 1,
-1.411856, 0.05394083, -1.181684, 1, 0.4627451, 0, 1,
-1.408149, 1.05613, -1.157788, 1, 0.4666667, 0, 1,
-1.400521, 1.505925, -0.943554, 1, 0.4745098, 0, 1,
-1.400335, 0.140161, -4.053244, 1, 0.4784314, 0, 1,
-1.397487, -0.1041392, -4.436206, 1, 0.4862745, 0, 1,
-1.396644, 0.9467301, -1.603653, 1, 0.4901961, 0, 1,
-1.394207, 0.1448976, -1.562068, 1, 0.4980392, 0, 1,
-1.369516, 0.3788158, -1.877666, 1, 0.5058824, 0, 1,
-1.367045, 0.7811484, -1.66545, 1, 0.509804, 0, 1,
-1.358051, -0.3845217, -1.637531, 1, 0.5176471, 0, 1,
-1.350065, -0.3169148, -0.1176574, 1, 0.5215687, 0, 1,
-1.349582, -0.06475852, -2.998649, 1, 0.5294118, 0, 1,
-1.348603, -1.257514, -2.901024, 1, 0.5333334, 0, 1,
-1.340653, -0.6106902, -1.011924, 1, 0.5411765, 0, 1,
-1.326721, 1.024635, -1.647997, 1, 0.5450981, 0, 1,
-1.324352, -0.05499329, -2.200687, 1, 0.5529412, 0, 1,
-1.323368, -0.3099598, -0.2484509, 1, 0.5568628, 0, 1,
-1.31773, -1.350097, -1.90494, 1, 0.5647059, 0, 1,
-1.315408, -1.227039, -3.499944, 1, 0.5686275, 0, 1,
-1.307598, 0.02518263, -3.475674, 1, 0.5764706, 0, 1,
-1.30623, -0.1065492, -1.74126, 1, 0.5803922, 0, 1,
-1.303321, 0.4194378, -1.607358, 1, 0.5882353, 0, 1,
-1.301961, -1.114437, -3.2181, 1, 0.5921569, 0, 1,
-1.299504, -1.122024, -2.604046, 1, 0.6, 0, 1,
-1.295867, -0.5596733, -2.10987, 1, 0.6078432, 0, 1,
-1.284942, -0.04499408, -1.95056, 1, 0.6117647, 0, 1,
-1.284547, -0.4853337, -2.134027, 1, 0.6196079, 0, 1,
-1.284455, -0.9526993, -2.228053, 1, 0.6235294, 0, 1,
-1.284321, 0.8853041, -1.842785, 1, 0.6313726, 0, 1,
-1.275033, -0.3283521, -0.7354332, 1, 0.6352941, 0, 1,
-1.274016, -0.3378059, -1.540195, 1, 0.6431373, 0, 1,
-1.268374, 1.147308, -2.768371, 1, 0.6470588, 0, 1,
-1.268313, 0.5532274, -0.4767627, 1, 0.654902, 0, 1,
-1.266331, 0.5672663, -1.142888, 1, 0.6588235, 0, 1,
-1.264651, -0.4407829, -0.5278459, 1, 0.6666667, 0, 1,
-1.263593, -0.7186557, -2.138618, 1, 0.6705883, 0, 1,
-1.260578, -1.49516, -0.729479, 1, 0.6784314, 0, 1,
-1.258197, 0.4724247, -0.9489602, 1, 0.682353, 0, 1,
-1.255983, -0.9684287, -1.003189, 1, 0.6901961, 0, 1,
-1.252105, -0.2079797, -0.466076, 1, 0.6941177, 0, 1,
-1.248289, 0.9635363, -0.3602249, 1, 0.7019608, 0, 1,
-1.240005, -0.2066525, -1.725257, 1, 0.7098039, 0, 1,
-1.222374, 0.8449669, -0.4809696, 1, 0.7137255, 0, 1,
-1.222263, 1.607322, -0.7810919, 1, 0.7215686, 0, 1,
-1.219028, -0.5104377, -1.924028, 1, 0.7254902, 0, 1,
-1.214452, 0.7039195, -1.301556, 1, 0.7333333, 0, 1,
-1.207801, -0.7314485, -1.782647, 1, 0.7372549, 0, 1,
-1.20203, 1.184617, 0.06812118, 1, 0.7450981, 0, 1,
-1.200147, 3.274849, -0.4275143, 1, 0.7490196, 0, 1,
-1.19889, 1.164428, -1.431332, 1, 0.7568628, 0, 1,
-1.198782, -0.4739083, -0.062362, 1, 0.7607843, 0, 1,
-1.191825, 0.8016679, -0.2107188, 1, 0.7686275, 0, 1,
-1.173556, -0.247126, -1.23058, 1, 0.772549, 0, 1,
-1.171618, -0.8151577, -2.841582, 1, 0.7803922, 0, 1,
-1.171043, -1.366223, -1.539782, 1, 0.7843137, 0, 1,
-1.169676, -1.128543, -2.635844, 1, 0.7921569, 0, 1,
-1.15897, -0.531521, -1.283205, 1, 0.7960784, 0, 1,
-1.1566, -0.7519314, -0.769202, 1, 0.8039216, 0, 1,
-1.145081, 0.5455759, -0.008478904, 1, 0.8117647, 0, 1,
-1.143537, 1.499776, -2.92663, 1, 0.8156863, 0, 1,
-1.137327, 1.324209, -0.8954483, 1, 0.8235294, 0, 1,
-1.134324, 1.421463, -1.095796, 1, 0.827451, 0, 1,
-1.13419, 0.04898089, -2.454243, 1, 0.8352941, 0, 1,
-1.127589, 1.169001, -0.2949993, 1, 0.8392157, 0, 1,
-1.124301, 1.115043, 0.4541791, 1, 0.8470588, 0, 1,
-1.123934, 0.4496271, -1.376052, 1, 0.8509804, 0, 1,
-1.117427, 2.470123, -1.450386, 1, 0.8588235, 0, 1,
-1.108108, 0.1214041, -0.3830259, 1, 0.8627451, 0, 1,
-1.10568, 0.9741072, -0.3014498, 1, 0.8705882, 0, 1,
-1.104634, -0.008213774, -1.960791, 1, 0.8745098, 0, 1,
-1.103498, 0.2990295, -0.5262393, 1, 0.8823529, 0, 1,
-1.089166, 1.340229, -1.75199, 1, 0.8862745, 0, 1,
-1.081915, 0.9734883, -2.001727, 1, 0.8941177, 0, 1,
-1.080654, -0.537761, -2.224453, 1, 0.8980392, 0, 1,
-1.077448, 0.2805704, -2.626285, 1, 0.9058824, 0, 1,
-1.06716, 1.073086, 0.1591888, 1, 0.9137255, 0, 1,
-1.067129, 1.679306, -0.7482511, 1, 0.9176471, 0, 1,
-1.066437, 0.3488383, -0.009191138, 1, 0.9254902, 0, 1,
-1.064646, -0.7129686, -1.628069, 1, 0.9294118, 0, 1,
-1.063752, -0.4026357, -1.701556, 1, 0.9372549, 0, 1,
-1.055076, -0.0005345769, -0.08772027, 1, 0.9411765, 0, 1,
-1.051737, 0.827171, -3.569426, 1, 0.9490196, 0, 1,
-1.048763, 1.613269, 1.384262, 1, 0.9529412, 0, 1,
-1.046167, -0.3408461, -2.583197, 1, 0.9607843, 0, 1,
-1.040156, -0.2741013, -2.419738, 1, 0.9647059, 0, 1,
-1.039764, -0.302001, -3.229257, 1, 0.972549, 0, 1,
-1.036769, -0.3085155, -2.971193, 1, 0.9764706, 0, 1,
-1.035884, 0.7075442, -1.670312, 1, 0.9843137, 0, 1,
-1.03463, 1.500391, 0.4689261, 1, 0.9882353, 0, 1,
-1.030653, -0.7738715, -2.586306, 1, 0.9960784, 0, 1,
-1.026806, 1.193973, -0.9009901, 0.9960784, 1, 0, 1,
-1.024985, 1.601714, 0.0553196, 0.9921569, 1, 0, 1,
-1.0241, -0.1987501, -1.700277, 0.9843137, 1, 0, 1,
-1.023389, -0.4746656, -2.126715, 0.9803922, 1, 0, 1,
-1.019657, 1.698257, 1.572327, 0.972549, 1, 0, 1,
-1.011724, -0.1348399, -1.614402, 0.9686275, 1, 0, 1,
-1.00529, -1.571994, -0.649824, 0.9607843, 1, 0, 1,
-0.9952636, 1.327915, -0.6929576, 0.9568627, 1, 0, 1,
-0.9836643, -0.1715471, -1.373084, 0.9490196, 1, 0, 1,
-0.9817867, 1.152848, -0.2390833, 0.945098, 1, 0, 1,
-0.9699014, -0.7093796, -1.385667, 0.9372549, 1, 0, 1,
-0.9678188, 0.9137273, -0.7397814, 0.9333333, 1, 0, 1,
-0.9556266, -0.5918513, -3.4931, 0.9254902, 1, 0, 1,
-0.955076, 0.09633145, -0.6304564, 0.9215686, 1, 0, 1,
-0.9540132, 1.642317, -3.167969, 0.9137255, 1, 0, 1,
-0.9537635, 0.3071613, 0.02059817, 0.9098039, 1, 0, 1,
-0.9534499, -2.032421, -2.76407, 0.9019608, 1, 0, 1,
-0.9514094, -0.145635, -1.442023, 0.8941177, 1, 0, 1,
-0.9491734, 1.747125, -1.964327, 0.8901961, 1, 0, 1,
-0.9473015, 0.3645997, -0.5121456, 0.8823529, 1, 0, 1,
-0.9452597, -1.467392, -3.732741, 0.8784314, 1, 0, 1,
-0.9413119, -0.5953157, -2.834326, 0.8705882, 1, 0, 1,
-0.9316276, 0.8684917, -0.3676072, 0.8666667, 1, 0, 1,
-0.9294405, -0.7328572, -3.603633, 0.8588235, 1, 0, 1,
-0.9287346, 0.5911858, -0.3957913, 0.854902, 1, 0, 1,
-0.9254247, 0.8815008, -1.364014, 0.8470588, 1, 0, 1,
-0.9252116, -0.03024863, -1.764818, 0.8431373, 1, 0, 1,
-0.9189188, 2.14174, -1.306148, 0.8352941, 1, 0, 1,
-0.9148557, 1.540213, 0.5666672, 0.8313726, 1, 0, 1,
-0.9105816, -0.2692724, 0.2081251, 0.8235294, 1, 0, 1,
-0.9099296, -0.4987139, -0.9268806, 0.8196079, 1, 0, 1,
-0.9096113, -1.53504, -2.075131, 0.8117647, 1, 0, 1,
-0.9050454, -0.01235396, -1.332437, 0.8078431, 1, 0, 1,
-0.9049435, 1.272007, -2.863996, 0.8, 1, 0, 1,
-0.9038986, -1.063629, -3.221643, 0.7921569, 1, 0, 1,
-0.9031584, 1.505066, -0.7471666, 0.7882353, 1, 0, 1,
-0.9022998, 1.115423, 0.4430833, 0.7803922, 1, 0, 1,
-0.8997126, -1.796766, -3.263467, 0.7764706, 1, 0, 1,
-0.8964117, 0.8828129, -0.2736939, 0.7686275, 1, 0, 1,
-0.8921461, -1.03749, -1.536168, 0.7647059, 1, 0, 1,
-0.8860648, 1.159166, -1.08269, 0.7568628, 1, 0, 1,
-0.8854464, -1.456156, -3.417283, 0.7529412, 1, 0, 1,
-0.8840008, 2.044669, -1.175879, 0.7450981, 1, 0, 1,
-0.8818108, 0.2560876, -1.195956, 0.7411765, 1, 0, 1,
-0.8817306, -1.767809, -4.282586, 0.7333333, 1, 0, 1,
-0.8783808, -0.3134373, -1.330602, 0.7294118, 1, 0, 1,
-0.864504, 0.008696357, -1.298466, 0.7215686, 1, 0, 1,
-0.8638262, 0.2085515, -0.7608687, 0.7176471, 1, 0, 1,
-0.8620012, -1.11282, -2.64813, 0.7098039, 1, 0, 1,
-0.8595864, -0.2325643, -2.537077, 0.7058824, 1, 0, 1,
-0.8574156, 0.3217833, -2.447615, 0.6980392, 1, 0, 1,
-0.8548894, -0.7162141, -2.560181, 0.6901961, 1, 0, 1,
-0.8528318, 0.5831214, -0.997284, 0.6862745, 1, 0, 1,
-0.8500642, -0.09088936, -1.624581, 0.6784314, 1, 0, 1,
-0.8464051, 0.1126784, -2.022331, 0.6745098, 1, 0, 1,
-0.8426316, 1.447383, -0.8395037, 0.6666667, 1, 0, 1,
-0.8411381, 0.7580439, -1.28562, 0.6627451, 1, 0, 1,
-0.8406193, 1.036712, 0.3802002, 0.654902, 1, 0, 1,
-0.8359548, 2.049898, -0.7750033, 0.6509804, 1, 0, 1,
-0.8332282, -0.442109, -3.390878, 0.6431373, 1, 0, 1,
-0.8300802, 0.8237188, -2.382307, 0.6392157, 1, 0, 1,
-0.8240724, 0.1971579, -1.726614, 0.6313726, 1, 0, 1,
-0.8232644, -0.2456813, -0.8038048, 0.627451, 1, 0, 1,
-0.8197501, -0.6473892, -2.570969, 0.6196079, 1, 0, 1,
-0.81438, -0.7674201, -3.789921, 0.6156863, 1, 0, 1,
-0.811769, 0.1725854, -0.832842, 0.6078432, 1, 0, 1,
-0.8116423, 0.823726, 0.8877607, 0.6039216, 1, 0, 1,
-0.8081201, -0.8458483, -2.055961, 0.5960785, 1, 0, 1,
-0.8053094, -0.6705552, -2.269717, 0.5882353, 1, 0, 1,
-0.803571, -0.7299528, -1.373721, 0.5843138, 1, 0, 1,
-0.7909026, -0.249663, -2.02288, 0.5764706, 1, 0, 1,
-0.7871516, -1.761251, -3.854892, 0.572549, 1, 0, 1,
-0.7851416, -0.9823667, -4.115436, 0.5647059, 1, 0, 1,
-0.7830003, 0.6114373, -0.929068, 0.5607843, 1, 0, 1,
-0.782371, 0.02893944, -1.904492, 0.5529412, 1, 0, 1,
-0.7729749, 1.652102, -0.04485309, 0.5490196, 1, 0, 1,
-0.7598516, 1.479361, -1.069445, 0.5411765, 1, 0, 1,
-0.7581747, 0.9643732, -1.719156, 0.5372549, 1, 0, 1,
-0.7560958, -0.1385134, 0.01106837, 0.5294118, 1, 0, 1,
-0.7554435, 0.3244382, -1.246849, 0.5254902, 1, 0, 1,
-0.7508045, 0.7425921, -0.4973991, 0.5176471, 1, 0, 1,
-0.7450563, 1.154665, -0.5374104, 0.5137255, 1, 0, 1,
-0.7449079, 0.7383569, -0.2053209, 0.5058824, 1, 0, 1,
-0.7418953, 0.5830686, -1.157072, 0.5019608, 1, 0, 1,
-0.7409592, -2.441825, -3.351411, 0.4941176, 1, 0, 1,
-0.7406334, -1.689973, -0.7749541, 0.4862745, 1, 0, 1,
-0.7389695, 0.4225382, -1.025984, 0.4823529, 1, 0, 1,
-0.7379727, -0.02229526, -1.930657, 0.4745098, 1, 0, 1,
-0.7362245, 0.7249545, -1.318499, 0.4705882, 1, 0, 1,
-0.7349314, -1.225379, -2.490262, 0.4627451, 1, 0, 1,
-0.7252867, -0.4878682, -1.055415, 0.4588235, 1, 0, 1,
-0.7198914, -0.4016778, -1.60087, 0.4509804, 1, 0, 1,
-0.7174236, 0.704741, -1.750877, 0.4470588, 1, 0, 1,
-0.715953, -0.9346433, -3.608946, 0.4392157, 1, 0, 1,
-0.714056, -2.842478, -2.058585, 0.4352941, 1, 0, 1,
-0.7096195, 0.01867905, -0.666716, 0.427451, 1, 0, 1,
-0.7042988, 1.170424, 0.1721153, 0.4235294, 1, 0, 1,
-0.7001307, -1.883037, -3.192771, 0.4156863, 1, 0, 1,
-0.6999447, -0.3659253, -4.403656, 0.4117647, 1, 0, 1,
-0.6975173, 0.03430847, -1.209213, 0.4039216, 1, 0, 1,
-0.6915437, 0.3043752, -0.8175584, 0.3960784, 1, 0, 1,
-0.6874166, -1.473657, -2.198124, 0.3921569, 1, 0, 1,
-0.6804717, 0.9947667, -3.018044, 0.3843137, 1, 0, 1,
-0.6768164, 1.823575, 0.4270838, 0.3803922, 1, 0, 1,
-0.6734087, 0.7582799, 0.6330922, 0.372549, 1, 0, 1,
-0.6724519, -0.4835652, -2.960747, 0.3686275, 1, 0, 1,
-0.6705978, -0.590689, -2.729136, 0.3607843, 1, 0, 1,
-0.6654807, -0.2172702, -1.322631, 0.3568628, 1, 0, 1,
-0.6595212, 1.450515, 0.3158799, 0.3490196, 1, 0, 1,
-0.6592811, 1.184324, 0.7104326, 0.345098, 1, 0, 1,
-0.6574471, -0.1150216, -3.050802, 0.3372549, 1, 0, 1,
-0.6568526, 0.6534404, -1.295669, 0.3333333, 1, 0, 1,
-0.6525048, 1.333491, -0.5942144, 0.3254902, 1, 0, 1,
-0.6324618, 0.8588654, -0.6824476, 0.3215686, 1, 0, 1,
-0.6310668, -0.04847338, -0.8690403, 0.3137255, 1, 0, 1,
-0.6277931, -0.1561868, -3.50283, 0.3098039, 1, 0, 1,
-0.6277298, -0.4267671, -1.393399, 0.3019608, 1, 0, 1,
-0.6267843, 0.8839129, -0.2335539, 0.2941177, 1, 0, 1,
-0.626072, 1.038283, 0.1200342, 0.2901961, 1, 0, 1,
-0.6182337, -1.012825, -1.324637, 0.282353, 1, 0, 1,
-0.6108756, -0.2506545, -2.413993, 0.2784314, 1, 0, 1,
-0.5961566, 1.0665, -0.7823924, 0.2705882, 1, 0, 1,
-0.5923419, 0.8656225, -1.474885, 0.2666667, 1, 0, 1,
-0.5920338, -2.235667, -3.330259, 0.2588235, 1, 0, 1,
-0.5875821, -1.760954, -3.019378, 0.254902, 1, 0, 1,
-0.5821568, -1.679932, -3.366139, 0.2470588, 1, 0, 1,
-0.5815473, -1.792293, -4.440243, 0.2431373, 1, 0, 1,
-0.5798367, 0.6844044, -0.2480222, 0.2352941, 1, 0, 1,
-0.5777058, 0.2551963, -0.6850483, 0.2313726, 1, 0, 1,
-0.5773801, -1.495231, -3.165058, 0.2235294, 1, 0, 1,
-0.5751201, 0.3928634, -2.219025, 0.2196078, 1, 0, 1,
-0.5749063, -2.108709, -3.330006, 0.2117647, 1, 0, 1,
-0.5716873, 0.05244111, -3.161837, 0.2078431, 1, 0, 1,
-0.5706884, -0.1524287, -0.2129129, 0.2, 1, 0, 1,
-0.5706447, 0.7217544, 0.7633277, 0.1921569, 1, 0, 1,
-0.5696027, 0.3264082, -1.053136, 0.1882353, 1, 0, 1,
-0.557445, 0.11722, -0.6602172, 0.1803922, 1, 0, 1,
-0.5567399, 0.6947615, 0.9708989, 0.1764706, 1, 0, 1,
-0.5507666, -1.833008, -3.809425, 0.1686275, 1, 0, 1,
-0.550036, 2.515707, -0.4849255, 0.1647059, 1, 0, 1,
-0.5488639, -0.6275626, -3.654437, 0.1568628, 1, 0, 1,
-0.5481637, 1.1723, -0.6675329, 0.1529412, 1, 0, 1,
-0.5475186, -0.09017046, -0.4427952, 0.145098, 1, 0, 1,
-0.5448316, -1.343143, -3.102583, 0.1411765, 1, 0, 1,
-0.5403911, 0.7509465, 0.07297263, 0.1333333, 1, 0, 1,
-0.5390206, -0.8776293, -2.486738, 0.1294118, 1, 0, 1,
-0.5381652, -0.05452697, -1.895658, 0.1215686, 1, 0, 1,
-0.5362074, -0.9609917, -3.266285, 0.1176471, 1, 0, 1,
-0.5261999, 0.4355742, -1.015749, 0.1098039, 1, 0, 1,
-0.5216997, 1.038931, -0.5591093, 0.1058824, 1, 0, 1,
-0.5212868, -1.505561, -2.411875, 0.09803922, 1, 0, 1,
-0.5199041, -0.04453108, -1.743453, 0.09019608, 1, 0, 1,
-0.5184564, 0.4356771, -0.3199321, 0.08627451, 1, 0, 1,
-0.5118519, 0.4051277, -0.1485274, 0.07843138, 1, 0, 1,
-0.5112746, -2.31575, -2.997366, 0.07450981, 1, 0, 1,
-0.5073495, 0.8683616, 0.7150789, 0.06666667, 1, 0, 1,
-0.5068904, 0.81406, -0.7298238, 0.0627451, 1, 0, 1,
-0.5044518, 0.7402591, 0.924021, 0.05490196, 1, 0, 1,
-0.5019774, 0.2904535, -0.3274924, 0.05098039, 1, 0, 1,
-0.4937772, -0.485677, -1.912447, 0.04313726, 1, 0, 1,
-0.491759, -1.436616, -4.60695, 0.03921569, 1, 0, 1,
-0.4891528, -2.113636, -3.270236, 0.03137255, 1, 0, 1,
-0.4871083, 1.628197, -1.132199, 0.02745098, 1, 0, 1,
-0.4810566, 2.030655, -1.626549, 0.01960784, 1, 0, 1,
-0.4798953, 0.37347, -1.484714, 0.01568628, 1, 0, 1,
-0.4761563, -0.1396369, -1.938081, 0.007843138, 1, 0, 1,
-0.4718128, 0.6109408, -0.2531335, 0.003921569, 1, 0, 1,
-0.4595292, -0.2018686, -1.643894, 0, 1, 0.003921569, 1,
-0.4517037, 0.2580776, -0.9392358, 0, 1, 0.01176471, 1,
-0.4509253, 0.3859039, -0.4365102, 0, 1, 0.01568628, 1,
-0.4492052, 1.595534, -0.6530207, 0, 1, 0.02352941, 1,
-0.4471331, -1.90861, -0.4819292, 0, 1, 0.02745098, 1,
-0.4470701, 0.2443025, -2.530085, 0, 1, 0.03529412, 1,
-0.4444332, 1.597691, 0.8492587, 0, 1, 0.03921569, 1,
-0.4351506, -0.112543, -0.9279843, 0, 1, 0.04705882, 1,
-0.4333069, -0.6568918, -2.452187, 0, 1, 0.05098039, 1,
-0.4252932, -0.7532138, -3.39679, 0, 1, 0.05882353, 1,
-0.4231389, 1.347719, -1.218547, 0, 1, 0.0627451, 1,
-0.4173024, 0.5756955, -0.6738216, 0, 1, 0.07058824, 1,
-0.4125446, 0.9131062, -0.7525928, 0, 1, 0.07450981, 1,
-0.4105067, 1.274179, 0.3825273, 0, 1, 0.08235294, 1,
-0.4024878, -0.04692395, 0.9978397, 0, 1, 0.08627451, 1,
-0.397288, -1.553484, -3.438295, 0, 1, 0.09411765, 1,
-0.39612, 0.9876379, -0.3640864, 0, 1, 0.1019608, 1,
-0.3935276, 1.152752, -1.013441, 0, 1, 0.1058824, 1,
-0.3895937, -0.9070448, -2.274775, 0, 1, 0.1137255, 1,
-0.3868298, 0.09025801, -2.618241, 0, 1, 0.1176471, 1,
-0.3858085, -1.441684, -4.421738, 0, 1, 0.1254902, 1,
-0.3820281, 0.9518242, 0.6266882, 0, 1, 0.1294118, 1,
-0.378822, -2.440007, -3.273238, 0, 1, 0.1372549, 1,
-0.3768168, -0.9406615, -2.973239, 0, 1, 0.1411765, 1,
-0.3753401, -0.461363, -3.013977, 0, 1, 0.1490196, 1,
-0.3731847, -0.829612, -1.290775, 0, 1, 0.1529412, 1,
-0.3728521, 0.367455, -1.678035, 0, 1, 0.1607843, 1,
-0.3676939, 0.9577678, -0.114627, 0, 1, 0.1647059, 1,
-0.3662837, 1.610562, -0.06758737, 0, 1, 0.172549, 1,
-0.3587606, 0.8463407, -2.667319, 0, 1, 0.1764706, 1,
-0.3576218, -0.7661008, -0.8982745, 0, 1, 0.1843137, 1,
-0.3572215, -1.138214, -5.788342, 0, 1, 0.1882353, 1,
-0.3554716, 0.9478616, -1.46284, 0, 1, 0.1960784, 1,
-0.3553168, 0.7176563, -0.003976833, 0, 1, 0.2039216, 1,
-0.352742, -0.9819504, -3.827574, 0, 1, 0.2078431, 1,
-0.3517135, -1.175801, -2.808822, 0, 1, 0.2156863, 1,
-0.3495109, -0.3776133, -3.28156, 0, 1, 0.2196078, 1,
-0.3430532, -1.332277, -1.31739, 0, 1, 0.227451, 1,
-0.3363009, -0.1782012, -1.481104, 0, 1, 0.2313726, 1,
-0.326295, 1.232046, -2.601003, 0, 1, 0.2392157, 1,
-0.3218642, 0.3453983, -2.28538, 0, 1, 0.2431373, 1,
-0.3207785, 1.028622, -0.8271222, 0, 1, 0.2509804, 1,
-0.3186655, -0.1928078, -1.824813, 0, 1, 0.254902, 1,
-0.3151585, -0.4700604, -1.186111, 0, 1, 0.2627451, 1,
-0.3135063, -0.8871492, -2.573713, 0, 1, 0.2666667, 1,
-0.310371, 1.827792, 0.3660706, 0, 1, 0.2745098, 1,
-0.3036989, -0.3709636, -1.10593, 0, 1, 0.2784314, 1,
-0.3016017, 0.4975736, -0.5844793, 0, 1, 0.2862745, 1,
-0.297496, -0.5062963, -2.524215, 0, 1, 0.2901961, 1,
-0.2961716, -1.165927, -2.383682, 0, 1, 0.2980392, 1,
-0.2913761, -0.07079069, -2.501889, 0, 1, 0.3058824, 1,
-0.291076, -0.2621978, -3.374959, 0, 1, 0.3098039, 1,
-0.291056, -0.5658886, -1.89756, 0, 1, 0.3176471, 1,
-0.2904887, 0.167369, -1.955111, 0, 1, 0.3215686, 1,
-0.2838583, -0.2858039, -3.271352, 0, 1, 0.3294118, 1,
-0.2828007, 1.990251, 0.7461268, 0, 1, 0.3333333, 1,
-0.2827127, -0.94481, -2.703199, 0, 1, 0.3411765, 1,
-0.2816809, -0.7985682, -2.942588, 0, 1, 0.345098, 1,
-0.2801, -0.659242, -1.881301, 0, 1, 0.3529412, 1,
-0.2674408, 0.2560294, -0.3609099, 0, 1, 0.3568628, 1,
-0.2664996, 0.4548891, -1.995685, 0, 1, 0.3647059, 1,
-0.265211, 1.662642, -1.106836, 0, 1, 0.3686275, 1,
-0.2631167, 0.3249829, 0.6081535, 0, 1, 0.3764706, 1,
-0.2552655, -1.108854, -3.170062, 0, 1, 0.3803922, 1,
-0.2550466, -1.537239, -3.720926, 0, 1, 0.3882353, 1,
-0.2540507, 0.2663538, -0.2230084, 0, 1, 0.3921569, 1,
-0.2535132, 1.851461, -0.3830175, 0, 1, 0.4, 1,
-0.2530493, -0.4544535, -1.724364, 0, 1, 0.4078431, 1,
-0.2530041, 0.532676, -0.673297, 0, 1, 0.4117647, 1,
-0.2523054, -1.179922, -4.142927, 0, 1, 0.4196078, 1,
-0.2485921, -0.6269618, -2.73039, 0, 1, 0.4235294, 1,
-0.2438619, 1.679296, 0.03356088, 0, 1, 0.4313726, 1,
-0.2435051, -0.8699157, -1.406679, 0, 1, 0.4352941, 1,
-0.2343576, -1.670628, -1.97664, 0, 1, 0.4431373, 1,
-0.2308735, 1.346919, -1.087909, 0, 1, 0.4470588, 1,
-0.2275227, 0.716256, 0.7943978, 0, 1, 0.454902, 1,
-0.2178834, -1.337259, -4.431261, 0, 1, 0.4588235, 1,
-0.216826, 0.8706575, 0.1540858, 0, 1, 0.4666667, 1,
-0.2123712, -0.3215785, -3.24504, 0, 1, 0.4705882, 1,
-0.2085908, -0.186552, -2.020624, 0, 1, 0.4784314, 1,
-0.2065013, -0.06406727, -1.920302, 0, 1, 0.4823529, 1,
-0.1998733, -1.209044, -0.9826655, 0, 1, 0.4901961, 1,
-0.1934885, 0.4473738, -1.204099, 0, 1, 0.4941176, 1,
-0.1863125, -0.9532011, -1.764448, 0, 1, 0.5019608, 1,
-0.1861805, 0.8696969, 1.262928, 0, 1, 0.509804, 1,
-0.1859464, 1.753381, -0.02151619, 0, 1, 0.5137255, 1,
-0.1856638, 0.7821608, 0.2405272, 0, 1, 0.5215687, 1,
-0.1841635, -0.1436873, -2.730382, 0, 1, 0.5254902, 1,
-0.1832452, -0.5106624, -0.757363, 0, 1, 0.5333334, 1,
-0.1831712, 0.6910937, 1.695459, 0, 1, 0.5372549, 1,
-0.1830157, 1.215235, 1.201545, 0, 1, 0.5450981, 1,
-0.1800876, 0.4807769, -0.5695279, 0, 1, 0.5490196, 1,
-0.1785358, -0.1293329, -1.804591, 0, 1, 0.5568628, 1,
-0.1695427, -0.1657456, -2.692117, 0, 1, 0.5607843, 1,
-0.1650321, 1.151637, 1.935156, 0, 1, 0.5686275, 1,
-0.1641879, -0.4072977, -2.614472, 0, 1, 0.572549, 1,
-0.1603378, -0.2064121, -1.393286, 0, 1, 0.5803922, 1,
-0.1597563, -0.4226538, -2.579592, 0, 1, 0.5843138, 1,
-0.1589475, 0.6654816, -0.7425393, 0, 1, 0.5921569, 1,
-0.1572412, 1.009261, -0.9053644, 0, 1, 0.5960785, 1,
-0.1570606, -0.03934446, -1.194777, 0, 1, 0.6039216, 1,
-0.1557705, 0.4114431, 1.696858, 0, 1, 0.6117647, 1,
-0.1490235, -1.061286, -3.523871, 0, 1, 0.6156863, 1,
-0.1358764, 1.111406, -0.7806501, 0, 1, 0.6235294, 1,
-0.1315056, 0.1463452, 0.0396657, 0, 1, 0.627451, 1,
-0.1245309, 1.286572, -0.2478141, 0, 1, 0.6352941, 1,
-0.1241643, -1.076921, -3.394602, 0, 1, 0.6392157, 1,
-0.1234111, 0.1266635, 0.4416766, 0, 1, 0.6470588, 1,
-0.1202898, -1.540341, -3.54604, 0, 1, 0.6509804, 1,
-0.115604, 0.04903014, -1.667976, 0, 1, 0.6588235, 1,
-0.1136949, -1.065993, -2.493433, 0, 1, 0.6627451, 1,
-0.1114137, -0.4701203, -2.455773, 0, 1, 0.6705883, 1,
-0.1084563, 0.5658998, -0.09505601, 0, 1, 0.6745098, 1,
-0.1062518, -1.213538, -2.904389, 0, 1, 0.682353, 1,
-0.1026767, 1.051988, 1.730922, 0, 1, 0.6862745, 1,
-0.09424685, 1.426455, 0.204947, 0, 1, 0.6941177, 1,
-0.09180171, 1.269303, -0.8218459, 0, 1, 0.7019608, 1,
-0.08809882, -0.6646625, -2.740124, 0, 1, 0.7058824, 1,
-0.08641367, -0.0746745, -1.727368, 0, 1, 0.7137255, 1,
-0.0850685, 1.408895, -0.4776354, 0, 1, 0.7176471, 1,
-0.07913628, 1.352949, -0.8955287, 0, 1, 0.7254902, 1,
-0.07436247, 0.6692966, 1.543345, 0, 1, 0.7294118, 1,
-0.07183377, -0.2204413, -2.900472, 0, 1, 0.7372549, 1,
-0.070534, 0.6707206, 0.4677768, 0, 1, 0.7411765, 1,
-0.06997021, -0.8838425, -3.848213, 0, 1, 0.7490196, 1,
-0.06862244, 0.7440357, 0.3139299, 0, 1, 0.7529412, 1,
-0.06567483, -0.1010845, -3.637389, 0, 1, 0.7607843, 1,
-0.06518786, 0.7241378, 1.623979, 0, 1, 0.7647059, 1,
-0.06471818, 1.437203, 0.4643031, 0, 1, 0.772549, 1,
-0.06018522, -0.5810642, -2.595284, 0, 1, 0.7764706, 1,
-0.05569021, -0.2330723, -2.743222, 0, 1, 0.7843137, 1,
-0.05568479, 0.9234565, 0.8879659, 0, 1, 0.7882353, 1,
-0.04986674, -0.6878391, -3.186925, 0, 1, 0.7960784, 1,
-0.04935911, 0.8526143, -0.3558594, 0, 1, 0.8039216, 1,
-0.04811902, 1.122403, -2.055199, 0, 1, 0.8078431, 1,
-0.04630333, -1.716915, -4.385803, 0, 1, 0.8156863, 1,
-0.03973979, -0.267125, -1.946418, 0, 1, 0.8196079, 1,
-0.03962878, -2.132433, -4.454183, 0, 1, 0.827451, 1,
-0.03122956, -0.06048022, -3.655859, 0, 1, 0.8313726, 1,
-0.03028391, -0.187864, -3.979024, 0, 1, 0.8392157, 1,
-0.03026182, 0.5508088, 0.2979731, 0, 1, 0.8431373, 1,
-0.02764191, 1.271155, 1.312249, 0, 1, 0.8509804, 1,
-0.02661664, 1.543404, 0.1227518, 0, 1, 0.854902, 1,
-0.02421054, -0.8028352, -3.862547, 0, 1, 0.8627451, 1,
-0.02045601, 0.7216811, 1.669071, 0, 1, 0.8666667, 1,
-0.0169887, -0.6238723, -1.719131, 0, 1, 0.8745098, 1,
-0.01602699, 0.7083573, -0.07651641, 0, 1, 0.8784314, 1,
-0.01236982, 1.60946, -0.2806595, 0, 1, 0.8862745, 1,
-0.01116049, 0.02377194, 0.2646904, 0, 1, 0.8901961, 1,
-0.009780574, -0.83596, -5.017427, 0, 1, 0.8980392, 1,
-0.006572829, -1.669389, -3.021413, 0, 1, 0.9058824, 1,
-0.003130567, 0.1488096, 0.9437683, 0, 1, 0.9098039, 1,
-0.001041544, 2.962258, 0.1002739, 0, 1, 0.9176471, 1,
0.002055873, 0.655875, -1.359238, 0, 1, 0.9215686, 1,
0.003835228, -0.6320689, 2.561787, 0, 1, 0.9294118, 1,
0.005006869, 0.294969, 0.8762492, 0, 1, 0.9333333, 1,
0.0081105, 0.2069008, -0.1491311, 0, 1, 0.9411765, 1,
0.01059293, 0.4270248, 0.3805954, 0, 1, 0.945098, 1,
0.012809, 0.1473936, 1.763269, 0, 1, 0.9529412, 1,
0.0133225, 0.1682034, -0.319944, 0, 1, 0.9568627, 1,
0.01587965, -0.2524592, 3.030327, 0, 1, 0.9647059, 1,
0.01742525, -0.6868693, 4.015099, 0, 1, 0.9686275, 1,
0.01786189, -0.4621579, 5.099544, 0, 1, 0.9764706, 1,
0.01788102, -0.5158315, 3.350418, 0, 1, 0.9803922, 1,
0.02023195, 0.6997773, 1.472028, 0, 1, 0.9882353, 1,
0.0270992, 0.9708388, -1.595467, 0, 1, 0.9921569, 1,
0.02861086, 0.8812119, 0.440736, 0, 1, 1, 1,
0.02879634, -0.4460927, 3.475262, 0, 0.9921569, 1, 1,
0.03104104, 0.08558836, 2.230009, 0, 0.9882353, 1, 1,
0.0311302, 1.491266, 1.664375, 0, 0.9803922, 1, 1,
0.03269989, 0.9790767, -0.3544, 0, 0.9764706, 1, 1,
0.03651762, -0.5112225, 2.443497, 0, 0.9686275, 1, 1,
0.03688774, 0.3484349, -0.439698, 0, 0.9647059, 1, 1,
0.04309477, 1.733412, 0.4189775, 0, 0.9568627, 1, 1,
0.04701889, -0.2119796, 1.2155, 0, 0.9529412, 1, 1,
0.04751926, 0.04144211, 1.021288, 0, 0.945098, 1, 1,
0.05487404, -0.6266392, 1.308685, 0, 0.9411765, 1, 1,
0.06527305, 2.174201, 0.671556, 0, 0.9333333, 1, 1,
0.06708198, 1.070979, -0.5659491, 0, 0.9294118, 1, 1,
0.06938327, 0.4416533, -1.102589, 0, 0.9215686, 1, 1,
0.06992336, -1.410138, 2.259434, 0, 0.9176471, 1, 1,
0.07150217, 0.5233932, -0.3951213, 0, 0.9098039, 1, 1,
0.07699525, 0.9164973, -0.2611888, 0, 0.9058824, 1, 1,
0.07762436, 0.9114421, -0.03926049, 0, 0.8980392, 1, 1,
0.07822557, 0.1054922, 1.675016, 0, 0.8901961, 1, 1,
0.0792759, 0.005630091, 2.250516, 0, 0.8862745, 1, 1,
0.07930061, -0.9573668, 4.774963, 0, 0.8784314, 1, 1,
0.08064885, -0.1099237, 3.160297, 0, 0.8745098, 1, 1,
0.08331116, 0.4940545, 0.2293332, 0, 0.8666667, 1, 1,
0.08552731, 0.6870618, -0.6822278, 0, 0.8627451, 1, 1,
0.08669289, -0.1027576, 3.330483, 0, 0.854902, 1, 1,
0.08870146, 0.5953946, -0.3308131, 0, 0.8509804, 1, 1,
0.08965864, -0.4896121, 2.44883, 0, 0.8431373, 1, 1,
0.09127576, 1.185242, 0.8013121, 0, 0.8392157, 1, 1,
0.09325139, 0.7236553, 1.504976, 0, 0.8313726, 1, 1,
0.09435379, 0.05401072, 0.5451366, 0, 0.827451, 1, 1,
0.09582947, 0.0009013123, 1.918993, 0, 0.8196079, 1, 1,
0.1000146, 0.2502162, -0.2914115, 0, 0.8156863, 1, 1,
0.10037, -0.809358, 2.002063, 0, 0.8078431, 1, 1,
0.1012785, 1.075497, 1.885023, 0, 0.8039216, 1, 1,
0.1014688, -1.293818, 3.510722, 0, 0.7960784, 1, 1,
0.1109311, 0.4015917, -0.9090125, 0, 0.7882353, 1, 1,
0.1113951, 1.403288, 2.169112, 0, 0.7843137, 1, 1,
0.1162765, 0.4397296, 0.1773678, 0, 0.7764706, 1, 1,
0.1250892, -0.2762562, 0.27094, 0, 0.772549, 1, 1,
0.1252964, -0.9872769, 2.280438, 0, 0.7647059, 1, 1,
0.1258095, -0.4059136, 3.209117, 0, 0.7607843, 1, 1,
0.1266033, -0.3380872, 2.716777, 0, 0.7529412, 1, 1,
0.1299427, -0.1496414, 1.518282, 0, 0.7490196, 1, 1,
0.1326783, 0.8604171, 1.468514, 0, 0.7411765, 1, 1,
0.1331866, -0.2265311, 3.290356, 0, 0.7372549, 1, 1,
0.1331958, -0.03544508, 1.639781, 0, 0.7294118, 1, 1,
0.1364144, -0.3986836, 3.696109, 0, 0.7254902, 1, 1,
0.1395235, 0.4454759, -0.07295471, 0, 0.7176471, 1, 1,
0.140899, -0.2842013, 2.23511, 0, 0.7137255, 1, 1,
0.1435072, 0.009997359, 2.423533, 0, 0.7058824, 1, 1,
0.1474061, 0.4150409, 0.3116772, 0, 0.6980392, 1, 1,
0.1498327, 0.6338795, 0.205699, 0, 0.6941177, 1, 1,
0.1504523, -0.7330111, 2.951135, 0, 0.6862745, 1, 1,
0.1506972, -0.7900103, 4.084424, 0, 0.682353, 1, 1,
0.155093, 0.4307866, -0.4666896, 0, 0.6745098, 1, 1,
0.1555684, -0.7668571, 3.459832, 0, 0.6705883, 1, 1,
0.1565074, -2.479356, 3.408851, 0, 0.6627451, 1, 1,
0.1615716, 0.8831114, 0.687875, 0, 0.6588235, 1, 1,
0.1649908, 1.101397, -0.1202446, 0, 0.6509804, 1, 1,
0.1659333, 0.9394119, 0.2394599, 0, 0.6470588, 1, 1,
0.1701763, -1.293809, 2.221884, 0, 0.6392157, 1, 1,
0.1725006, -1.285272, 4.146241, 0, 0.6352941, 1, 1,
0.1762664, -1.563082, 3.12026, 0, 0.627451, 1, 1,
0.1782235, -0.9095501, 2.873806, 0, 0.6235294, 1, 1,
0.179004, -0.3814025, 2.079761, 0, 0.6156863, 1, 1,
0.1795367, -0.9051805, 2.785484, 0, 0.6117647, 1, 1,
0.1822627, -2.215151, 2.779514, 0, 0.6039216, 1, 1,
0.187877, 0.696996, 1.08284, 0, 0.5960785, 1, 1,
0.1887071, -0.1633413, 2.081746, 0, 0.5921569, 1, 1,
0.1920916, 0.7181543, -1.145763, 0, 0.5843138, 1, 1,
0.1922547, 0.6298656, 0.4647682, 0, 0.5803922, 1, 1,
0.1957195, -0.8583922, 4.549902, 0, 0.572549, 1, 1,
0.1961139, 0.6234671, 0.5375742, 0, 0.5686275, 1, 1,
0.2008, 1.115574, 0.7412043, 0, 0.5607843, 1, 1,
0.2040516, -0.09957711, 3.493065, 0, 0.5568628, 1, 1,
0.2075234, 0.3106093, 0.5435002, 0, 0.5490196, 1, 1,
0.209917, 2.142671, 0.8328217, 0, 0.5450981, 1, 1,
0.2147953, -1.223783, 2.88474, 0, 0.5372549, 1, 1,
0.2149687, -0.6091099, 2.689479, 0, 0.5333334, 1, 1,
0.2161553, 0.4453507, -1.370181, 0, 0.5254902, 1, 1,
0.2196557, 0.4435939, 0.9731377, 0, 0.5215687, 1, 1,
0.2210513, -1.429506, 1.472034, 0, 0.5137255, 1, 1,
0.2305786, -0.1340664, 2.949175, 0, 0.509804, 1, 1,
0.2316722, -1.446711, 2.121717, 0, 0.5019608, 1, 1,
0.2322124, -0.1840282, 2.537075, 0, 0.4941176, 1, 1,
0.2384157, -0.04952211, 4.188768, 0, 0.4901961, 1, 1,
0.2402758, 1.307554, -0.9719189, 0, 0.4823529, 1, 1,
0.2407498, -0.5207936, 2.432806, 0, 0.4784314, 1, 1,
0.2480601, 1.728715, 0.785988, 0, 0.4705882, 1, 1,
0.2489953, -0.2831772, 1.533789, 0, 0.4666667, 1, 1,
0.2491255, 2.045703, -1.09226, 0, 0.4588235, 1, 1,
0.250015, 1.063926, 0.03827881, 0, 0.454902, 1, 1,
0.2534606, 1.075841, -0.1158435, 0, 0.4470588, 1, 1,
0.2541798, 0.7940614, -1.161957, 0, 0.4431373, 1, 1,
0.2577753, -1.040236, 1.697972, 0, 0.4352941, 1, 1,
0.2607897, 0.3504138, 1.768269, 0, 0.4313726, 1, 1,
0.2639143, -0.9488723, 1.740585, 0, 0.4235294, 1, 1,
0.2656765, 0.9514964, -1.396904, 0, 0.4196078, 1, 1,
0.2660339, 0.4326781, 0.6056797, 0, 0.4117647, 1, 1,
0.2703157, -0.460447, 1.183068, 0, 0.4078431, 1, 1,
0.2735029, 1.831598, 2.015142, 0, 0.4, 1, 1,
0.2751496, -0.4552896, 2.382641, 0, 0.3921569, 1, 1,
0.2836984, -1.547383, 2.177681, 0, 0.3882353, 1, 1,
0.286611, -1.637875, 3.157148, 0, 0.3803922, 1, 1,
0.2883888, 1.008092, 1.388744, 0, 0.3764706, 1, 1,
0.291515, -1.204376, 4.18342, 0, 0.3686275, 1, 1,
0.2926327, -1.529519, 2.110148, 0, 0.3647059, 1, 1,
0.306385, -0.07310679, 0.6401594, 0, 0.3568628, 1, 1,
0.3069032, -0.05322494, 3.063844, 0, 0.3529412, 1, 1,
0.3071102, 0.04879703, 2.359225, 0, 0.345098, 1, 1,
0.309877, -0.2941146, 1.128472, 0, 0.3411765, 1, 1,
0.3125239, -0.8899243, 2.206616, 0, 0.3333333, 1, 1,
0.3130906, 1.869919, 1.511596, 0, 0.3294118, 1, 1,
0.3148898, 1.005147, 1.198795, 0, 0.3215686, 1, 1,
0.3167481, 1.305128, -1.212355, 0, 0.3176471, 1, 1,
0.3169491, -0.5268651, 2.440883, 0, 0.3098039, 1, 1,
0.3180216, 0.05230175, 1.508947, 0, 0.3058824, 1, 1,
0.3240232, 0.6776136, 2.569353, 0, 0.2980392, 1, 1,
0.3244255, -0.6152722, 2.684115, 0, 0.2901961, 1, 1,
0.3252391, 1.36253, 0.323144, 0, 0.2862745, 1, 1,
0.3264655, -0.0987113, 1.116709, 0, 0.2784314, 1, 1,
0.3309954, 0.1699055, -0.3556696, 0, 0.2745098, 1, 1,
0.3314316, -0.3963701, 4.307593, 0, 0.2666667, 1, 1,
0.3319815, 0.6241521, 1.608979, 0, 0.2627451, 1, 1,
0.3319929, -1.593831, 3.857224, 0, 0.254902, 1, 1,
0.3334237, 0.2132777, -1.6088, 0, 0.2509804, 1, 1,
0.3391853, -0.6098709, 3.63035, 0, 0.2431373, 1, 1,
0.339405, -0.6967542, 3.919019, 0, 0.2392157, 1, 1,
0.3394431, 1.592401, 0.5155401, 0, 0.2313726, 1, 1,
0.3399624, -0.2814009, 2.327348, 0, 0.227451, 1, 1,
0.3465537, -0.7802258, 3.308619, 0, 0.2196078, 1, 1,
0.348052, 1.5038, 0.5184869, 0, 0.2156863, 1, 1,
0.3497829, 0.2199729, 0.4223087, 0, 0.2078431, 1, 1,
0.3519311, -0.2906411, 1.17616, 0, 0.2039216, 1, 1,
0.3535136, 0.07442535, 2.638695, 0, 0.1960784, 1, 1,
0.3540977, -0.7336638, 2.837688, 0, 0.1882353, 1, 1,
0.3567488, 0.7191349, 0.927134, 0, 0.1843137, 1, 1,
0.3604673, -0.6466618, 3.154941, 0, 0.1764706, 1, 1,
0.3642673, 1.184791, -0.2377313, 0, 0.172549, 1, 1,
0.3659882, -0.4632038, 1.801037, 0, 0.1647059, 1, 1,
0.3663644, 0.3444645, 0.6374961, 0, 0.1607843, 1, 1,
0.3685641, 0.9554786, 1.407881, 0, 0.1529412, 1, 1,
0.375404, -0.0547817, 1.261502, 0, 0.1490196, 1, 1,
0.3773989, -1.191119, 2.526001, 0, 0.1411765, 1, 1,
0.3799819, -0.3245736, 1.379211, 0, 0.1372549, 1, 1,
0.3841887, 0.6016467, 0.1031306, 0, 0.1294118, 1, 1,
0.3847734, 0.02021851, 2.772438, 0, 0.1254902, 1, 1,
0.3946978, -1.789579, 3.736579, 0, 0.1176471, 1, 1,
0.3998912, -0.941552, 3.239295, 0, 0.1137255, 1, 1,
0.4030361, 0.7719014, -0.4640113, 0, 0.1058824, 1, 1,
0.4033351, -0.767571, 3.864737, 0, 0.09803922, 1, 1,
0.4058531, -0.1849963, 2.095902, 0, 0.09411765, 1, 1,
0.4066758, 1.655729, -0.01541113, 0, 0.08627451, 1, 1,
0.4085221, -0.5999523, 2.973772, 0, 0.08235294, 1, 1,
0.4104882, -1.560462, 3.115817, 0, 0.07450981, 1, 1,
0.4134686, 1.669962, -0.4625428, 0, 0.07058824, 1, 1,
0.4148844, 0.7468805, 0.1553457, 0, 0.0627451, 1, 1,
0.4150882, -0.7379489, 4.708346, 0, 0.05882353, 1, 1,
0.4201555, 0.473028, -1.12121, 0, 0.05098039, 1, 1,
0.4238192, -1.053093, 3.497276, 0, 0.04705882, 1, 1,
0.4270596, -2.785775, 4.125859, 0, 0.03921569, 1, 1,
0.4293386, 0.5726828, -0.704089, 0, 0.03529412, 1, 1,
0.4315608, -0.6335619, 1.834153, 0, 0.02745098, 1, 1,
0.4333254, -0.8456022, 0.579312, 0, 0.02352941, 1, 1,
0.4339121, -1.079692, 2.008165, 0, 0.01568628, 1, 1,
0.4347223, -0.644093, 2.293509, 0, 0.01176471, 1, 1,
0.4387587, 2.182862, 1.035333, 0, 0.003921569, 1, 1,
0.4388843, -0.3630052, 1.787134, 0.003921569, 0, 1, 1,
0.4390472, 0.1177106, 0.4964884, 0.007843138, 0, 1, 1,
0.4417776, -0.5957451, 1.541298, 0.01568628, 0, 1, 1,
0.4429082, 0.3243171, 2.323877, 0.01960784, 0, 1, 1,
0.4457566, -0.3769079, 1.51769, 0.02745098, 0, 1, 1,
0.4523923, -0.2428988, 1.03966, 0.03137255, 0, 1, 1,
0.4527664, -0.4498936, 3.540356, 0.03921569, 0, 1, 1,
0.4584524, 0.3627562, -0.2827407, 0.04313726, 0, 1, 1,
0.4609094, -0.2133821, 0.575682, 0.05098039, 0, 1, 1,
0.4616285, 0.2838092, 0.8302023, 0.05490196, 0, 1, 1,
0.4648452, 0.8797642, -1.145651, 0.0627451, 0, 1, 1,
0.4718197, -0.147922, 1.078015, 0.06666667, 0, 1, 1,
0.4725122, -0.6133058, 2.324492, 0.07450981, 0, 1, 1,
0.474286, -0.8004167, 3.932133, 0.07843138, 0, 1, 1,
0.4763466, -1.530008, 3.527382, 0.08627451, 0, 1, 1,
0.4874052, 0.1173226, 1.369795, 0.09019608, 0, 1, 1,
0.4907176, 0.4407846, 1.573296, 0.09803922, 0, 1, 1,
0.4937994, -0.8909096, 3.98009, 0.1058824, 0, 1, 1,
0.4959593, 0.9154229, 1.677569, 0.1098039, 0, 1, 1,
0.4966336, -0.3008306, 1.842953, 0.1176471, 0, 1, 1,
0.4981362, 0.6076631, -1.541393, 0.1215686, 0, 1, 1,
0.4997071, -0.4737476, 2.855461, 0.1294118, 0, 1, 1,
0.5004603, -1.872928, 2.611498, 0.1333333, 0, 1, 1,
0.5035191, -0.02429429, 0.7452967, 0.1411765, 0, 1, 1,
0.5036867, 1.006757, 1.020509, 0.145098, 0, 1, 1,
0.5042626, 1.042734, 1.625573, 0.1529412, 0, 1, 1,
0.5054545, -1.288845, 2.91108, 0.1568628, 0, 1, 1,
0.5062823, 0.4665418, 1.701135, 0.1647059, 0, 1, 1,
0.5063996, 2.019097, -0.3015056, 0.1686275, 0, 1, 1,
0.50686, 1.872239, 0.9666163, 0.1764706, 0, 1, 1,
0.511649, -0.394626, 0.5990923, 0.1803922, 0, 1, 1,
0.5128652, -0.5852047, 0.7975811, 0.1882353, 0, 1, 1,
0.5132503, 0.6464043, -0.3206691, 0.1921569, 0, 1, 1,
0.521584, 0.9749878, -0.2736938, 0.2, 0, 1, 1,
0.5217712, -1.941195, 2.352927, 0.2078431, 0, 1, 1,
0.5239604, -0.7726231, 1.808065, 0.2117647, 0, 1, 1,
0.5264859, -1.24107, 2.947013, 0.2196078, 0, 1, 1,
0.5385148, 0.8824955, 0.6684381, 0.2235294, 0, 1, 1,
0.5387301, 0.8166933, -0.8605243, 0.2313726, 0, 1, 1,
0.5397063, 0.6164992, 1.85667, 0.2352941, 0, 1, 1,
0.5411028, 1.222367, 0.9690157, 0.2431373, 0, 1, 1,
0.5529655, 1.583213, -0.8027264, 0.2470588, 0, 1, 1,
0.5538422, 0.9649617, 0.5551283, 0.254902, 0, 1, 1,
0.5573817, -0.6524961, 1.506757, 0.2588235, 0, 1, 1,
0.5616851, -0.1324372, 1.775239, 0.2666667, 0, 1, 1,
0.5635085, -0.04120567, 1.008879, 0.2705882, 0, 1, 1,
0.5654305, -1.052813, 2.37225, 0.2784314, 0, 1, 1,
0.5678377, 0.4987008, 1.583807, 0.282353, 0, 1, 1,
0.5691164, -1.498855, 3.59166, 0.2901961, 0, 1, 1,
0.5699524, 0.5616338, 1.226526, 0.2941177, 0, 1, 1,
0.5706921, 0.2219499, 1.119065, 0.3019608, 0, 1, 1,
0.5718647, -0.5661616, 1.804177, 0.3098039, 0, 1, 1,
0.5759841, -1.132828, 2.648753, 0.3137255, 0, 1, 1,
0.5763226, 0.8545039, -0.05318763, 0.3215686, 0, 1, 1,
0.5806293, -1.45059, 2.172407, 0.3254902, 0, 1, 1,
0.5817906, -0.254126, 3.219494, 0.3333333, 0, 1, 1,
0.5870957, 0.6072322, 1.814051, 0.3372549, 0, 1, 1,
0.5871286, 0.4731219, 1.565694, 0.345098, 0, 1, 1,
0.5881752, -0.6045086, 1.935483, 0.3490196, 0, 1, 1,
0.5889333, -0.8507203, 1.770455, 0.3568628, 0, 1, 1,
0.5891164, -0.7982498, 2.53091, 0.3607843, 0, 1, 1,
0.5935591, 1.662854, 1.151058, 0.3686275, 0, 1, 1,
0.594808, -0.3725416, 2.945105, 0.372549, 0, 1, 1,
0.6082235, -1.62093, 1.697352, 0.3803922, 0, 1, 1,
0.6104189, -1.282904, 1.549778, 0.3843137, 0, 1, 1,
0.6122029, -0.03991871, 3.320686, 0.3921569, 0, 1, 1,
0.6170214, 1.271402, -0.6468706, 0.3960784, 0, 1, 1,
0.6173632, 2.595061, 1.073775, 0.4039216, 0, 1, 1,
0.6283679, 0.09437165, 2.08098, 0.4117647, 0, 1, 1,
0.6296184, 0.3595108, 1.960579, 0.4156863, 0, 1, 1,
0.6332863, 0.1124105, 0.4970237, 0.4235294, 0, 1, 1,
0.6383908, 0.7543818, 1.578289, 0.427451, 0, 1, 1,
0.6410154, 0.05021644, 2.553253, 0.4352941, 0, 1, 1,
0.641654, -0.7706871, 3.507294, 0.4392157, 0, 1, 1,
0.6440602, -0.8310395, 4.60454, 0.4470588, 0, 1, 1,
0.6479028, -0.0132999, 1.221086, 0.4509804, 0, 1, 1,
0.6537963, -0.4234508, 2.702673, 0.4588235, 0, 1, 1,
0.6547686, 1.606509, 1.399351, 0.4627451, 0, 1, 1,
0.6683862, -1.136656, 3.267479, 0.4705882, 0, 1, 1,
0.6846038, -0.2825675, 2.366036, 0.4745098, 0, 1, 1,
0.6860437, -0.5360349, 1.600006, 0.4823529, 0, 1, 1,
0.6943404, 0.8227019, 2.325471, 0.4862745, 0, 1, 1,
0.6955931, 0.9681239, 0.8732839, 0.4941176, 0, 1, 1,
0.6965222, -0.05447178, 2.011232, 0.5019608, 0, 1, 1,
0.6970538, 0.4325942, -0.3080714, 0.5058824, 0, 1, 1,
0.6970822, 0.3118697, 0.08736939, 0.5137255, 0, 1, 1,
0.7009534, -0.1861321, 0.6383579, 0.5176471, 0, 1, 1,
0.7014098, -0.04064539, 2.586208, 0.5254902, 0, 1, 1,
0.7018569, -1.082331, 2.330088, 0.5294118, 0, 1, 1,
0.7046045, 0.3758706, 3.074685, 0.5372549, 0, 1, 1,
0.7050186, -1.168123, 1.209774, 0.5411765, 0, 1, 1,
0.706309, 1.36175, 0.917364, 0.5490196, 0, 1, 1,
0.7110133, 0.04346984, 1.782573, 0.5529412, 0, 1, 1,
0.7142265, 2.684946, 0.3738365, 0.5607843, 0, 1, 1,
0.7159729, 1.838289, -0.8314466, 0.5647059, 0, 1, 1,
0.7169904, 0.3634791, 1.973625, 0.572549, 0, 1, 1,
0.7207835, -1.526822, 3.193749, 0.5764706, 0, 1, 1,
0.7210605, 0.1243375, 3.91514, 0.5843138, 0, 1, 1,
0.7229168, 1.612539, 0.5342721, 0.5882353, 0, 1, 1,
0.7279373, 2.010136, -0.6249991, 0.5960785, 0, 1, 1,
0.7283621, 0.2758747, 0.1874645, 0.6039216, 0, 1, 1,
0.728561, 0.8474843, 1.255762, 0.6078432, 0, 1, 1,
0.7309788, -0.3148918, 1.1063, 0.6156863, 0, 1, 1,
0.7350225, 2.593259, -0.2065034, 0.6196079, 0, 1, 1,
0.7379084, -0.7439551, 2.287398, 0.627451, 0, 1, 1,
0.7398426, -0.01707185, 0.9876367, 0.6313726, 0, 1, 1,
0.7407772, 0.0005064945, 1.466424, 0.6392157, 0, 1, 1,
0.7467029, -0.7017838, 3.576255, 0.6431373, 0, 1, 1,
0.7481398, -1.474345, 2.907122, 0.6509804, 0, 1, 1,
0.7488965, 1.445155, 1.10729, 0.654902, 0, 1, 1,
0.750501, -0.00219042, 0.777059, 0.6627451, 0, 1, 1,
0.7513265, -0.6791239, 2.589482, 0.6666667, 0, 1, 1,
0.7518591, 0.3308822, 1.454325, 0.6745098, 0, 1, 1,
0.7520272, -0.5452631, 1.807123, 0.6784314, 0, 1, 1,
0.7556667, -0.7854013, 3.343242, 0.6862745, 0, 1, 1,
0.7604619, -0.7001284, 2.04448, 0.6901961, 0, 1, 1,
0.762125, -1.375231, 2.161433, 0.6980392, 0, 1, 1,
0.7761043, -0.2880463, 4.615392, 0.7058824, 0, 1, 1,
0.7803237, 0.43972, -0.160815, 0.7098039, 0, 1, 1,
0.7879099, -1.778868, 4.498294, 0.7176471, 0, 1, 1,
0.7942335, 0.5430233, 0.9397458, 0.7215686, 0, 1, 1,
0.7958451, -1.332192, 3.138244, 0.7294118, 0, 1, 1,
0.798465, -0.05134229, 1.900548, 0.7333333, 0, 1, 1,
0.8009242, 1.183168, 0.05408214, 0.7411765, 0, 1, 1,
0.8066544, 0.4967425, 0.3156074, 0.7450981, 0, 1, 1,
0.8132594, 0.1086638, 2.486532, 0.7529412, 0, 1, 1,
0.8162774, 0.7689008, 1.007204, 0.7568628, 0, 1, 1,
0.8191923, -1.01159, 3.93909, 0.7647059, 0, 1, 1,
0.8202118, 2.46397, 1.815772, 0.7686275, 0, 1, 1,
0.822581, -0.9915711, 2.946991, 0.7764706, 0, 1, 1,
0.8330116, 1.125446, -0.476281, 0.7803922, 0, 1, 1,
0.8350564, 0.211506, 0.8437825, 0.7882353, 0, 1, 1,
0.8360615, -0.9003963, 2.220439, 0.7921569, 0, 1, 1,
0.8375454, 0.8669028, 1.895473, 0.8, 0, 1, 1,
0.8425925, 0.66687, -0.7474945, 0.8078431, 0, 1, 1,
0.8437005, -0.08916389, 1.488447, 0.8117647, 0, 1, 1,
0.8457813, -0.4496267, 3.487493, 0.8196079, 0, 1, 1,
0.8460549, -0.3892404, 2.03074, 0.8235294, 0, 1, 1,
0.8546801, 0.6314883, 0.4635382, 0.8313726, 0, 1, 1,
0.857734, 0.1706625, 2.829818, 0.8352941, 0, 1, 1,
0.8579038, -0.1551545, 3.635334, 0.8431373, 0, 1, 1,
0.8580245, -1.035829, 2.160466, 0.8470588, 0, 1, 1,
0.859032, -1.268027, 1.841065, 0.854902, 0, 1, 1,
0.8592941, -0.319592, 2.505578, 0.8588235, 0, 1, 1,
0.8598787, -0.5999577, 2.377203, 0.8666667, 0, 1, 1,
0.8624874, -0.9906489, 4.174643, 0.8705882, 0, 1, 1,
0.866274, -1.327085, 4.314274, 0.8784314, 0, 1, 1,
0.8695892, 1.737565, 0.5762457, 0.8823529, 0, 1, 1,
0.8701165, 0.5860266, 0.2939005, 0.8901961, 0, 1, 1,
0.8702058, 0.3488376, -0.8851346, 0.8941177, 0, 1, 1,
0.8789025, 0.4084699, 0.5235541, 0.9019608, 0, 1, 1,
0.8837035, 0.1903096, 1.604365, 0.9098039, 0, 1, 1,
0.8842223, 0.7460647, -1.187052, 0.9137255, 0, 1, 1,
0.888548, 0.8332511, 1.174353, 0.9215686, 0, 1, 1,
0.8900704, 0.173524, 1.897766, 0.9254902, 0, 1, 1,
0.8916625, -0.7652012, 2.087639, 0.9333333, 0, 1, 1,
0.8933811, -1.330678, 4.08726, 0.9372549, 0, 1, 1,
0.897434, 0.9477689, 0.8075297, 0.945098, 0, 1, 1,
0.8993376, 0.2881142, -0.1687152, 0.9490196, 0, 1, 1,
0.9015647, 2.37954, -1.588367, 0.9568627, 0, 1, 1,
0.9048354, 0.0199132, 3.323168, 0.9607843, 0, 1, 1,
0.9079387, 0.8618967, -0.3414063, 0.9686275, 0, 1, 1,
0.9168333, 0.6322104, 1.134531, 0.972549, 0, 1, 1,
0.9237983, -0.2870945, 1.2467, 0.9803922, 0, 1, 1,
0.9273723, -1.851592, 2.572744, 0.9843137, 0, 1, 1,
0.9320711, -0.3152355, 1.293777, 0.9921569, 0, 1, 1,
0.9334693, -1.486323, 2.401008, 0.9960784, 0, 1, 1,
0.9380497, 0.254879, 2.705345, 1, 0, 0.9960784, 1,
0.9404817, 1.460786, 0.722917, 1, 0, 0.9882353, 1,
0.9455029, -0.4027089, 1.194676, 1, 0, 0.9843137, 1,
0.9487253, -1.525387, 2.809842, 1, 0, 0.9764706, 1,
0.9502359, -1.639249, 2.225788, 1, 0, 0.972549, 1,
0.9518728, 0.209909, -0.6602681, 1, 0, 0.9647059, 1,
0.966029, -1.015378, 2.652051, 1, 0, 0.9607843, 1,
0.9681951, 0.6080986, 0.587331, 1, 0, 0.9529412, 1,
0.9699862, -0.8363482, 2.568267, 1, 0, 0.9490196, 1,
0.9701913, 0.9225477, 1.051516, 1, 0, 0.9411765, 1,
0.9702978, -0.5566396, 0.7466561, 1, 0, 0.9372549, 1,
0.9718596, 0.06805883, 3.374353, 1, 0, 0.9294118, 1,
0.9723604, -0.7632759, 1.808383, 1, 0, 0.9254902, 1,
0.9838465, -0.180999, 1.768727, 1, 0, 0.9176471, 1,
0.9854556, 0.4469308, 1.73891, 1, 0, 0.9137255, 1,
0.9864569, -0.05996745, 1.271848, 1, 0, 0.9058824, 1,
0.9883032, -0.2101036, 1.685773, 1, 0, 0.9019608, 1,
0.9886056, 1.381653, 2.214867, 1, 0, 0.8941177, 1,
0.991409, -0.6859555, 2.463544, 1, 0, 0.8862745, 1,
0.993397, 1.201201, -1.066972, 1, 0, 0.8823529, 1,
0.9957024, 0.1109758, 0.49735, 1, 0, 0.8745098, 1,
0.9980558, -1.162434, 4.106575, 1, 0, 0.8705882, 1,
1.012458, 0.04329671, 1.102527, 1, 0, 0.8627451, 1,
1.014626, 1.184408, 0.2375317, 1, 0, 0.8588235, 1,
1.023265, 0.8679848, 2.089907, 1, 0, 0.8509804, 1,
1.026463, -0.7920312, 1.669207, 1, 0, 0.8470588, 1,
1.032665, -0.3052011, 3.13674, 1, 0, 0.8392157, 1,
1.033653, 1.201337, 0.3473698, 1, 0, 0.8352941, 1,
1.036138, -0.6167746, 4.861228, 1, 0, 0.827451, 1,
1.036409, 0.4963569, 1.922493, 1, 0, 0.8235294, 1,
1.046134, -0.853075, 2.461961, 1, 0, 0.8156863, 1,
1.049046, 0.7052684, 1.935754, 1, 0, 0.8117647, 1,
1.050323, -0.03488845, 1.640466, 1, 0, 0.8039216, 1,
1.051555, -0.8854111, 1.691041, 1, 0, 0.7960784, 1,
1.051571, -0.1762073, 0.03431256, 1, 0, 0.7921569, 1,
1.052287, 1.05146, -0.1600492, 1, 0, 0.7843137, 1,
1.053908, -1.847485, 2.15731, 1, 0, 0.7803922, 1,
1.073991, -0.8559479, 3.441479, 1, 0, 0.772549, 1,
1.07824, -0.4226377, 2.62119, 1, 0, 0.7686275, 1,
1.093982, -1.326758, 1.063378, 1, 0, 0.7607843, 1,
1.094104, -1.366388, 1.897727, 1, 0, 0.7568628, 1,
1.109394, 0.4409528, 2.420255, 1, 0, 0.7490196, 1,
1.111704, -1.360578, 3.273225, 1, 0, 0.7450981, 1,
1.112283, -0.152278, 1.708541, 1, 0, 0.7372549, 1,
1.116217, 1.856856, -0.1437358, 1, 0, 0.7333333, 1,
1.120402, -1.279918, 2.854493, 1, 0, 0.7254902, 1,
1.12245, 1.429555, 1.074484, 1, 0, 0.7215686, 1,
1.134854, 0.05355358, 1.258422, 1, 0, 0.7137255, 1,
1.135863, 0.7544819, 2.328426, 1, 0, 0.7098039, 1,
1.137283, -1.105771, 4.112355, 1, 0, 0.7019608, 1,
1.140226, 0.1935198, 1.178273, 1, 0, 0.6941177, 1,
1.143992, 0.4163457, 2.579679, 1, 0, 0.6901961, 1,
1.145362, -1.617712, 2.109854, 1, 0, 0.682353, 1,
1.148273, 1.257426, -1.037803, 1, 0, 0.6784314, 1,
1.150267, -2.157084, 1.578714, 1, 0, 0.6705883, 1,
1.151717, 1.704908, 0.546082, 1, 0, 0.6666667, 1,
1.15322, 0.8617299, 0.6264024, 1, 0, 0.6588235, 1,
1.154601, 0.953299, -1.472005, 1, 0, 0.654902, 1,
1.155655, 0.4079621, 3.547647, 1, 0, 0.6470588, 1,
1.179849, 1.316471, 1.788068, 1, 0, 0.6431373, 1,
1.187659, 1.514423, -0.04025004, 1, 0, 0.6352941, 1,
1.19097, 1.845133, 0.9255655, 1, 0, 0.6313726, 1,
1.196826, 1.012479, 2.38479, 1, 0, 0.6235294, 1,
1.200418, 0.03298844, 1.480764, 1, 0, 0.6196079, 1,
1.209662, 0.2789494, 1.295359, 1, 0, 0.6117647, 1,
1.218511, -0.3431013, 2.824536, 1, 0, 0.6078432, 1,
1.221607, 1.005901, 0.6171321, 1, 0, 0.6, 1,
1.226352, -0.6943086, 1.782488, 1, 0, 0.5921569, 1,
1.232114, 1.164365, -0.3216285, 1, 0, 0.5882353, 1,
1.235415, 1.140635, 1.662708, 1, 0, 0.5803922, 1,
1.235958, 0.05252419, 2.633521, 1, 0, 0.5764706, 1,
1.237309, -2.160583, 3.179984, 1, 0, 0.5686275, 1,
1.243061, 1.065453, -0.07115956, 1, 0, 0.5647059, 1,
1.247306, -1.018636, 2.509308, 1, 0, 0.5568628, 1,
1.254819, -1.44813, 2.086891, 1, 0, 0.5529412, 1,
1.26141, -2.77055, 3.245091, 1, 0, 0.5450981, 1,
1.263547, 2.016792, 1.502947, 1, 0, 0.5411765, 1,
1.272271, 2.695107, -0.4494271, 1, 0, 0.5333334, 1,
1.283704, 0.3699078, 2.671155, 1, 0, 0.5294118, 1,
1.290876, -2.154045, 1.42672, 1, 0, 0.5215687, 1,
1.292128, 0.4962139, -0.9630178, 1, 0, 0.5176471, 1,
1.306216, -1.009918, 0.6199797, 1, 0, 0.509804, 1,
1.30742, -0.3135622, 2.329669, 1, 0, 0.5058824, 1,
1.316027, 1.111522, 2.771138, 1, 0, 0.4980392, 1,
1.342046, 2.001869, 1.779711, 1, 0, 0.4901961, 1,
1.347975, 0.2760991, 0.311214, 1, 0, 0.4862745, 1,
1.34838, 1.326485, -0.4501985, 1, 0, 0.4784314, 1,
1.349677, 0.8057486, 1.040951, 1, 0, 0.4745098, 1,
1.356415, -0.08975625, 0.1765197, 1, 0, 0.4666667, 1,
1.358116, -0.1959768, 1.495732, 1, 0, 0.4627451, 1,
1.363626, -0.8443955, 0.7743089, 1, 0, 0.454902, 1,
1.368452, 0.5382759, 2.261476, 1, 0, 0.4509804, 1,
1.369406, 0.8405549, 0.5532063, 1, 0, 0.4431373, 1,
1.37577, 1.7792, 1.160641, 1, 0, 0.4392157, 1,
1.37887, 0.3307323, 1.382393, 1, 0, 0.4313726, 1,
1.383057, 0.4486804, 0.4653773, 1, 0, 0.427451, 1,
1.385707, -0.6465216, 1.731982, 1, 0, 0.4196078, 1,
1.414151, -1.158583, 2.122725, 1, 0, 0.4156863, 1,
1.437131, -0.0875666, 0.7531006, 1, 0, 0.4078431, 1,
1.44031, 1.850351, -0.6880741, 1, 0, 0.4039216, 1,
1.447834, -0.4703113, 2.494574, 1, 0, 0.3960784, 1,
1.450142, -0.2100265, 2.828845, 1, 0, 0.3882353, 1,
1.452349, 1.587462, 0.1827328, 1, 0, 0.3843137, 1,
1.462491, -1.339301, 1.888003, 1, 0, 0.3764706, 1,
1.482168, 0.2605159, 2.805828, 1, 0, 0.372549, 1,
1.493984, 1.488671, 0.3349181, 1, 0, 0.3647059, 1,
1.499478, -1.243585, 4.772371, 1, 0, 0.3607843, 1,
1.504825, -1.474686, 2.400325, 1, 0, 0.3529412, 1,
1.508724, -0.3914359, 1.327715, 1, 0, 0.3490196, 1,
1.511853, 0.6062434, 2.647381, 1, 0, 0.3411765, 1,
1.513212, -0.7922013, 0.7920799, 1, 0, 0.3372549, 1,
1.51576, -0.04782313, 1.953644, 1, 0, 0.3294118, 1,
1.521446, 0.01024611, 0.07091874, 1, 0, 0.3254902, 1,
1.529502, 1.461873, 0.6576536, 1, 0, 0.3176471, 1,
1.54715, -0.5768074, 0.4379125, 1, 0, 0.3137255, 1,
1.553475, -0.2527374, 0.8315539, 1, 0, 0.3058824, 1,
1.5551, -0.03546173, 1.937656, 1, 0, 0.2980392, 1,
1.556239, 1.824626, 0.7819778, 1, 0, 0.2941177, 1,
1.559336, -1.365192, 3.583116, 1, 0, 0.2862745, 1,
1.57801, -0.5006904, 1.152954, 1, 0, 0.282353, 1,
1.580692, -0.6636555, 4.974929, 1, 0, 0.2745098, 1,
1.593805, 0.2552138, 1.724341, 1, 0, 0.2705882, 1,
1.65146, 0.3428208, -0.1538031, 1, 0, 0.2627451, 1,
1.666823, 1.221891, 0.3102396, 1, 0, 0.2588235, 1,
1.712788, 1.03991, 0.2956824, 1, 0, 0.2509804, 1,
1.726376, 0.6197412, 1.813836, 1, 0, 0.2470588, 1,
1.737783, 0.2347307, 1.297791, 1, 0, 0.2392157, 1,
1.741378, 1.536147, 1.462532, 1, 0, 0.2352941, 1,
1.751979, 0.1421375, 1.775707, 1, 0, 0.227451, 1,
1.762954, -1.128944, 2.671929, 1, 0, 0.2235294, 1,
1.768756, 0.1267555, 1.560834, 1, 0, 0.2156863, 1,
1.783335, -1.460092, 1.337581, 1, 0, 0.2117647, 1,
1.787085, 0.02677647, 3.195074, 1, 0, 0.2039216, 1,
1.791549, 0.1533523, 1.552271, 1, 0, 0.1960784, 1,
1.797253, 0.256876, 0.6962666, 1, 0, 0.1921569, 1,
1.809144, 1.041943, 0.2972092, 1, 0, 0.1843137, 1,
1.814702, 0.07816393, 1.974588, 1, 0, 0.1803922, 1,
1.829151, 0.612781, 0.6585003, 1, 0, 0.172549, 1,
1.832836, 1.256217, 0.6434782, 1, 0, 0.1686275, 1,
1.850875, 1.804806, 1.428666, 1, 0, 0.1607843, 1,
1.869975, 1.313526, 0.01144306, 1, 0, 0.1568628, 1,
1.876098, -0.6009595, 2.148904, 1, 0, 0.1490196, 1,
1.924869, -0.6792368, -1.440328, 1, 0, 0.145098, 1,
1.961518, 0.4501034, 0.1829496, 1, 0, 0.1372549, 1,
1.981699, -0.828039, 2.354848, 1, 0, 0.1333333, 1,
2.037409, 0.5194432, 1.888007, 1, 0, 0.1254902, 1,
2.045536, 0.8090512, -0.1698273, 1, 0, 0.1215686, 1,
2.049922, 0.6916926, 1.217361, 1, 0, 0.1137255, 1,
2.090711, -0.6745571, 1.620011, 1, 0, 0.1098039, 1,
2.178858, 0.3403188, 2.724677, 1, 0, 0.1019608, 1,
2.184765, 0.2988787, 1.377603, 1, 0, 0.09411765, 1,
2.214161, -1.09314, 3.468264, 1, 0, 0.09019608, 1,
2.263215, -1.906714, 2.716592, 1, 0, 0.08235294, 1,
2.293721, -1.50022, 2.496511, 1, 0, 0.07843138, 1,
2.301381, 1.024595, 0.5766072, 1, 0, 0.07058824, 1,
2.303733, 1.945852, 0.6424826, 1, 0, 0.06666667, 1,
2.305501, -0.365202, 0.9635668, 1, 0, 0.05882353, 1,
2.387085, 1.199969, 1.405966, 1, 0, 0.05490196, 1,
2.444184, -0.450996, 1.917387, 1, 0, 0.04705882, 1,
2.527635, 0.04779589, 1.585996, 1, 0, 0.04313726, 1,
2.565998, -1.160878, 2.594273, 1, 0, 0.03529412, 1,
2.566605, -1.716449, -0.331839, 1, 0, 0.03137255, 1,
2.639836, -0.6424453, 1.163417, 1, 0, 0.02352941, 1,
2.702975, -1.620884, 2.017935, 1, 0, 0.01960784, 1,
3.128365, 0.5988232, 0.6486533, 1, 0, 0.01176471, 1,
3.203938, 0.2661114, -0.297981, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.004503131, -3.879364, -7.633839, 0, -0.5, 0.5, 0.5,
-0.004503131, -3.879364, -7.633839, 1, -0.5, 0.5, 0.5,
-0.004503131, -3.879364, -7.633839, 1, 1.5, 0.5, 0.5,
-0.004503131, -3.879364, -7.633839, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.300605, 0.2161859, -7.633839, 0, -0.5, 0.5, 0.5,
-4.300605, 0.2161859, -7.633839, 1, -0.5, 0.5, 0.5,
-4.300605, 0.2161859, -7.633839, 1, 1.5, 0.5, 0.5,
-4.300605, 0.2161859, -7.633839, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.300605, -3.879364, -0.3443992, 0, -0.5, 0.5, 0.5,
-4.300605, -3.879364, -0.3443992, 1, -0.5, 0.5, 0.5,
-4.300605, -3.879364, -0.3443992, 1, 1.5, 0.5, 0.5,
-4.300605, -3.879364, -0.3443992, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -2.934237, -5.951661,
3, -2.934237, -5.951661,
-3, -2.934237, -5.951661,
-3, -3.091759, -6.232024,
-2, -2.934237, -5.951661,
-2, -3.091759, -6.232024,
-1, -2.934237, -5.951661,
-1, -3.091759, -6.232024,
0, -2.934237, -5.951661,
0, -3.091759, -6.232024,
1, -2.934237, -5.951661,
1, -3.091759, -6.232024,
2, -2.934237, -5.951661,
2, -3.091759, -6.232024,
3, -2.934237, -5.951661,
3, -3.091759, -6.232024
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.406801, -6.79275, 0, -0.5, 0.5, 0.5,
-3, -3.406801, -6.79275, 1, -0.5, 0.5, 0.5,
-3, -3.406801, -6.79275, 1, 1.5, 0.5, 0.5,
-3, -3.406801, -6.79275, 0, 1.5, 0.5, 0.5,
-2, -3.406801, -6.79275, 0, -0.5, 0.5, 0.5,
-2, -3.406801, -6.79275, 1, -0.5, 0.5, 0.5,
-2, -3.406801, -6.79275, 1, 1.5, 0.5, 0.5,
-2, -3.406801, -6.79275, 0, 1.5, 0.5, 0.5,
-1, -3.406801, -6.79275, 0, -0.5, 0.5, 0.5,
-1, -3.406801, -6.79275, 1, -0.5, 0.5, 0.5,
-1, -3.406801, -6.79275, 1, 1.5, 0.5, 0.5,
-1, -3.406801, -6.79275, 0, 1.5, 0.5, 0.5,
0, -3.406801, -6.79275, 0, -0.5, 0.5, 0.5,
0, -3.406801, -6.79275, 1, -0.5, 0.5, 0.5,
0, -3.406801, -6.79275, 1, 1.5, 0.5, 0.5,
0, -3.406801, -6.79275, 0, 1.5, 0.5, 0.5,
1, -3.406801, -6.79275, 0, -0.5, 0.5, 0.5,
1, -3.406801, -6.79275, 1, -0.5, 0.5, 0.5,
1, -3.406801, -6.79275, 1, 1.5, 0.5, 0.5,
1, -3.406801, -6.79275, 0, 1.5, 0.5, 0.5,
2, -3.406801, -6.79275, 0, -0.5, 0.5, 0.5,
2, -3.406801, -6.79275, 1, -0.5, 0.5, 0.5,
2, -3.406801, -6.79275, 1, 1.5, 0.5, 0.5,
2, -3.406801, -6.79275, 0, 1.5, 0.5, 0.5,
3, -3.406801, -6.79275, 0, -0.5, 0.5, 0.5,
3, -3.406801, -6.79275, 1, -0.5, 0.5, 0.5,
3, -3.406801, -6.79275, 1, 1.5, 0.5, 0.5,
3, -3.406801, -6.79275, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.309197, -2, -5.951661,
-3.309197, 3, -5.951661,
-3.309197, -2, -5.951661,
-3.474432, -2, -6.232024,
-3.309197, -1, -5.951661,
-3.474432, -1, -6.232024,
-3.309197, 0, -5.951661,
-3.474432, 0, -6.232024,
-3.309197, 1, -5.951661,
-3.474432, 1, -6.232024,
-3.309197, 2, -5.951661,
-3.474432, 2, -6.232024,
-3.309197, 3, -5.951661,
-3.474432, 3, -6.232024
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.804901, -2, -6.79275, 0, -0.5, 0.5, 0.5,
-3.804901, -2, -6.79275, 1, -0.5, 0.5, 0.5,
-3.804901, -2, -6.79275, 1, 1.5, 0.5, 0.5,
-3.804901, -2, -6.79275, 0, 1.5, 0.5, 0.5,
-3.804901, -1, -6.79275, 0, -0.5, 0.5, 0.5,
-3.804901, -1, -6.79275, 1, -0.5, 0.5, 0.5,
-3.804901, -1, -6.79275, 1, 1.5, 0.5, 0.5,
-3.804901, -1, -6.79275, 0, 1.5, 0.5, 0.5,
-3.804901, 0, -6.79275, 0, -0.5, 0.5, 0.5,
-3.804901, 0, -6.79275, 1, -0.5, 0.5, 0.5,
-3.804901, 0, -6.79275, 1, 1.5, 0.5, 0.5,
-3.804901, 0, -6.79275, 0, 1.5, 0.5, 0.5,
-3.804901, 1, -6.79275, 0, -0.5, 0.5, 0.5,
-3.804901, 1, -6.79275, 1, -0.5, 0.5, 0.5,
-3.804901, 1, -6.79275, 1, 1.5, 0.5, 0.5,
-3.804901, 1, -6.79275, 0, 1.5, 0.5, 0.5,
-3.804901, 2, -6.79275, 0, -0.5, 0.5, 0.5,
-3.804901, 2, -6.79275, 1, -0.5, 0.5, 0.5,
-3.804901, 2, -6.79275, 1, 1.5, 0.5, 0.5,
-3.804901, 2, -6.79275, 0, 1.5, 0.5, 0.5,
-3.804901, 3, -6.79275, 0, -0.5, 0.5, 0.5,
-3.804901, 3, -6.79275, 1, -0.5, 0.5, 0.5,
-3.804901, 3, -6.79275, 1, 1.5, 0.5, 0.5,
-3.804901, 3, -6.79275, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.309197, -2.934237, -4,
-3.309197, -2.934237, 4,
-3.309197, -2.934237, -4,
-3.474432, -3.091759, -4,
-3.309197, -2.934237, -2,
-3.474432, -3.091759, -2,
-3.309197, -2.934237, 0,
-3.474432, -3.091759, 0,
-3.309197, -2.934237, 2,
-3.474432, -3.091759, 2,
-3.309197, -2.934237, 4,
-3.474432, -3.091759, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.804901, -3.406801, -4, 0, -0.5, 0.5, 0.5,
-3.804901, -3.406801, -4, 1, -0.5, 0.5, 0.5,
-3.804901, -3.406801, -4, 1, 1.5, 0.5, 0.5,
-3.804901, -3.406801, -4, 0, 1.5, 0.5, 0.5,
-3.804901, -3.406801, -2, 0, -0.5, 0.5, 0.5,
-3.804901, -3.406801, -2, 1, -0.5, 0.5, 0.5,
-3.804901, -3.406801, -2, 1, 1.5, 0.5, 0.5,
-3.804901, -3.406801, -2, 0, 1.5, 0.5, 0.5,
-3.804901, -3.406801, 0, 0, -0.5, 0.5, 0.5,
-3.804901, -3.406801, 0, 1, -0.5, 0.5, 0.5,
-3.804901, -3.406801, 0, 1, 1.5, 0.5, 0.5,
-3.804901, -3.406801, 0, 0, 1.5, 0.5, 0.5,
-3.804901, -3.406801, 2, 0, -0.5, 0.5, 0.5,
-3.804901, -3.406801, 2, 1, -0.5, 0.5, 0.5,
-3.804901, -3.406801, 2, 1, 1.5, 0.5, 0.5,
-3.804901, -3.406801, 2, 0, 1.5, 0.5, 0.5,
-3.804901, -3.406801, 4, 0, -0.5, 0.5, 0.5,
-3.804901, -3.406801, 4, 1, -0.5, 0.5, 0.5,
-3.804901, -3.406801, 4, 1, 1.5, 0.5, 0.5,
-3.804901, -3.406801, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.309197, -2.934237, -5.951661,
-3.309197, 3.366609, -5.951661,
-3.309197, -2.934237, 5.262862,
-3.309197, 3.366609, 5.262862,
-3.309197, -2.934237, -5.951661,
-3.309197, -2.934237, 5.262862,
-3.309197, 3.366609, -5.951661,
-3.309197, 3.366609, 5.262862,
-3.309197, -2.934237, -5.951661,
3.300191, -2.934237, -5.951661,
-3.309197, -2.934237, 5.262862,
3.300191, -2.934237, 5.262862,
-3.309197, 3.366609, -5.951661,
3.300191, 3.366609, -5.951661,
-3.309197, 3.366609, 5.262862,
3.300191, 3.366609, 5.262862,
3.300191, -2.934237, -5.951661,
3.300191, 3.366609, -5.951661,
3.300191, -2.934237, 5.262862,
3.300191, 3.366609, 5.262862,
3.300191, -2.934237, -5.951661,
3.300191, -2.934237, 5.262862,
3.300191, 3.366609, -5.951661,
3.300191, 3.366609, 5.262862
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.722441;
var distance = 34.35801;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.004503131, -0.2161859, 0.3443992 );
mvMatrix.scale( 1.263302, 1.325164, 0.7445394 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.35801);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Methoxyfenozide<-read.table("Methoxyfenozide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methoxyfenozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methoxyfenozide' not found
```

```r
y<-Methoxyfenozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methoxyfenozide' not found
```

```r
z<-Methoxyfenozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methoxyfenozide' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.212944, -0.08945275, -2.816409, 0, 0, 1, 1, 1,
-2.78741, 0.3520813, -2.069356, 1, 0, 0, 1, 1,
-2.671708, 0.006075799, -2.995341, 1, 0, 0, 1, 1,
-2.645169, 0.1944067, -2.556276, 1, 0, 0, 1, 1,
-2.633992, -0.481585, -1.521354, 1, 0, 0, 1, 1,
-2.554476, -0.5316831, -2.149707, 1, 0, 0, 1, 1,
-2.464981, -2.094048, -1.581211, 0, 0, 0, 1, 1,
-2.464355, -1.143454, -2.795548, 0, 0, 0, 1, 1,
-2.424274, 0.3843857, -0.5341303, 0, 0, 0, 1, 1,
-2.411687, -0.02163679, -0.01789661, 0, 0, 0, 1, 1,
-2.364473, 0.7041276, -2.402686, 0, 0, 0, 1, 1,
-2.357625, 0.99376, -0.5300052, 0, 0, 0, 1, 1,
-2.307605, -0.8769906, -2.027907, 0, 0, 0, 1, 1,
-2.281775, -2.037063, -2.997412, 1, 1, 1, 1, 1,
-2.252829, 0.2161979, -1.536688, 1, 1, 1, 1, 1,
-2.218639, -0.6623557, -1.587669, 1, 1, 1, 1, 1,
-2.191493, 0.4572226, -1.679038, 1, 1, 1, 1, 1,
-2.177244, 1.047731, -0.4426773, 1, 1, 1, 1, 1,
-2.162374, 1.287136, -1.584976, 1, 1, 1, 1, 1,
-2.160414, -0.3740274, -2.18871, 1, 1, 1, 1, 1,
-2.075163, 0.4050728, -1.423937, 1, 1, 1, 1, 1,
-2.068964, 1.363356, 0.8305478, 1, 1, 1, 1, 1,
-2.068541, -0.3357119, -1.07733, 1, 1, 1, 1, 1,
-2.044062, -1.637481, -1.972687, 1, 1, 1, 1, 1,
-2.012482, -1.36319, -0.6254352, 1, 1, 1, 1, 1,
-1.999424, -0.4930166, -3.007183, 1, 1, 1, 1, 1,
-1.991473, 1.372847, -2.159241, 1, 1, 1, 1, 1,
-1.940106, 0.8010531, -1.333891, 1, 1, 1, 1, 1,
-1.920229, -0.6565474, -2.236274, 0, 0, 1, 1, 1,
-1.867263, 0.8175802, -0.5347441, 1, 0, 0, 1, 1,
-1.818262, -0.5979443, -2.373827, 1, 0, 0, 1, 1,
-1.809731, -1.230512, -4.531975, 1, 0, 0, 1, 1,
-1.807571, -0.4237994, -1.656671, 1, 0, 0, 1, 1,
-1.804657, -0.1971996, -2.009517, 1, 0, 0, 1, 1,
-1.797666, 0.2925541, -1.664396, 0, 0, 0, 1, 1,
-1.787476, 2.039514, 0.1769162, 0, 0, 0, 1, 1,
-1.773236, -0.6832278, -1.870035, 0, 0, 0, 1, 1,
-1.7369, 1.404767, -0.3640521, 0, 0, 0, 1, 1,
-1.730909, -0.6907421, -3.185192, 0, 0, 0, 1, 1,
-1.677222, 1.785355, -0.4571524, 0, 0, 0, 1, 1,
-1.665173, -0.371116, -1.07349, 0, 0, 0, 1, 1,
-1.659751, -0.8605821, -1.393971, 1, 1, 1, 1, 1,
-1.659356, -1.720197, -2.981683, 1, 1, 1, 1, 1,
-1.653551, 0.2899675, -1.447816, 1, 1, 1, 1, 1,
-1.652419, 0.8427609, 1.49703, 1, 1, 1, 1, 1,
-1.648498, -0.3019624, -0.7702505, 1, 1, 1, 1, 1,
-1.640941, 0.790957, -3.45038, 1, 1, 1, 1, 1,
-1.639771, 1.11791, -2.387805, 1, 1, 1, 1, 1,
-1.639213, -0.71618, -1.480474, 1, 1, 1, 1, 1,
-1.629247, -0.02356071, -1.314635, 1, 1, 1, 1, 1,
-1.624902, -1.080146, -1.27804, 1, 1, 1, 1, 1,
-1.602026, -0.0986264, -1.913669, 1, 1, 1, 1, 1,
-1.594839, -0.0442611, -1.476965, 1, 1, 1, 1, 1,
-1.584258, -0.3399882, -1.787565, 1, 1, 1, 1, 1,
-1.577863, 1.529738, -2.138923, 1, 1, 1, 1, 1,
-1.566019, 1.906905, -1.761178, 1, 1, 1, 1, 1,
-1.552, 0.07597888, -2.091874, 0, 0, 1, 1, 1,
-1.549942, -1.382228, -3.0082, 1, 0, 0, 1, 1,
-1.543471, 1.034638, 0.401908, 1, 0, 0, 1, 1,
-1.540091, 0.09715118, -3.57992, 1, 0, 0, 1, 1,
-1.538343, 0.5496218, -4.275982, 1, 0, 0, 1, 1,
-1.511248, 0.1780081, -3.119309, 1, 0, 0, 1, 1,
-1.505846, -0.0993072, -0.4806013, 0, 0, 0, 1, 1,
-1.501401, 0.5377661, -0.9407587, 0, 0, 0, 1, 1,
-1.497681, -0.7378522, -2.344051, 0, 0, 0, 1, 1,
-1.495577, 0.1967364, -2.545529, 0, 0, 0, 1, 1,
-1.493286, 0.4200957, -1.247121, 0, 0, 0, 1, 1,
-1.486714, -0.392581, -0.914327, 0, 0, 0, 1, 1,
-1.483135, 1.927445, -1.85336, 0, 0, 0, 1, 1,
-1.478677, 0.3865676, -1.59356, 1, 1, 1, 1, 1,
-1.471846, 0.0355273, -0.5347489, 1, 1, 1, 1, 1,
-1.449138, -0.5881343, -2.189804, 1, 1, 1, 1, 1,
-1.442566, 0.07663222, 0.120603, 1, 1, 1, 1, 1,
-1.429839, -0.6452973, -1.48104, 1, 1, 1, 1, 1,
-1.429197, 1.069729, -2.000621, 1, 1, 1, 1, 1,
-1.415337, 0.7256287, 0.2842112, 1, 1, 1, 1, 1,
-1.411965, -1.774433, -2.448646, 1, 1, 1, 1, 1,
-1.411856, 0.05394083, -1.181684, 1, 1, 1, 1, 1,
-1.408149, 1.05613, -1.157788, 1, 1, 1, 1, 1,
-1.400521, 1.505925, -0.943554, 1, 1, 1, 1, 1,
-1.400335, 0.140161, -4.053244, 1, 1, 1, 1, 1,
-1.397487, -0.1041392, -4.436206, 1, 1, 1, 1, 1,
-1.396644, 0.9467301, -1.603653, 1, 1, 1, 1, 1,
-1.394207, 0.1448976, -1.562068, 1, 1, 1, 1, 1,
-1.369516, 0.3788158, -1.877666, 0, 0, 1, 1, 1,
-1.367045, 0.7811484, -1.66545, 1, 0, 0, 1, 1,
-1.358051, -0.3845217, -1.637531, 1, 0, 0, 1, 1,
-1.350065, -0.3169148, -0.1176574, 1, 0, 0, 1, 1,
-1.349582, -0.06475852, -2.998649, 1, 0, 0, 1, 1,
-1.348603, -1.257514, -2.901024, 1, 0, 0, 1, 1,
-1.340653, -0.6106902, -1.011924, 0, 0, 0, 1, 1,
-1.326721, 1.024635, -1.647997, 0, 0, 0, 1, 1,
-1.324352, -0.05499329, -2.200687, 0, 0, 0, 1, 1,
-1.323368, -0.3099598, -0.2484509, 0, 0, 0, 1, 1,
-1.31773, -1.350097, -1.90494, 0, 0, 0, 1, 1,
-1.315408, -1.227039, -3.499944, 0, 0, 0, 1, 1,
-1.307598, 0.02518263, -3.475674, 0, 0, 0, 1, 1,
-1.30623, -0.1065492, -1.74126, 1, 1, 1, 1, 1,
-1.303321, 0.4194378, -1.607358, 1, 1, 1, 1, 1,
-1.301961, -1.114437, -3.2181, 1, 1, 1, 1, 1,
-1.299504, -1.122024, -2.604046, 1, 1, 1, 1, 1,
-1.295867, -0.5596733, -2.10987, 1, 1, 1, 1, 1,
-1.284942, -0.04499408, -1.95056, 1, 1, 1, 1, 1,
-1.284547, -0.4853337, -2.134027, 1, 1, 1, 1, 1,
-1.284455, -0.9526993, -2.228053, 1, 1, 1, 1, 1,
-1.284321, 0.8853041, -1.842785, 1, 1, 1, 1, 1,
-1.275033, -0.3283521, -0.7354332, 1, 1, 1, 1, 1,
-1.274016, -0.3378059, -1.540195, 1, 1, 1, 1, 1,
-1.268374, 1.147308, -2.768371, 1, 1, 1, 1, 1,
-1.268313, 0.5532274, -0.4767627, 1, 1, 1, 1, 1,
-1.266331, 0.5672663, -1.142888, 1, 1, 1, 1, 1,
-1.264651, -0.4407829, -0.5278459, 1, 1, 1, 1, 1,
-1.263593, -0.7186557, -2.138618, 0, 0, 1, 1, 1,
-1.260578, -1.49516, -0.729479, 1, 0, 0, 1, 1,
-1.258197, 0.4724247, -0.9489602, 1, 0, 0, 1, 1,
-1.255983, -0.9684287, -1.003189, 1, 0, 0, 1, 1,
-1.252105, -0.2079797, -0.466076, 1, 0, 0, 1, 1,
-1.248289, 0.9635363, -0.3602249, 1, 0, 0, 1, 1,
-1.240005, -0.2066525, -1.725257, 0, 0, 0, 1, 1,
-1.222374, 0.8449669, -0.4809696, 0, 0, 0, 1, 1,
-1.222263, 1.607322, -0.7810919, 0, 0, 0, 1, 1,
-1.219028, -0.5104377, -1.924028, 0, 0, 0, 1, 1,
-1.214452, 0.7039195, -1.301556, 0, 0, 0, 1, 1,
-1.207801, -0.7314485, -1.782647, 0, 0, 0, 1, 1,
-1.20203, 1.184617, 0.06812118, 0, 0, 0, 1, 1,
-1.200147, 3.274849, -0.4275143, 1, 1, 1, 1, 1,
-1.19889, 1.164428, -1.431332, 1, 1, 1, 1, 1,
-1.198782, -0.4739083, -0.062362, 1, 1, 1, 1, 1,
-1.191825, 0.8016679, -0.2107188, 1, 1, 1, 1, 1,
-1.173556, -0.247126, -1.23058, 1, 1, 1, 1, 1,
-1.171618, -0.8151577, -2.841582, 1, 1, 1, 1, 1,
-1.171043, -1.366223, -1.539782, 1, 1, 1, 1, 1,
-1.169676, -1.128543, -2.635844, 1, 1, 1, 1, 1,
-1.15897, -0.531521, -1.283205, 1, 1, 1, 1, 1,
-1.1566, -0.7519314, -0.769202, 1, 1, 1, 1, 1,
-1.145081, 0.5455759, -0.008478904, 1, 1, 1, 1, 1,
-1.143537, 1.499776, -2.92663, 1, 1, 1, 1, 1,
-1.137327, 1.324209, -0.8954483, 1, 1, 1, 1, 1,
-1.134324, 1.421463, -1.095796, 1, 1, 1, 1, 1,
-1.13419, 0.04898089, -2.454243, 1, 1, 1, 1, 1,
-1.127589, 1.169001, -0.2949993, 0, 0, 1, 1, 1,
-1.124301, 1.115043, 0.4541791, 1, 0, 0, 1, 1,
-1.123934, 0.4496271, -1.376052, 1, 0, 0, 1, 1,
-1.117427, 2.470123, -1.450386, 1, 0, 0, 1, 1,
-1.108108, 0.1214041, -0.3830259, 1, 0, 0, 1, 1,
-1.10568, 0.9741072, -0.3014498, 1, 0, 0, 1, 1,
-1.104634, -0.008213774, -1.960791, 0, 0, 0, 1, 1,
-1.103498, 0.2990295, -0.5262393, 0, 0, 0, 1, 1,
-1.089166, 1.340229, -1.75199, 0, 0, 0, 1, 1,
-1.081915, 0.9734883, -2.001727, 0, 0, 0, 1, 1,
-1.080654, -0.537761, -2.224453, 0, 0, 0, 1, 1,
-1.077448, 0.2805704, -2.626285, 0, 0, 0, 1, 1,
-1.06716, 1.073086, 0.1591888, 0, 0, 0, 1, 1,
-1.067129, 1.679306, -0.7482511, 1, 1, 1, 1, 1,
-1.066437, 0.3488383, -0.009191138, 1, 1, 1, 1, 1,
-1.064646, -0.7129686, -1.628069, 1, 1, 1, 1, 1,
-1.063752, -0.4026357, -1.701556, 1, 1, 1, 1, 1,
-1.055076, -0.0005345769, -0.08772027, 1, 1, 1, 1, 1,
-1.051737, 0.827171, -3.569426, 1, 1, 1, 1, 1,
-1.048763, 1.613269, 1.384262, 1, 1, 1, 1, 1,
-1.046167, -0.3408461, -2.583197, 1, 1, 1, 1, 1,
-1.040156, -0.2741013, -2.419738, 1, 1, 1, 1, 1,
-1.039764, -0.302001, -3.229257, 1, 1, 1, 1, 1,
-1.036769, -0.3085155, -2.971193, 1, 1, 1, 1, 1,
-1.035884, 0.7075442, -1.670312, 1, 1, 1, 1, 1,
-1.03463, 1.500391, 0.4689261, 1, 1, 1, 1, 1,
-1.030653, -0.7738715, -2.586306, 1, 1, 1, 1, 1,
-1.026806, 1.193973, -0.9009901, 1, 1, 1, 1, 1,
-1.024985, 1.601714, 0.0553196, 0, 0, 1, 1, 1,
-1.0241, -0.1987501, -1.700277, 1, 0, 0, 1, 1,
-1.023389, -0.4746656, -2.126715, 1, 0, 0, 1, 1,
-1.019657, 1.698257, 1.572327, 1, 0, 0, 1, 1,
-1.011724, -0.1348399, -1.614402, 1, 0, 0, 1, 1,
-1.00529, -1.571994, -0.649824, 1, 0, 0, 1, 1,
-0.9952636, 1.327915, -0.6929576, 0, 0, 0, 1, 1,
-0.9836643, -0.1715471, -1.373084, 0, 0, 0, 1, 1,
-0.9817867, 1.152848, -0.2390833, 0, 0, 0, 1, 1,
-0.9699014, -0.7093796, -1.385667, 0, 0, 0, 1, 1,
-0.9678188, 0.9137273, -0.7397814, 0, 0, 0, 1, 1,
-0.9556266, -0.5918513, -3.4931, 0, 0, 0, 1, 1,
-0.955076, 0.09633145, -0.6304564, 0, 0, 0, 1, 1,
-0.9540132, 1.642317, -3.167969, 1, 1, 1, 1, 1,
-0.9537635, 0.3071613, 0.02059817, 1, 1, 1, 1, 1,
-0.9534499, -2.032421, -2.76407, 1, 1, 1, 1, 1,
-0.9514094, -0.145635, -1.442023, 1, 1, 1, 1, 1,
-0.9491734, 1.747125, -1.964327, 1, 1, 1, 1, 1,
-0.9473015, 0.3645997, -0.5121456, 1, 1, 1, 1, 1,
-0.9452597, -1.467392, -3.732741, 1, 1, 1, 1, 1,
-0.9413119, -0.5953157, -2.834326, 1, 1, 1, 1, 1,
-0.9316276, 0.8684917, -0.3676072, 1, 1, 1, 1, 1,
-0.9294405, -0.7328572, -3.603633, 1, 1, 1, 1, 1,
-0.9287346, 0.5911858, -0.3957913, 1, 1, 1, 1, 1,
-0.9254247, 0.8815008, -1.364014, 1, 1, 1, 1, 1,
-0.9252116, -0.03024863, -1.764818, 1, 1, 1, 1, 1,
-0.9189188, 2.14174, -1.306148, 1, 1, 1, 1, 1,
-0.9148557, 1.540213, 0.5666672, 1, 1, 1, 1, 1,
-0.9105816, -0.2692724, 0.2081251, 0, 0, 1, 1, 1,
-0.9099296, -0.4987139, -0.9268806, 1, 0, 0, 1, 1,
-0.9096113, -1.53504, -2.075131, 1, 0, 0, 1, 1,
-0.9050454, -0.01235396, -1.332437, 1, 0, 0, 1, 1,
-0.9049435, 1.272007, -2.863996, 1, 0, 0, 1, 1,
-0.9038986, -1.063629, -3.221643, 1, 0, 0, 1, 1,
-0.9031584, 1.505066, -0.7471666, 0, 0, 0, 1, 1,
-0.9022998, 1.115423, 0.4430833, 0, 0, 0, 1, 1,
-0.8997126, -1.796766, -3.263467, 0, 0, 0, 1, 1,
-0.8964117, 0.8828129, -0.2736939, 0, 0, 0, 1, 1,
-0.8921461, -1.03749, -1.536168, 0, 0, 0, 1, 1,
-0.8860648, 1.159166, -1.08269, 0, 0, 0, 1, 1,
-0.8854464, -1.456156, -3.417283, 0, 0, 0, 1, 1,
-0.8840008, 2.044669, -1.175879, 1, 1, 1, 1, 1,
-0.8818108, 0.2560876, -1.195956, 1, 1, 1, 1, 1,
-0.8817306, -1.767809, -4.282586, 1, 1, 1, 1, 1,
-0.8783808, -0.3134373, -1.330602, 1, 1, 1, 1, 1,
-0.864504, 0.008696357, -1.298466, 1, 1, 1, 1, 1,
-0.8638262, 0.2085515, -0.7608687, 1, 1, 1, 1, 1,
-0.8620012, -1.11282, -2.64813, 1, 1, 1, 1, 1,
-0.8595864, -0.2325643, -2.537077, 1, 1, 1, 1, 1,
-0.8574156, 0.3217833, -2.447615, 1, 1, 1, 1, 1,
-0.8548894, -0.7162141, -2.560181, 1, 1, 1, 1, 1,
-0.8528318, 0.5831214, -0.997284, 1, 1, 1, 1, 1,
-0.8500642, -0.09088936, -1.624581, 1, 1, 1, 1, 1,
-0.8464051, 0.1126784, -2.022331, 1, 1, 1, 1, 1,
-0.8426316, 1.447383, -0.8395037, 1, 1, 1, 1, 1,
-0.8411381, 0.7580439, -1.28562, 1, 1, 1, 1, 1,
-0.8406193, 1.036712, 0.3802002, 0, 0, 1, 1, 1,
-0.8359548, 2.049898, -0.7750033, 1, 0, 0, 1, 1,
-0.8332282, -0.442109, -3.390878, 1, 0, 0, 1, 1,
-0.8300802, 0.8237188, -2.382307, 1, 0, 0, 1, 1,
-0.8240724, 0.1971579, -1.726614, 1, 0, 0, 1, 1,
-0.8232644, -0.2456813, -0.8038048, 1, 0, 0, 1, 1,
-0.8197501, -0.6473892, -2.570969, 0, 0, 0, 1, 1,
-0.81438, -0.7674201, -3.789921, 0, 0, 0, 1, 1,
-0.811769, 0.1725854, -0.832842, 0, 0, 0, 1, 1,
-0.8116423, 0.823726, 0.8877607, 0, 0, 0, 1, 1,
-0.8081201, -0.8458483, -2.055961, 0, 0, 0, 1, 1,
-0.8053094, -0.6705552, -2.269717, 0, 0, 0, 1, 1,
-0.803571, -0.7299528, -1.373721, 0, 0, 0, 1, 1,
-0.7909026, -0.249663, -2.02288, 1, 1, 1, 1, 1,
-0.7871516, -1.761251, -3.854892, 1, 1, 1, 1, 1,
-0.7851416, -0.9823667, -4.115436, 1, 1, 1, 1, 1,
-0.7830003, 0.6114373, -0.929068, 1, 1, 1, 1, 1,
-0.782371, 0.02893944, -1.904492, 1, 1, 1, 1, 1,
-0.7729749, 1.652102, -0.04485309, 1, 1, 1, 1, 1,
-0.7598516, 1.479361, -1.069445, 1, 1, 1, 1, 1,
-0.7581747, 0.9643732, -1.719156, 1, 1, 1, 1, 1,
-0.7560958, -0.1385134, 0.01106837, 1, 1, 1, 1, 1,
-0.7554435, 0.3244382, -1.246849, 1, 1, 1, 1, 1,
-0.7508045, 0.7425921, -0.4973991, 1, 1, 1, 1, 1,
-0.7450563, 1.154665, -0.5374104, 1, 1, 1, 1, 1,
-0.7449079, 0.7383569, -0.2053209, 1, 1, 1, 1, 1,
-0.7418953, 0.5830686, -1.157072, 1, 1, 1, 1, 1,
-0.7409592, -2.441825, -3.351411, 1, 1, 1, 1, 1,
-0.7406334, -1.689973, -0.7749541, 0, 0, 1, 1, 1,
-0.7389695, 0.4225382, -1.025984, 1, 0, 0, 1, 1,
-0.7379727, -0.02229526, -1.930657, 1, 0, 0, 1, 1,
-0.7362245, 0.7249545, -1.318499, 1, 0, 0, 1, 1,
-0.7349314, -1.225379, -2.490262, 1, 0, 0, 1, 1,
-0.7252867, -0.4878682, -1.055415, 1, 0, 0, 1, 1,
-0.7198914, -0.4016778, -1.60087, 0, 0, 0, 1, 1,
-0.7174236, 0.704741, -1.750877, 0, 0, 0, 1, 1,
-0.715953, -0.9346433, -3.608946, 0, 0, 0, 1, 1,
-0.714056, -2.842478, -2.058585, 0, 0, 0, 1, 1,
-0.7096195, 0.01867905, -0.666716, 0, 0, 0, 1, 1,
-0.7042988, 1.170424, 0.1721153, 0, 0, 0, 1, 1,
-0.7001307, -1.883037, -3.192771, 0, 0, 0, 1, 1,
-0.6999447, -0.3659253, -4.403656, 1, 1, 1, 1, 1,
-0.6975173, 0.03430847, -1.209213, 1, 1, 1, 1, 1,
-0.6915437, 0.3043752, -0.8175584, 1, 1, 1, 1, 1,
-0.6874166, -1.473657, -2.198124, 1, 1, 1, 1, 1,
-0.6804717, 0.9947667, -3.018044, 1, 1, 1, 1, 1,
-0.6768164, 1.823575, 0.4270838, 1, 1, 1, 1, 1,
-0.6734087, 0.7582799, 0.6330922, 1, 1, 1, 1, 1,
-0.6724519, -0.4835652, -2.960747, 1, 1, 1, 1, 1,
-0.6705978, -0.590689, -2.729136, 1, 1, 1, 1, 1,
-0.6654807, -0.2172702, -1.322631, 1, 1, 1, 1, 1,
-0.6595212, 1.450515, 0.3158799, 1, 1, 1, 1, 1,
-0.6592811, 1.184324, 0.7104326, 1, 1, 1, 1, 1,
-0.6574471, -0.1150216, -3.050802, 1, 1, 1, 1, 1,
-0.6568526, 0.6534404, -1.295669, 1, 1, 1, 1, 1,
-0.6525048, 1.333491, -0.5942144, 1, 1, 1, 1, 1,
-0.6324618, 0.8588654, -0.6824476, 0, 0, 1, 1, 1,
-0.6310668, -0.04847338, -0.8690403, 1, 0, 0, 1, 1,
-0.6277931, -0.1561868, -3.50283, 1, 0, 0, 1, 1,
-0.6277298, -0.4267671, -1.393399, 1, 0, 0, 1, 1,
-0.6267843, 0.8839129, -0.2335539, 1, 0, 0, 1, 1,
-0.626072, 1.038283, 0.1200342, 1, 0, 0, 1, 1,
-0.6182337, -1.012825, -1.324637, 0, 0, 0, 1, 1,
-0.6108756, -0.2506545, -2.413993, 0, 0, 0, 1, 1,
-0.5961566, 1.0665, -0.7823924, 0, 0, 0, 1, 1,
-0.5923419, 0.8656225, -1.474885, 0, 0, 0, 1, 1,
-0.5920338, -2.235667, -3.330259, 0, 0, 0, 1, 1,
-0.5875821, -1.760954, -3.019378, 0, 0, 0, 1, 1,
-0.5821568, -1.679932, -3.366139, 0, 0, 0, 1, 1,
-0.5815473, -1.792293, -4.440243, 1, 1, 1, 1, 1,
-0.5798367, 0.6844044, -0.2480222, 1, 1, 1, 1, 1,
-0.5777058, 0.2551963, -0.6850483, 1, 1, 1, 1, 1,
-0.5773801, -1.495231, -3.165058, 1, 1, 1, 1, 1,
-0.5751201, 0.3928634, -2.219025, 1, 1, 1, 1, 1,
-0.5749063, -2.108709, -3.330006, 1, 1, 1, 1, 1,
-0.5716873, 0.05244111, -3.161837, 1, 1, 1, 1, 1,
-0.5706884, -0.1524287, -0.2129129, 1, 1, 1, 1, 1,
-0.5706447, 0.7217544, 0.7633277, 1, 1, 1, 1, 1,
-0.5696027, 0.3264082, -1.053136, 1, 1, 1, 1, 1,
-0.557445, 0.11722, -0.6602172, 1, 1, 1, 1, 1,
-0.5567399, 0.6947615, 0.9708989, 1, 1, 1, 1, 1,
-0.5507666, -1.833008, -3.809425, 1, 1, 1, 1, 1,
-0.550036, 2.515707, -0.4849255, 1, 1, 1, 1, 1,
-0.5488639, -0.6275626, -3.654437, 1, 1, 1, 1, 1,
-0.5481637, 1.1723, -0.6675329, 0, 0, 1, 1, 1,
-0.5475186, -0.09017046, -0.4427952, 1, 0, 0, 1, 1,
-0.5448316, -1.343143, -3.102583, 1, 0, 0, 1, 1,
-0.5403911, 0.7509465, 0.07297263, 1, 0, 0, 1, 1,
-0.5390206, -0.8776293, -2.486738, 1, 0, 0, 1, 1,
-0.5381652, -0.05452697, -1.895658, 1, 0, 0, 1, 1,
-0.5362074, -0.9609917, -3.266285, 0, 0, 0, 1, 1,
-0.5261999, 0.4355742, -1.015749, 0, 0, 0, 1, 1,
-0.5216997, 1.038931, -0.5591093, 0, 0, 0, 1, 1,
-0.5212868, -1.505561, -2.411875, 0, 0, 0, 1, 1,
-0.5199041, -0.04453108, -1.743453, 0, 0, 0, 1, 1,
-0.5184564, 0.4356771, -0.3199321, 0, 0, 0, 1, 1,
-0.5118519, 0.4051277, -0.1485274, 0, 0, 0, 1, 1,
-0.5112746, -2.31575, -2.997366, 1, 1, 1, 1, 1,
-0.5073495, 0.8683616, 0.7150789, 1, 1, 1, 1, 1,
-0.5068904, 0.81406, -0.7298238, 1, 1, 1, 1, 1,
-0.5044518, 0.7402591, 0.924021, 1, 1, 1, 1, 1,
-0.5019774, 0.2904535, -0.3274924, 1, 1, 1, 1, 1,
-0.4937772, -0.485677, -1.912447, 1, 1, 1, 1, 1,
-0.491759, -1.436616, -4.60695, 1, 1, 1, 1, 1,
-0.4891528, -2.113636, -3.270236, 1, 1, 1, 1, 1,
-0.4871083, 1.628197, -1.132199, 1, 1, 1, 1, 1,
-0.4810566, 2.030655, -1.626549, 1, 1, 1, 1, 1,
-0.4798953, 0.37347, -1.484714, 1, 1, 1, 1, 1,
-0.4761563, -0.1396369, -1.938081, 1, 1, 1, 1, 1,
-0.4718128, 0.6109408, -0.2531335, 1, 1, 1, 1, 1,
-0.4595292, -0.2018686, -1.643894, 1, 1, 1, 1, 1,
-0.4517037, 0.2580776, -0.9392358, 1, 1, 1, 1, 1,
-0.4509253, 0.3859039, -0.4365102, 0, 0, 1, 1, 1,
-0.4492052, 1.595534, -0.6530207, 1, 0, 0, 1, 1,
-0.4471331, -1.90861, -0.4819292, 1, 0, 0, 1, 1,
-0.4470701, 0.2443025, -2.530085, 1, 0, 0, 1, 1,
-0.4444332, 1.597691, 0.8492587, 1, 0, 0, 1, 1,
-0.4351506, -0.112543, -0.9279843, 1, 0, 0, 1, 1,
-0.4333069, -0.6568918, -2.452187, 0, 0, 0, 1, 1,
-0.4252932, -0.7532138, -3.39679, 0, 0, 0, 1, 1,
-0.4231389, 1.347719, -1.218547, 0, 0, 0, 1, 1,
-0.4173024, 0.5756955, -0.6738216, 0, 0, 0, 1, 1,
-0.4125446, 0.9131062, -0.7525928, 0, 0, 0, 1, 1,
-0.4105067, 1.274179, 0.3825273, 0, 0, 0, 1, 1,
-0.4024878, -0.04692395, 0.9978397, 0, 0, 0, 1, 1,
-0.397288, -1.553484, -3.438295, 1, 1, 1, 1, 1,
-0.39612, 0.9876379, -0.3640864, 1, 1, 1, 1, 1,
-0.3935276, 1.152752, -1.013441, 1, 1, 1, 1, 1,
-0.3895937, -0.9070448, -2.274775, 1, 1, 1, 1, 1,
-0.3868298, 0.09025801, -2.618241, 1, 1, 1, 1, 1,
-0.3858085, -1.441684, -4.421738, 1, 1, 1, 1, 1,
-0.3820281, 0.9518242, 0.6266882, 1, 1, 1, 1, 1,
-0.378822, -2.440007, -3.273238, 1, 1, 1, 1, 1,
-0.3768168, -0.9406615, -2.973239, 1, 1, 1, 1, 1,
-0.3753401, -0.461363, -3.013977, 1, 1, 1, 1, 1,
-0.3731847, -0.829612, -1.290775, 1, 1, 1, 1, 1,
-0.3728521, 0.367455, -1.678035, 1, 1, 1, 1, 1,
-0.3676939, 0.9577678, -0.114627, 1, 1, 1, 1, 1,
-0.3662837, 1.610562, -0.06758737, 1, 1, 1, 1, 1,
-0.3587606, 0.8463407, -2.667319, 1, 1, 1, 1, 1,
-0.3576218, -0.7661008, -0.8982745, 0, 0, 1, 1, 1,
-0.3572215, -1.138214, -5.788342, 1, 0, 0, 1, 1,
-0.3554716, 0.9478616, -1.46284, 1, 0, 0, 1, 1,
-0.3553168, 0.7176563, -0.003976833, 1, 0, 0, 1, 1,
-0.352742, -0.9819504, -3.827574, 1, 0, 0, 1, 1,
-0.3517135, -1.175801, -2.808822, 1, 0, 0, 1, 1,
-0.3495109, -0.3776133, -3.28156, 0, 0, 0, 1, 1,
-0.3430532, -1.332277, -1.31739, 0, 0, 0, 1, 1,
-0.3363009, -0.1782012, -1.481104, 0, 0, 0, 1, 1,
-0.326295, 1.232046, -2.601003, 0, 0, 0, 1, 1,
-0.3218642, 0.3453983, -2.28538, 0, 0, 0, 1, 1,
-0.3207785, 1.028622, -0.8271222, 0, 0, 0, 1, 1,
-0.3186655, -0.1928078, -1.824813, 0, 0, 0, 1, 1,
-0.3151585, -0.4700604, -1.186111, 1, 1, 1, 1, 1,
-0.3135063, -0.8871492, -2.573713, 1, 1, 1, 1, 1,
-0.310371, 1.827792, 0.3660706, 1, 1, 1, 1, 1,
-0.3036989, -0.3709636, -1.10593, 1, 1, 1, 1, 1,
-0.3016017, 0.4975736, -0.5844793, 1, 1, 1, 1, 1,
-0.297496, -0.5062963, -2.524215, 1, 1, 1, 1, 1,
-0.2961716, -1.165927, -2.383682, 1, 1, 1, 1, 1,
-0.2913761, -0.07079069, -2.501889, 1, 1, 1, 1, 1,
-0.291076, -0.2621978, -3.374959, 1, 1, 1, 1, 1,
-0.291056, -0.5658886, -1.89756, 1, 1, 1, 1, 1,
-0.2904887, 0.167369, -1.955111, 1, 1, 1, 1, 1,
-0.2838583, -0.2858039, -3.271352, 1, 1, 1, 1, 1,
-0.2828007, 1.990251, 0.7461268, 1, 1, 1, 1, 1,
-0.2827127, -0.94481, -2.703199, 1, 1, 1, 1, 1,
-0.2816809, -0.7985682, -2.942588, 1, 1, 1, 1, 1,
-0.2801, -0.659242, -1.881301, 0, 0, 1, 1, 1,
-0.2674408, 0.2560294, -0.3609099, 1, 0, 0, 1, 1,
-0.2664996, 0.4548891, -1.995685, 1, 0, 0, 1, 1,
-0.265211, 1.662642, -1.106836, 1, 0, 0, 1, 1,
-0.2631167, 0.3249829, 0.6081535, 1, 0, 0, 1, 1,
-0.2552655, -1.108854, -3.170062, 1, 0, 0, 1, 1,
-0.2550466, -1.537239, -3.720926, 0, 0, 0, 1, 1,
-0.2540507, 0.2663538, -0.2230084, 0, 0, 0, 1, 1,
-0.2535132, 1.851461, -0.3830175, 0, 0, 0, 1, 1,
-0.2530493, -0.4544535, -1.724364, 0, 0, 0, 1, 1,
-0.2530041, 0.532676, -0.673297, 0, 0, 0, 1, 1,
-0.2523054, -1.179922, -4.142927, 0, 0, 0, 1, 1,
-0.2485921, -0.6269618, -2.73039, 0, 0, 0, 1, 1,
-0.2438619, 1.679296, 0.03356088, 1, 1, 1, 1, 1,
-0.2435051, -0.8699157, -1.406679, 1, 1, 1, 1, 1,
-0.2343576, -1.670628, -1.97664, 1, 1, 1, 1, 1,
-0.2308735, 1.346919, -1.087909, 1, 1, 1, 1, 1,
-0.2275227, 0.716256, 0.7943978, 1, 1, 1, 1, 1,
-0.2178834, -1.337259, -4.431261, 1, 1, 1, 1, 1,
-0.216826, 0.8706575, 0.1540858, 1, 1, 1, 1, 1,
-0.2123712, -0.3215785, -3.24504, 1, 1, 1, 1, 1,
-0.2085908, -0.186552, -2.020624, 1, 1, 1, 1, 1,
-0.2065013, -0.06406727, -1.920302, 1, 1, 1, 1, 1,
-0.1998733, -1.209044, -0.9826655, 1, 1, 1, 1, 1,
-0.1934885, 0.4473738, -1.204099, 1, 1, 1, 1, 1,
-0.1863125, -0.9532011, -1.764448, 1, 1, 1, 1, 1,
-0.1861805, 0.8696969, 1.262928, 1, 1, 1, 1, 1,
-0.1859464, 1.753381, -0.02151619, 1, 1, 1, 1, 1,
-0.1856638, 0.7821608, 0.2405272, 0, 0, 1, 1, 1,
-0.1841635, -0.1436873, -2.730382, 1, 0, 0, 1, 1,
-0.1832452, -0.5106624, -0.757363, 1, 0, 0, 1, 1,
-0.1831712, 0.6910937, 1.695459, 1, 0, 0, 1, 1,
-0.1830157, 1.215235, 1.201545, 1, 0, 0, 1, 1,
-0.1800876, 0.4807769, -0.5695279, 1, 0, 0, 1, 1,
-0.1785358, -0.1293329, -1.804591, 0, 0, 0, 1, 1,
-0.1695427, -0.1657456, -2.692117, 0, 0, 0, 1, 1,
-0.1650321, 1.151637, 1.935156, 0, 0, 0, 1, 1,
-0.1641879, -0.4072977, -2.614472, 0, 0, 0, 1, 1,
-0.1603378, -0.2064121, -1.393286, 0, 0, 0, 1, 1,
-0.1597563, -0.4226538, -2.579592, 0, 0, 0, 1, 1,
-0.1589475, 0.6654816, -0.7425393, 0, 0, 0, 1, 1,
-0.1572412, 1.009261, -0.9053644, 1, 1, 1, 1, 1,
-0.1570606, -0.03934446, -1.194777, 1, 1, 1, 1, 1,
-0.1557705, 0.4114431, 1.696858, 1, 1, 1, 1, 1,
-0.1490235, -1.061286, -3.523871, 1, 1, 1, 1, 1,
-0.1358764, 1.111406, -0.7806501, 1, 1, 1, 1, 1,
-0.1315056, 0.1463452, 0.0396657, 1, 1, 1, 1, 1,
-0.1245309, 1.286572, -0.2478141, 1, 1, 1, 1, 1,
-0.1241643, -1.076921, -3.394602, 1, 1, 1, 1, 1,
-0.1234111, 0.1266635, 0.4416766, 1, 1, 1, 1, 1,
-0.1202898, -1.540341, -3.54604, 1, 1, 1, 1, 1,
-0.115604, 0.04903014, -1.667976, 1, 1, 1, 1, 1,
-0.1136949, -1.065993, -2.493433, 1, 1, 1, 1, 1,
-0.1114137, -0.4701203, -2.455773, 1, 1, 1, 1, 1,
-0.1084563, 0.5658998, -0.09505601, 1, 1, 1, 1, 1,
-0.1062518, -1.213538, -2.904389, 1, 1, 1, 1, 1,
-0.1026767, 1.051988, 1.730922, 0, 0, 1, 1, 1,
-0.09424685, 1.426455, 0.204947, 1, 0, 0, 1, 1,
-0.09180171, 1.269303, -0.8218459, 1, 0, 0, 1, 1,
-0.08809882, -0.6646625, -2.740124, 1, 0, 0, 1, 1,
-0.08641367, -0.0746745, -1.727368, 1, 0, 0, 1, 1,
-0.0850685, 1.408895, -0.4776354, 1, 0, 0, 1, 1,
-0.07913628, 1.352949, -0.8955287, 0, 0, 0, 1, 1,
-0.07436247, 0.6692966, 1.543345, 0, 0, 0, 1, 1,
-0.07183377, -0.2204413, -2.900472, 0, 0, 0, 1, 1,
-0.070534, 0.6707206, 0.4677768, 0, 0, 0, 1, 1,
-0.06997021, -0.8838425, -3.848213, 0, 0, 0, 1, 1,
-0.06862244, 0.7440357, 0.3139299, 0, 0, 0, 1, 1,
-0.06567483, -0.1010845, -3.637389, 0, 0, 0, 1, 1,
-0.06518786, 0.7241378, 1.623979, 1, 1, 1, 1, 1,
-0.06471818, 1.437203, 0.4643031, 1, 1, 1, 1, 1,
-0.06018522, -0.5810642, -2.595284, 1, 1, 1, 1, 1,
-0.05569021, -0.2330723, -2.743222, 1, 1, 1, 1, 1,
-0.05568479, 0.9234565, 0.8879659, 1, 1, 1, 1, 1,
-0.04986674, -0.6878391, -3.186925, 1, 1, 1, 1, 1,
-0.04935911, 0.8526143, -0.3558594, 1, 1, 1, 1, 1,
-0.04811902, 1.122403, -2.055199, 1, 1, 1, 1, 1,
-0.04630333, -1.716915, -4.385803, 1, 1, 1, 1, 1,
-0.03973979, -0.267125, -1.946418, 1, 1, 1, 1, 1,
-0.03962878, -2.132433, -4.454183, 1, 1, 1, 1, 1,
-0.03122956, -0.06048022, -3.655859, 1, 1, 1, 1, 1,
-0.03028391, -0.187864, -3.979024, 1, 1, 1, 1, 1,
-0.03026182, 0.5508088, 0.2979731, 1, 1, 1, 1, 1,
-0.02764191, 1.271155, 1.312249, 1, 1, 1, 1, 1,
-0.02661664, 1.543404, 0.1227518, 0, 0, 1, 1, 1,
-0.02421054, -0.8028352, -3.862547, 1, 0, 0, 1, 1,
-0.02045601, 0.7216811, 1.669071, 1, 0, 0, 1, 1,
-0.0169887, -0.6238723, -1.719131, 1, 0, 0, 1, 1,
-0.01602699, 0.7083573, -0.07651641, 1, 0, 0, 1, 1,
-0.01236982, 1.60946, -0.2806595, 1, 0, 0, 1, 1,
-0.01116049, 0.02377194, 0.2646904, 0, 0, 0, 1, 1,
-0.009780574, -0.83596, -5.017427, 0, 0, 0, 1, 1,
-0.006572829, -1.669389, -3.021413, 0, 0, 0, 1, 1,
-0.003130567, 0.1488096, 0.9437683, 0, 0, 0, 1, 1,
-0.001041544, 2.962258, 0.1002739, 0, 0, 0, 1, 1,
0.002055873, 0.655875, -1.359238, 0, 0, 0, 1, 1,
0.003835228, -0.6320689, 2.561787, 0, 0, 0, 1, 1,
0.005006869, 0.294969, 0.8762492, 1, 1, 1, 1, 1,
0.0081105, 0.2069008, -0.1491311, 1, 1, 1, 1, 1,
0.01059293, 0.4270248, 0.3805954, 1, 1, 1, 1, 1,
0.012809, 0.1473936, 1.763269, 1, 1, 1, 1, 1,
0.0133225, 0.1682034, -0.319944, 1, 1, 1, 1, 1,
0.01587965, -0.2524592, 3.030327, 1, 1, 1, 1, 1,
0.01742525, -0.6868693, 4.015099, 1, 1, 1, 1, 1,
0.01786189, -0.4621579, 5.099544, 1, 1, 1, 1, 1,
0.01788102, -0.5158315, 3.350418, 1, 1, 1, 1, 1,
0.02023195, 0.6997773, 1.472028, 1, 1, 1, 1, 1,
0.0270992, 0.9708388, -1.595467, 1, 1, 1, 1, 1,
0.02861086, 0.8812119, 0.440736, 1, 1, 1, 1, 1,
0.02879634, -0.4460927, 3.475262, 1, 1, 1, 1, 1,
0.03104104, 0.08558836, 2.230009, 1, 1, 1, 1, 1,
0.0311302, 1.491266, 1.664375, 1, 1, 1, 1, 1,
0.03269989, 0.9790767, -0.3544, 0, 0, 1, 1, 1,
0.03651762, -0.5112225, 2.443497, 1, 0, 0, 1, 1,
0.03688774, 0.3484349, -0.439698, 1, 0, 0, 1, 1,
0.04309477, 1.733412, 0.4189775, 1, 0, 0, 1, 1,
0.04701889, -0.2119796, 1.2155, 1, 0, 0, 1, 1,
0.04751926, 0.04144211, 1.021288, 1, 0, 0, 1, 1,
0.05487404, -0.6266392, 1.308685, 0, 0, 0, 1, 1,
0.06527305, 2.174201, 0.671556, 0, 0, 0, 1, 1,
0.06708198, 1.070979, -0.5659491, 0, 0, 0, 1, 1,
0.06938327, 0.4416533, -1.102589, 0, 0, 0, 1, 1,
0.06992336, -1.410138, 2.259434, 0, 0, 0, 1, 1,
0.07150217, 0.5233932, -0.3951213, 0, 0, 0, 1, 1,
0.07699525, 0.9164973, -0.2611888, 0, 0, 0, 1, 1,
0.07762436, 0.9114421, -0.03926049, 1, 1, 1, 1, 1,
0.07822557, 0.1054922, 1.675016, 1, 1, 1, 1, 1,
0.0792759, 0.005630091, 2.250516, 1, 1, 1, 1, 1,
0.07930061, -0.9573668, 4.774963, 1, 1, 1, 1, 1,
0.08064885, -0.1099237, 3.160297, 1, 1, 1, 1, 1,
0.08331116, 0.4940545, 0.2293332, 1, 1, 1, 1, 1,
0.08552731, 0.6870618, -0.6822278, 1, 1, 1, 1, 1,
0.08669289, -0.1027576, 3.330483, 1, 1, 1, 1, 1,
0.08870146, 0.5953946, -0.3308131, 1, 1, 1, 1, 1,
0.08965864, -0.4896121, 2.44883, 1, 1, 1, 1, 1,
0.09127576, 1.185242, 0.8013121, 1, 1, 1, 1, 1,
0.09325139, 0.7236553, 1.504976, 1, 1, 1, 1, 1,
0.09435379, 0.05401072, 0.5451366, 1, 1, 1, 1, 1,
0.09582947, 0.0009013123, 1.918993, 1, 1, 1, 1, 1,
0.1000146, 0.2502162, -0.2914115, 1, 1, 1, 1, 1,
0.10037, -0.809358, 2.002063, 0, 0, 1, 1, 1,
0.1012785, 1.075497, 1.885023, 1, 0, 0, 1, 1,
0.1014688, -1.293818, 3.510722, 1, 0, 0, 1, 1,
0.1109311, 0.4015917, -0.9090125, 1, 0, 0, 1, 1,
0.1113951, 1.403288, 2.169112, 1, 0, 0, 1, 1,
0.1162765, 0.4397296, 0.1773678, 1, 0, 0, 1, 1,
0.1250892, -0.2762562, 0.27094, 0, 0, 0, 1, 1,
0.1252964, -0.9872769, 2.280438, 0, 0, 0, 1, 1,
0.1258095, -0.4059136, 3.209117, 0, 0, 0, 1, 1,
0.1266033, -0.3380872, 2.716777, 0, 0, 0, 1, 1,
0.1299427, -0.1496414, 1.518282, 0, 0, 0, 1, 1,
0.1326783, 0.8604171, 1.468514, 0, 0, 0, 1, 1,
0.1331866, -0.2265311, 3.290356, 0, 0, 0, 1, 1,
0.1331958, -0.03544508, 1.639781, 1, 1, 1, 1, 1,
0.1364144, -0.3986836, 3.696109, 1, 1, 1, 1, 1,
0.1395235, 0.4454759, -0.07295471, 1, 1, 1, 1, 1,
0.140899, -0.2842013, 2.23511, 1, 1, 1, 1, 1,
0.1435072, 0.009997359, 2.423533, 1, 1, 1, 1, 1,
0.1474061, 0.4150409, 0.3116772, 1, 1, 1, 1, 1,
0.1498327, 0.6338795, 0.205699, 1, 1, 1, 1, 1,
0.1504523, -0.7330111, 2.951135, 1, 1, 1, 1, 1,
0.1506972, -0.7900103, 4.084424, 1, 1, 1, 1, 1,
0.155093, 0.4307866, -0.4666896, 1, 1, 1, 1, 1,
0.1555684, -0.7668571, 3.459832, 1, 1, 1, 1, 1,
0.1565074, -2.479356, 3.408851, 1, 1, 1, 1, 1,
0.1615716, 0.8831114, 0.687875, 1, 1, 1, 1, 1,
0.1649908, 1.101397, -0.1202446, 1, 1, 1, 1, 1,
0.1659333, 0.9394119, 0.2394599, 1, 1, 1, 1, 1,
0.1701763, -1.293809, 2.221884, 0, 0, 1, 1, 1,
0.1725006, -1.285272, 4.146241, 1, 0, 0, 1, 1,
0.1762664, -1.563082, 3.12026, 1, 0, 0, 1, 1,
0.1782235, -0.9095501, 2.873806, 1, 0, 0, 1, 1,
0.179004, -0.3814025, 2.079761, 1, 0, 0, 1, 1,
0.1795367, -0.9051805, 2.785484, 1, 0, 0, 1, 1,
0.1822627, -2.215151, 2.779514, 0, 0, 0, 1, 1,
0.187877, 0.696996, 1.08284, 0, 0, 0, 1, 1,
0.1887071, -0.1633413, 2.081746, 0, 0, 0, 1, 1,
0.1920916, 0.7181543, -1.145763, 0, 0, 0, 1, 1,
0.1922547, 0.6298656, 0.4647682, 0, 0, 0, 1, 1,
0.1957195, -0.8583922, 4.549902, 0, 0, 0, 1, 1,
0.1961139, 0.6234671, 0.5375742, 0, 0, 0, 1, 1,
0.2008, 1.115574, 0.7412043, 1, 1, 1, 1, 1,
0.2040516, -0.09957711, 3.493065, 1, 1, 1, 1, 1,
0.2075234, 0.3106093, 0.5435002, 1, 1, 1, 1, 1,
0.209917, 2.142671, 0.8328217, 1, 1, 1, 1, 1,
0.2147953, -1.223783, 2.88474, 1, 1, 1, 1, 1,
0.2149687, -0.6091099, 2.689479, 1, 1, 1, 1, 1,
0.2161553, 0.4453507, -1.370181, 1, 1, 1, 1, 1,
0.2196557, 0.4435939, 0.9731377, 1, 1, 1, 1, 1,
0.2210513, -1.429506, 1.472034, 1, 1, 1, 1, 1,
0.2305786, -0.1340664, 2.949175, 1, 1, 1, 1, 1,
0.2316722, -1.446711, 2.121717, 1, 1, 1, 1, 1,
0.2322124, -0.1840282, 2.537075, 1, 1, 1, 1, 1,
0.2384157, -0.04952211, 4.188768, 1, 1, 1, 1, 1,
0.2402758, 1.307554, -0.9719189, 1, 1, 1, 1, 1,
0.2407498, -0.5207936, 2.432806, 1, 1, 1, 1, 1,
0.2480601, 1.728715, 0.785988, 0, 0, 1, 1, 1,
0.2489953, -0.2831772, 1.533789, 1, 0, 0, 1, 1,
0.2491255, 2.045703, -1.09226, 1, 0, 0, 1, 1,
0.250015, 1.063926, 0.03827881, 1, 0, 0, 1, 1,
0.2534606, 1.075841, -0.1158435, 1, 0, 0, 1, 1,
0.2541798, 0.7940614, -1.161957, 1, 0, 0, 1, 1,
0.2577753, -1.040236, 1.697972, 0, 0, 0, 1, 1,
0.2607897, 0.3504138, 1.768269, 0, 0, 0, 1, 1,
0.2639143, -0.9488723, 1.740585, 0, 0, 0, 1, 1,
0.2656765, 0.9514964, -1.396904, 0, 0, 0, 1, 1,
0.2660339, 0.4326781, 0.6056797, 0, 0, 0, 1, 1,
0.2703157, -0.460447, 1.183068, 0, 0, 0, 1, 1,
0.2735029, 1.831598, 2.015142, 0, 0, 0, 1, 1,
0.2751496, -0.4552896, 2.382641, 1, 1, 1, 1, 1,
0.2836984, -1.547383, 2.177681, 1, 1, 1, 1, 1,
0.286611, -1.637875, 3.157148, 1, 1, 1, 1, 1,
0.2883888, 1.008092, 1.388744, 1, 1, 1, 1, 1,
0.291515, -1.204376, 4.18342, 1, 1, 1, 1, 1,
0.2926327, -1.529519, 2.110148, 1, 1, 1, 1, 1,
0.306385, -0.07310679, 0.6401594, 1, 1, 1, 1, 1,
0.3069032, -0.05322494, 3.063844, 1, 1, 1, 1, 1,
0.3071102, 0.04879703, 2.359225, 1, 1, 1, 1, 1,
0.309877, -0.2941146, 1.128472, 1, 1, 1, 1, 1,
0.3125239, -0.8899243, 2.206616, 1, 1, 1, 1, 1,
0.3130906, 1.869919, 1.511596, 1, 1, 1, 1, 1,
0.3148898, 1.005147, 1.198795, 1, 1, 1, 1, 1,
0.3167481, 1.305128, -1.212355, 1, 1, 1, 1, 1,
0.3169491, -0.5268651, 2.440883, 1, 1, 1, 1, 1,
0.3180216, 0.05230175, 1.508947, 0, 0, 1, 1, 1,
0.3240232, 0.6776136, 2.569353, 1, 0, 0, 1, 1,
0.3244255, -0.6152722, 2.684115, 1, 0, 0, 1, 1,
0.3252391, 1.36253, 0.323144, 1, 0, 0, 1, 1,
0.3264655, -0.0987113, 1.116709, 1, 0, 0, 1, 1,
0.3309954, 0.1699055, -0.3556696, 1, 0, 0, 1, 1,
0.3314316, -0.3963701, 4.307593, 0, 0, 0, 1, 1,
0.3319815, 0.6241521, 1.608979, 0, 0, 0, 1, 1,
0.3319929, -1.593831, 3.857224, 0, 0, 0, 1, 1,
0.3334237, 0.2132777, -1.6088, 0, 0, 0, 1, 1,
0.3391853, -0.6098709, 3.63035, 0, 0, 0, 1, 1,
0.339405, -0.6967542, 3.919019, 0, 0, 0, 1, 1,
0.3394431, 1.592401, 0.5155401, 0, 0, 0, 1, 1,
0.3399624, -0.2814009, 2.327348, 1, 1, 1, 1, 1,
0.3465537, -0.7802258, 3.308619, 1, 1, 1, 1, 1,
0.348052, 1.5038, 0.5184869, 1, 1, 1, 1, 1,
0.3497829, 0.2199729, 0.4223087, 1, 1, 1, 1, 1,
0.3519311, -0.2906411, 1.17616, 1, 1, 1, 1, 1,
0.3535136, 0.07442535, 2.638695, 1, 1, 1, 1, 1,
0.3540977, -0.7336638, 2.837688, 1, 1, 1, 1, 1,
0.3567488, 0.7191349, 0.927134, 1, 1, 1, 1, 1,
0.3604673, -0.6466618, 3.154941, 1, 1, 1, 1, 1,
0.3642673, 1.184791, -0.2377313, 1, 1, 1, 1, 1,
0.3659882, -0.4632038, 1.801037, 1, 1, 1, 1, 1,
0.3663644, 0.3444645, 0.6374961, 1, 1, 1, 1, 1,
0.3685641, 0.9554786, 1.407881, 1, 1, 1, 1, 1,
0.375404, -0.0547817, 1.261502, 1, 1, 1, 1, 1,
0.3773989, -1.191119, 2.526001, 1, 1, 1, 1, 1,
0.3799819, -0.3245736, 1.379211, 0, 0, 1, 1, 1,
0.3841887, 0.6016467, 0.1031306, 1, 0, 0, 1, 1,
0.3847734, 0.02021851, 2.772438, 1, 0, 0, 1, 1,
0.3946978, -1.789579, 3.736579, 1, 0, 0, 1, 1,
0.3998912, -0.941552, 3.239295, 1, 0, 0, 1, 1,
0.4030361, 0.7719014, -0.4640113, 1, 0, 0, 1, 1,
0.4033351, -0.767571, 3.864737, 0, 0, 0, 1, 1,
0.4058531, -0.1849963, 2.095902, 0, 0, 0, 1, 1,
0.4066758, 1.655729, -0.01541113, 0, 0, 0, 1, 1,
0.4085221, -0.5999523, 2.973772, 0, 0, 0, 1, 1,
0.4104882, -1.560462, 3.115817, 0, 0, 0, 1, 1,
0.4134686, 1.669962, -0.4625428, 0, 0, 0, 1, 1,
0.4148844, 0.7468805, 0.1553457, 0, 0, 0, 1, 1,
0.4150882, -0.7379489, 4.708346, 1, 1, 1, 1, 1,
0.4201555, 0.473028, -1.12121, 1, 1, 1, 1, 1,
0.4238192, -1.053093, 3.497276, 1, 1, 1, 1, 1,
0.4270596, -2.785775, 4.125859, 1, 1, 1, 1, 1,
0.4293386, 0.5726828, -0.704089, 1, 1, 1, 1, 1,
0.4315608, -0.6335619, 1.834153, 1, 1, 1, 1, 1,
0.4333254, -0.8456022, 0.579312, 1, 1, 1, 1, 1,
0.4339121, -1.079692, 2.008165, 1, 1, 1, 1, 1,
0.4347223, -0.644093, 2.293509, 1, 1, 1, 1, 1,
0.4387587, 2.182862, 1.035333, 1, 1, 1, 1, 1,
0.4388843, -0.3630052, 1.787134, 1, 1, 1, 1, 1,
0.4390472, 0.1177106, 0.4964884, 1, 1, 1, 1, 1,
0.4417776, -0.5957451, 1.541298, 1, 1, 1, 1, 1,
0.4429082, 0.3243171, 2.323877, 1, 1, 1, 1, 1,
0.4457566, -0.3769079, 1.51769, 1, 1, 1, 1, 1,
0.4523923, -0.2428988, 1.03966, 0, 0, 1, 1, 1,
0.4527664, -0.4498936, 3.540356, 1, 0, 0, 1, 1,
0.4584524, 0.3627562, -0.2827407, 1, 0, 0, 1, 1,
0.4609094, -0.2133821, 0.575682, 1, 0, 0, 1, 1,
0.4616285, 0.2838092, 0.8302023, 1, 0, 0, 1, 1,
0.4648452, 0.8797642, -1.145651, 1, 0, 0, 1, 1,
0.4718197, -0.147922, 1.078015, 0, 0, 0, 1, 1,
0.4725122, -0.6133058, 2.324492, 0, 0, 0, 1, 1,
0.474286, -0.8004167, 3.932133, 0, 0, 0, 1, 1,
0.4763466, -1.530008, 3.527382, 0, 0, 0, 1, 1,
0.4874052, 0.1173226, 1.369795, 0, 0, 0, 1, 1,
0.4907176, 0.4407846, 1.573296, 0, 0, 0, 1, 1,
0.4937994, -0.8909096, 3.98009, 0, 0, 0, 1, 1,
0.4959593, 0.9154229, 1.677569, 1, 1, 1, 1, 1,
0.4966336, -0.3008306, 1.842953, 1, 1, 1, 1, 1,
0.4981362, 0.6076631, -1.541393, 1, 1, 1, 1, 1,
0.4997071, -0.4737476, 2.855461, 1, 1, 1, 1, 1,
0.5004603, -1.872928, 2.611498, 1, 1, 1, 1, 1,
0.5035191, -0.02429429, 0.7452967, 1, 1, 1, 1, 1,
0.5036867, 1.006757, 1.020509, 1, 1, 1, 1, 1,
0.5042626, 1.042734, 1.625573, 1, 1, 1, 1, 1,
0.5054545, -1.288845, 2.91108, 1, 1, 1, 1, 1,
0.5062823, 0.4665418, 1.701135, 1, 1, 1, 1, 1,
0.5063996, 2.019097, -0.3015056, 1, 1, 1, 1, 1,
0.50686, 1.872239, 0.9666163, 1, 1, 1, 1, 1,
0.511649, -0.394626, 0.5990923, 1, 1, 1, 1, 1,
0.5128652, -0.5852047, 0.7975811, 1, 1, 1, 1, 1,
0.5132503, 0.6464043, -0.3206691, 1, 1, 1, 1, 1,
0.521584, 0.9749878, -0.2736938, 0, 0, 1, 1, 1,
0.5217712, -1.941195, 2.352927, 1, 0, 0, 1, 1,
0.5239604, -0.7726231, 1.808065, 1, 0, 0, 1, 1,
0.5264859, -1.24107, 2.947013, 1, 0, 0, 1, 1,
0.5385148, 0.8824955, 0.6684381, 1, 0, 0, 1, 1,
0.5387301, 0.8166933, -0.8605243, 1, 0, 0, 1, 1,
0.5397063, 0.6164992, 1.85667, 0, 0, 0, 1, 1,
0.5411028, 1.222367, 0.9690157, 0, 0, 0, 1, 1,
0.5529655, 1.583213, -0.8027264, 0, 0, 0, 1, 1,
0.5538422, 0.9649617, 0.5551283, 0, 0, 0, 1, 1,
0.5573817, -0.6524961, 1.506757, 0, 0, 0, 1, 1,
0.5616851, -0.1324372, 1.775239, 0, 0, 0, 1, 1,
0.5635085, -0.04120567, 1.008879, 0, 0, 0, 1, 1,
0.5654305, -1.052813, 2.37225, 1, 1, 1, 1, 1,
0.5678377, 0.4987008, 1.583807, 1, 1, 1, 1, 1,
0.5691164, -1.498855, 3.59166, 1, 1, 1, 1, 1,
0.5699524, 0.5616338, 1.226526, 1, 1, 1, 1, 1,
0.5706921, 0.2219499, 1.119065, 1, 1, 1, 1, 1,
0.5718647, -0.5661616, 1.804177, 1, 1, 1, 1, 1,
0.5759841, -1.132828, 2.648753, 1, 1, 1, 1, 1,
0.5763226, 0.8545039, -0.05318763, 1, 1, 1, 1, 1,
0.5806293, -1.45059, 2.172407, 1, 1, 1, 1, 1,
0.5817906, -0.254126, 3.219494, 1, 1, 1, 1, 1,
0.5870957, 0.6072322, 1.814051, 1, 1, 1, 1, 1,
0.5871286, 0.4731219, 1.565694, 1, 1, 1, 1, 1,
0.5881752, -0.6045086, 1.935483, 1, 1, 1, 1, 1,
0.5889333, -0.8507203, 1.770455, 1, 1, 1, 1, 1,
0.5891164, -0.7982498, 2.53091, 1, 1, 1, 1, 1,
0.5935591, 1.662854, 1.151058, 0, 0, 1, 1, 1,
0.594808, -0.3725416, 2.945105, 1, 0, 0, 1, 1,
0.6082235, -1.62093, 1.697352, 1, 0, 0, 1, 1,
0.6104189, -1.282904, 1.549778, 1, 0, 0, 1, 1,
0.6122029, -0.03991871, 3.320686, 1, 0, 0, 1, 1,
0.6170214, 1.271402, -0.6468706, 1, 0, 0, 1, 1,
0.6173632, 2.595061, 1.073775, 0, 0, 0, 1, 1,
0.6283679, 0.09437165, 2.08098, 0, 0, 0, 1, 1,
0.6296184, 0.3595108, 1.960579, 0, 0, 0, 1, 1,
0.6332863, 0.1124105, 0.4970237, 0, 0, 0, 1, 1,
0.6383908, 0.7543818, 1.578289, 0, 0, 0, 1, 1,
0.6410154, 0.05021644, 2.553253, 0, 0, 0, 1, 1,
0.641654, -0.7706871, 3.507294, 0, 0, 0, 1, 1,
0.6440602, -0.8310395, 4.60454, 1, 1, 1, 1, 1,
0.6479028, -0.0132999, 1.221086, 1, 1, 1, 1, 1,
0.6537963, -0.4234508, 2.702673, 1, 1, 1, 1, 1,
0.6547686, 1.606509, 1.399351, 1, 1, 1, 1, 1,
0.6683862, -1.136656, 3.267479, 1, 1, 1, 1, 1,
0.6846038, -0.2825675, 2.366036, 1, 1, 1, 1, 1,
0.6860437, -0.5360349, 1.600006, 1, 1, 1, 1, 1,
0.6943404, 0.8227019, 2.325471, 1, 1, 1, 1, 1,
0.6955931, 0.9681239, 0.8732839, 1, 1, 1, 1, 1,
0.6965222, -0.05447178, 2.011232, 1, 1, 1, 1, 1,
0.6970538, 0.4325942, -0.3080714, 1, 1, 1, 1, 1,
0.6970822, 0.3118697, 0.08736939, 1, 1, 1, 1, 1,
0.7009534, -0.1861321, 0.6383579, 1, 1, 1, 1, 1,
0.7014098, -0.04064539, 2.586208, 1, 1, 1, 1, 1,
0.7018569, -1.082331, 2.330088, 1, 1, 1, 1, 1,
0.7046045, 0.3758706, 3.074685, 0, 0, 1, 1, 1,
0.7050186, -1.168123, 1.209774, 1, 0, 0, 1, 1,
0.706309, 1.36175, 0.917364, 1, 0, 0, 1, 1,
0.7110133, 0.04346984, 1.782573, 1, 0, 0, 1, 1,
0.7142265, 2.684946, 0.3738365, 1, 0, 0, 1, 1,
0.7159729, 1.838289, -0.8314466, 1, 0, 0, 1, 1,
0.7169904, 0.3634791, 1.973625, 0, 0, 0, 1, 1,
0.7207835, -1.526822, 3.193749, 0, 0, 0, 1, 1,
0.7210605, 0.1243375, 3.91514, 0, 0, 0, 1, 1,
0.7229168, 1.612539, 0.5342721, 0, 0, 0, 1, 1,
0.7279373, 2.010136, -0.6249991, 0, 0, 0, 1, 1,
0.7283621, 0.2758747, 0.1874645, 0, 0, 0, 1, 1,
0.728561, 0.8474843, 1.255762, 0, 0, 0, 1, 1,
0.7309788, -0.3148918, 1.1063, 1, 1, 1, 1, 1,
0.7350225, 2.593259, -0.2065034, 1, 1, 1, 1, 1,
0.7379084, -0.7439551, 2.287398, 1, 1, 1, 1, 1,
0.7398426, -0.01707185, 0.9876367, 1, 1, 1, 1, 1,
0.7407772, 0.0005064945, 1.466424, 1, 1, 1, 1, 1,
0.7467029, -0.7017838, 3.576255, 1, 1, 1, 1, 1,
0.7481398, -1.474345, 2.907122, 1, 1, 1, 1, 1,
0.7488965, 1.445155, 1.10729, 1, 1, 1, 1, 1,
0.750501, -0.00219042, 0.777059, 1, 1, 1, 1, 1,
0.7513265, -0.6791239, 2.589482, 1, 1, 1, 1, 1,
0.7518591, 0.3308822, 1.454325, 1, 1, 1, 1, 1,
0.7520272, -0.5452631, 1.807123, 1, 1, 1, 1, 1,
0.7556667, -0.7854013, 3.343242, 1, 1, 1, 1, 1,
0.7604619, -0.7001284, 2.04448, 1, 1, 1, 1, 1,
0.762125, -1.375231, 2.161433, 1, 1, 1, 1, 1,
0.7761043, -0.2880463, 4.615392, 0, 0, 1, 1, 1,
0.7803237, 0.43972, -0.160815, 1, 0, 0, 1, 1,
0.7879099, -1.778868, 4.498294, 1, 0, 0, 1, 1,
0.7942335, 0.5430233, 0.9397458, 1, 0, 0, 1, 1,
0.7958451, -1.332192, 3.138244, 1, 0, 0, 1, 1,
0.798465, -0.05134229, 1.900548, 1, 0, 0, 1, 1,
0.8009242, 1.183168, 0.05408214, 0, 0, 0, 1, 1,
0.8066544, 0.4967425, 0.3156074, 0, 0, 0, 1, 1,
0.8132594, 0.1086638, 2.486532, 0, 0, 0, 1, 1,
0.8162774, 0.7689008, 1.007204, 0, 0, 0, 1, 1,
0.8191923, -1.01159, 3.93909, 0, 0, 0, 1, 1,
0.8202118, 2.46397, 1.815772, 0, 0, 0, 1, 1,
0.822581, -0.9915711, 2.946991, 0, 0, 0, 1, 1,
0.8330116, 1.125446, -0.476281, 1, 1, 1, 1, 1,
0.8350564, 0.211506, 0.8437825, 1, 1, 1, 1, 1,
0.8360615, -0.9003963, 2.220439, 1, 1, 1, 1, 1,
0.8375454, 0.8669028, 1.895473, 1, 1, 1, 1, 1,
0.8425925, 0.66687, -0.7474945, 1, 1, 1, 1, 1,
0.8437005, -0.08916389, 1.488447, 1, 1, 1, 1, 1,
0.8457813, -0.4496267, 3.487493, 1, 1, 1, 1, 1,
0.8460549, -0.3892404, 2.03074, 1, 1, 1, 1, 1,
0.8546801, 0.6314883, 0.4635382, 1, 1, 1, 1, 1,
0.857734, 0.1706625, 2.829818, 1, 1, 1, 1, 1,
0.8579038, -0.1551545, 3.635334, 1, 1, 1, 1, 1,
0.8580245, -1.035829, 2.160466, 1, 1, 1, 1, 1,
0.859032, -1.268027, 1.841065, 1, 1, 1, 1, 1,
0.8592941, -0.319592, 2.505578, 1, 1, 1, 1, 1,
0.8598787, -0.5999577, 2.377203, 1, 1, 1, 1, 1,
0.8624874, -0.9906489, 4.174643, 0, 0, 1, 1, 1,
0.866274, -1.327085, 4.314274, 1, 0, 0, 1, 1,
0.8695892, 1.737565, 0.5762457, 1, 0, 0, 1, 1,
0.8701165, 0.5860266, 0.2939005, 1, 0, 0, 1, 1,
0.8702058, 0.3488376, -0.8851346, 1, 0, 0, 1, 1,
0.8789025, 0.4084699, 0.5235541, 1, 0, 0, 1, 1,
0.8837035, 0.1903096, 1.604365, 0, 0, 0, 1, 1,
0.8842223, 0.7460647, -1.187052, 0, 0, 0, 1, 1,
0.888548, 0.8332511, 1.174353, 0, 0, 0, 1, 1,
0.8900704, 0.173524, 1.897766, 0, 0, 0, 1, 1,
0.8916625, -0.7652012, 2.087639, 0, 0, 0, 1, 1,
0.8933811, -1.330678, 4.08726, 0, 0, 0, 1, 1,
0.897434, 0.9477689, 0.8075297, 0, 0, 0, 1, 1,
0.8993376, 0.2881142, -0.1687152, 1, 1, 1, 1, 1,
0.9015647, 2.37954, -1.588367, 1, 1, 1, 1, 1,
0.9048354, 0.0199132, 3.323168, 1, 1, 1, 1, 1,
0.9079387, 0.8618967, -0.3414063, 1, 1, 1, 1, 1,
0.9168333, 0.6322104, 1.134531, 1, 1, 1, 1, 1,
0.9237983, -0.2870945, 1.2467, 1, 1, 1, 1, 1,
0.9273723, -1.851592, 2.572744, 1, 1, 1, 1, 1,
0.9320711, -0.3152355, 1.293777, 1, 1, 1, 1, 1,
0.9334693, -1.486323, 2.401008, 1, 1, 1, 1, 1,
0.9380497, 0.254879, 2.705345, 1, 1, 1, 1, 1,
0.9404817, 1.460786, 0.722917, 1, 1, 1, 1, 1,
0.9455029, -0.4027089, 1.194676, 1, 1, 1, 1, 1,
0.9487253, -1.525387, 2.809842, 1, 1, 1, 1, 1,
0.9502359, -1.639249, 2.225788, 1, 1, 1, 1, 1,
0.9518728, 0.209909, -0.6602681, 1, 1, 1, 1, 1,
0.966029, -1.015378, 2.652051, 0, 0, 1, 1, 1,
0.9681951, 0.6080986, 0.587331, 1, 0, 0, 1, 1,
0.9699862, -0.8363482, 2.568267, 1, 0, 0, 1, 1,
0.9701913, 0.9225477, 1.051516, 1, 0, 0, 1, 1,
0.9702978, -0.5566396, 0.7466561, 1, 0, 0, 1, 1,
0.9718596, 0.06805883, 3.374353, 1, 0, 0, 1, 1,
0.9723604, -0.7632759, 1.808383, 0, 0, 0, 1, 1,
0.9838465, -0.180999, 1.768727, 0, 0, 0, 1, 1,
0.9854556, 0.4469308, 1.73891, 0, 0, 0, 1, 1,
0.9864569, -0.05996745, 1.271848, 0, 0, 0, 1, 1,
0.9883032, -0.2101036, 1.685773, 0, 0, 0, 1, 1,
0.9886056, 1.381653, 2.214867, 0, 0, 0, 1, 1,
0.991409, -0.6859555, 2.463544, 0, 0, 0, 1, 1,
0.993397, 1.201201, -1.066972, 1, 1, 1, 1, 1,
0.9957024, 0.1109758, 0.49735, 1, 1, 1, 1, 1,
0.9980558, -1.162434, 4.106575, 1, 1, 1, 1, 1,
1.012458, 0.04329671, 1.102527, 1, 1, 1, 1, 1,
1.014626, 1.184408, 0.2375317, 1, 1, 1, 1, 1,
1.023265, 0.8679848, 2.089907, 1, 1, 1, 1, 1,
1.026463, -0.7920312, 1.669207, 1, 1, 1, 1, 1,
1.032665, -0.3052011, 3.13674, 1, 1, 1, 1, 1,
1.033653, 1.201337, 0.3473698, 1, 1, 1, 1, 1,
1.036138, -0.6167746, 4.861228, 1, 1, 1, 1, 1,
1.036409, 0.4963569, 1.922493, 1, 1, 1, 1, 1,
1.046134, -0.853075, 2.461961, 1, 1, 1, 1, 1,
1.049046, 0.7052684, 1.935754, 1, 1, 1, 1, 1,
1.050323, -0.03488845, 1.640466, 1, 1, 1, 1, 1,
1.051555, -0.8854111, 1.691041, 1, 1, 1, 1, 1,
1.051571, -0.1762073, 0.03431256, 0, 0, 1, 1, 1,
1.052287, 1.05146, -0.1600492, 1, 0, 0, 1, 1,
1.053908, -1.847485, 2.15731, 1, 0, 0, 1, 1,
1.073991, -0.8559479, 3.441479, 1, 0, 0, 1, 1,
1.07824, -0.4226377, 2.62119, 1, 0, 0, 1, 1,
1.093982, -1.326758, 1.063378, 1, 0, 0, 1, 1,
1.094104, -1.366388, 1.897727, 0, 0, 0, 1, 1,
1.109394, 0.4409528, 2.420255, 0, 0, 0, 1, 1,
1.111704, -1.360578, 3.273225, 0, 0, 0, 1, 1,
1.112283, -0.152278, 1.708541, 0, 0, 0, 1, 1,
1.116217, 1.856856, -0.1437358, 0, 0, 0, 1, 1,
1.120402, -1.279918, 2.854493, 0, 0, 0, 1, 1,
1.12245, 1.429555, 1.074484, 0, 0, 0, 1, 1,
1.134854, 0.05355358, 1.258422, 1, 1, 1, 1, 1,
1.135863, 0.7544819, 2.328426, 1, 1, 1, 1, 1,
1.137283, -1.105771, 4.112355, 1, 1, 1, 1, 1,
1.140226, 0.1935198, 1.178273, 1, 1, 1, 1, 1,
1.143992, 0.4163457, 2.579679, 1, 1, 1, 1, 1,
1.145362, -1.617712, 2.109854, 1, 1, 1, 1, 1,
1.148273, 1.257426, -1.037803, 1, 1, 1, 1, 1,
1.150267, -2.157084, 1.578714, 1, 1, 1, 1, 1,
1.151717, 1.704908, 0.546082, 1, 1, 1, 1, 1,
1.15322, 0.8617299, 0.6264024, 1, 1, 1, 1, 1,
1.154601, 0.953299, -1.472005, 1, 1, 1, 1, 1,
1.155655, 0.4079621, 3.547647, 1, 1, 1, 1, 1,
1.179849, 1.316471, 1.788068, 1, 1, 1, 1, 1,
1.187659, 1.514423, -0.04025004, 1, 1, 1, 1, 1,
1.19097, 1.845133, 0.9255655, 1, 1, 1, 1, 1,
1.196826, 1.012479, 2.38479, 0, 0, 1, 1, 1,
1.200418, 0.03298844, 1.480764, 1, 0, 0, 1, 1,
1.209662, 0.2789494, 1.295359, 1, 0, 0, 1, 1,
1.218511, -0.3431013, 2.824536, 1, 0, 0, 1, 1,
1.221607, 1.005901, 0.6171321, 1, 0, 0, 1, 1,
1.226352, -0.6943086, 1.782488, 1, 0, 0, 1, 1,
1.232114, 1.164365, -0.3216285, 0, 0, 0, 1, 1,
1.235415, 1.140635, 1.662708, 0, 0, 0, 1, 1,
1.235958, 0.05252419, 2.633521, 0, 0, 0, 1, 1,
1.237309, -2.160583, 3.179984, 0, 0, 0, 1, 1,
1.243061, 1.065453, -0.07115956, 0, 0, 0, 1, 1,
1.247306, -1.018636, 2.509308, 0, 0, 0, 1, 1,
1.254819, -1.44813, 2.086891, 0, 0, 0, 1, 1,
1.26141, -2.77055, 3.245091, 1, 1, 1, 1, 1,
1.263547, 2.016792, 1.502947, 1, 1, 1, 1, 1,
1.272271, 2.695107, -0.4494271, 1, 1, 1, 1, 1,
1.283704, 0.3699078, 2.671155, 1, 1, 1, 1, 1,
1.290876, -2.154045, 1.42672, 1, 1, 1, 1, 1,
1.292128, 0.4962139, -0.9630178, 1, 1, 1, 1, 1,
1.306216, -1.009918, 0.6199797, 1, 1, 1, 1, 1,
1.30742, -0.3135622, 2.329669, 1, 1, 1, 1, 1,
1.316027, 1.111522, 2.771138, 1, 1, 1, 1, 1,
1.342046, 2.001869, 1.779711, 1, 1, 1, 1, 1,
1.347975, 0.2760991, 0.311214, 1, 1, 1, 1, 1,
1.34838, 1.326485, -0.4501985, 1, 1, 1, 1, 1,
1.349677, 0.8057486, 1.040951, 1, 1, 1, 1, 1,
1.356415, -0.08975625, 0.1765197, 1, 1, 1, 1, 1,
1.358116, -0.1959768, 1.495732, 1, 1, 1, 1, 1,
1.363626, -0.8443955, 0.7743089, 0, 0, 1, 1, 1,
1.368452, 0.5382759, 2.261476, 1, 0, 0, 1, 1,
1.369406, 0.8405549, 0.5532063, 1, 0, 0, 1, 1,
1.37577, 1.7792, 1.160641, 1, 0, 0, 1, 1,
1.37887, 0.3307323, 1.382393, 1, 0, 0, 1, 1,
1.383057, 0.4486804, 0.4653773, 1, 0, 0, 1, 1,
1.385707, -0.6465216, 1.731982, 0, 0, 0, 1, 1,
1.414151, -1.158583, 2.122725, 0, 0, 0, 1, 1,
1.437131, -0.0875666, 0.7531006, 0, 0, 0, 1, 1,
1.44031, 1.850351, -0.6880741, 0, 0, 0, 1, 1,
1.447834, -0.4703113, 2.494574, 0, 0, 0, 1, 1,
1.450142, -0.2100265, 2.828845, 0, 0, 0, 1, 1,
1.452349, 1.587462, 0.1827328, 0, 0, 0, 1, 1,
1.462491, -1.339301, 1.888003, 1, 1, 1, 1, 1,
1.482168, 0.2605159, 2.805828, 1, 1, 1, 1, 1,
1.493984, 1.488671, 0.3349181, 1, 1, 1, 1, 1,
1.499478, -1.243585, 4.772371, 1, 1, 1, 1, 1,
1.504825, -1.474686, 2.400325, 1, 1, 1, 1, 1,
1.508724, -0.3914359, 1.327715, 1, 1, 1, 1, 1,
1.511853, 0.6062434, 2.647381, 1, 1, 1, 1, 1,
1.513212, -0.7922013, 0.7920799, 1, 1, 1, 1, 1,
1.51576, -0.04782313, 1.953644, 1, 1, 1, 1, 1,
1.521446, 0.01024611, 0.07091874, 1, 1, 1, 1, 1,
1.529502, 1.461873, 0.6576536, 1, 1, 1, 1, 1,
1.54715, -0.5768074, 0.4379125, 1, 1, 1, 1, 1,
1.553475, -0.2527374, 0.8315539, 1, 1, 1, 1, 1,
1.5551, -0.03546173, 1.937656, 1, 1, 1, 1, 1,
1.556239, 1.824626, 0.7819778, 1, 1, 1, 1, 1,
1.559336, -1.365192, 3.583116, 0, 0, 1, 1, 1,
1.57801, -0.5006904, 1.152954, 1, 0, 0, 1, 1,
1.580692, -0.6636555, 4.974929, 1, 0, 0, 1, 1,
1.593805, 0.2552138, 1.724341, 1, 0, 0, 1, 1,
1.65146, 0.3428208, -0.1538031, 1, 0, 0, 1, 1,
1.666823, 1.221891, 0.3102396, 1, 0, 0, 1, 1,
1.712788, 1.03991, 0.2956824, 0, 0, 0, 1, 1,
1.726376, 0.6197412, 1.813836, 0, 0, 0, 1, 1,
1.737783, 0.2347307, 1.297791, 0, 0, 0, 1, 1,
1.741378, 1.536147, 1.462532, 0, 0, 0, 1, 1,
1.751979, 0.1421375, 1.775707, 0, 0, 0, 1, 1,
1.762954, -1.128944, 2.671929, 0, 0, 0, 1, 1,
1.768756, 0.1267555, 1.560834, 0, 0, 0, 1, 1,
1.783335, -1.460092, 1.337581, 1, 1, 1, 1, 1,
1.787085, 0.02677647, 3.195074, 1, 1, 1, 1, 1,
1.791549, 0.1533523, 1.552271, 1, 1, 1, 1, 1,
1.797253, 0.256876, 0.6962666, 1, 1, 1, 1, 1,
1.809144, 1.041943, 0.2972092, 1, 1, 1, 1, 1,
1.814702, 0.07816393, 1.974588, 1, 1, 1, 1, 1,
1.829151, 0.612781, 0.6585003, 1, 1, 1, 1, 1,
1.832836, 1.256217, 0.6434782, 1, 1, 1, 1, 1,
1.850875, 1.804806, 1.428666, 1, 1, 1, 1, 1,
1.869975, 1.313526, 0.01144306, 1, 1, 1, 1, 1,
1.876098, -0.6009595, 2.148904, 1, 1, 1, 1, 1,
1.924869, -0.6792368, -1.440328, 1, 1, 1, 1, 1,
1.961518, 0.4501034, 0.1829496, 1, 1, 1, 1, 1,
1.981699, -0.828039, 2.354848, 1, 1, 1, 1, 1,
2.037409, 0.5194432, 1.888007, 1, 1, 1, 1, 1,
2.045536, 0.8090512, -0.1698273, 0, 0, 1, 1, 1,
2.049922, 0.6916926, 1.217361, 1, 0, 0, 1, 1,
2.090711, -0.6745571, 1.620011, 1, 0, 0, 1, 1,
2.178858, 0.3403188, 2.724677, 1, 0, 0, 1, 1,
2.184765, 0.2988787, 1.377603, 1, 0, 0, 1, 1,
2.214161, -1.09314, 3.468264, 1, 0, 0, 1, 1,
2.263215, -1.906714, 2.716592, 0, 0, 0, 1, 1,
2.293721, -1.50022, 2.496511, 0, 0, 0, 1, 1,
2.301381, 1.024595, 0.5766072, 0, 0, 0, 1, 1,
2.303733, 1.945852, 0.6424826, 0, 0, 0, 1, 1,
2.305501, -0.365202, 0.9635668, 0, 0, 0, 1, 1,
2.387085, 1.199969, 1.405966, 0, 0, 0, 1, 1,
2.444184, -0.450996, 1.917387, 0, 0, 0, 1, 1,
2.527635, 0.04779589, 1.585996, 1, 1, 1, 1, 1,
2.565998, -1.160878, 2.594273, 1, 1, 1, 1, 1,
2.566605, -1.716449, -0.331839, 1, 1, 1, 1, 1,
2.639836, -0.6424453, 1.163417, 1, 1, 1, 1, 1,
2.702975, -1.620884, 2.017935, 1, 1, 1, 1, 1,
3.128365, 0.5988232, 0.6486533, 1, 1, 1, 1, 1,
3.203938, 0.2661114, -0.297981, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.571146;
var distance = 33.61824;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.00450325, -0.2161859, 0.3443992 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.61824);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>